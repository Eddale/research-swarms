#!/usr/bin/env bash
# Optional fallback: print the DOM of one public http(s) page.
# Needs Google Chrome or Chromium. If neither is installed, say so and exit.
# Skip this script when the agent's normal web fetch already works.
# Some Chrome builds print the DOM and then keep running. This script stops
# the browser once the output has settled, or after 45 seconds.
set -euo pipefail

usage() {
  echo "usage: scripts/fetch_page.sh <https-url>" >&2
  echo "Optional fallback. Needs Chrome or Chromium. Skip it when Chrome is absent." >&2
}

if [[ $# -ne 1 || "$1" == "-h" || "$1" == "--help" ]]; then
  usage
  exit 2
fi

url="$1"
if [[ ! "$url" =~ ^https?:// ]]; then
  echo "Refusing to fetch. Pass an http or https URL." >&2
  exit 2
fi

find_chrome() {
  local candidate resolved
  local -a candidates=()
  if [[ -n "${CHROME_PATH:-}" ]]; then
    candidates+=("$CHROME_PATH")
  fi
  candidates+=(
    google-chrome
    google-chrome-stable
    chromium
    chromium-browser
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
    "/Applications/Chromium.app/Contents/MacOS/Chromium"
  )
  for candidate in "${candidates[@]}"; do
    if [[ "$candidate" == */* ]]; then
      if [[ -x "$candidate" ]]; then
        printf '%s\n' "$candidate"
        return 0
      fi
    else
      resolved="$(command -v "$candidate" 2>/dev/null || true)"
      if [[ -n "$resolved" ]]; then
        printf '%s\n' "$resolved"
        return 0
      fi
    fi
  done
  return 1
}

chrome="$(find_chrome)" || {
  echo "Chrome is not available. Skip this fallback and use sources you can already read." >&2
  exit 1
}

tmpdir="$(mktemp -d)"
outfile="${tmpdir}/dom.html"
errfile="${tmpdir}/chrome.err"
stop_chrome() {
  if [[ -z "${chrome_pid:-}" ]]; then
    return
  fi
  if kill -0 "$chrome_pid" 2>/dev/null; then
    kill -- -"$chrome_pid" 2>/dev/null || kill "$chrome_pid" 2>/dev/null || true
    wait "$chrome_pid" 2>/dev/null || true
  fi
  chrome_pid=""
}
cleanup() {
  stop_chrome
  rm -rf "$tmpdir"
}
trap cleanup EXIT

if command -v setsid >/dev/null 2>&1; then
  setsid "$chrome" \
    --headless \
    --disable-gpu \
    --no-first-run \
    --user-data-dir="${tmpdir}/profile" \
    --dump-dom \
    "$url" >"$outfile" 2>"$errfile" &
else
  "$chrome" \
    --headless \
    --disable-gpu \
    --no-first-run \
    --user-data-dir="${tmpdir}/profile" \
    --dump-dom \
    "$url" >"$outfile" 2>"$errfile" &
fi
chrome_pid=$!

stable=0
last=-1
for _ in $(seq 1 45); do
  if ! kill -0 "$chrome_pid" 2>/dev/null; then
    wait "$chrome_pid" 2>/dev/null || true
    chrome_pid=""
    break
  fi
  size=0
  if [[ -f "$outfile" ]]; then
    size=$(wc -c < "$outfile" | tr -d ' ')
  fi
  if [[ "$size" -gt 0 && "$size" == "$last" ]]; then
    stable=$((stable + 1))
    if [[ "$stable" -ge 2 ]]; then
      stop_chrome
      break
    fi
  else
    stable=0
    last=$size
  fi
  sleep 1
done

stop_chrome

if [[ ! -s "$outfile" ]]; then
  echo "Chrome produced no page text. Skip this fallback." >&2
  if [[ -s "$errfile" ]]; then
    tail -n 5 "$errfile" >&2
  fi
  exit 1
fi

cat "$outfile"
