# Research Swarms

Multi-angle research with parallel subagents: Research Swarm maps a topic from 3-5 angles; Outlier Swarm finds contrarian winners through five fixed lenses. One cited report with verdicts.

Author: Ed Dale

License: MIT. See `LICENSE`.

Version: 1.0.0

## Skills

| Skill | Use it when |
| --- | --- |
| `research-swarm` | You need to understand a topic from several angles: how it works, who uses it, what else exists, what it costs. |
| `outlier-swarm` | You want the contrarian read: who breaks the usual rules and still wins. |

Invoke a skill by name, or ask in plain language ("research this from multiple angles", "what's everyone missing about this").

## What you get

Each run writes one cited report. Every finding has a verdict.

Research Swarm verdicts: Act now, Bookmark, Ignore, Needs more research.

Outlier Swarm verdicts: Act now, Bookmark, Research further.

The default save location is `./research-reports/` in the project you have open. The skill creates that folder if it is missing.

## Optional pieces

These steps run only when the tool or file is already available. Otherwise the skill skips them, or runs the angles one by one.

- Subagents, for parallel angles. Without them, angles run one by one. Research Swarm still caps at 5. Outlier Swarm still uses its five lenses.
- A mission-context document, so angles can follow your field, audience, and language. A coaching practice is one example of a field, not the assumed one.
- A notes vault, so prior notes can shape the angles.
- A video transcript tool, for an optional video angle in Research Swarm.
- A daily note, for an optional one-line link after the report is saved.

## Page fetch fallback

Outlier Swarm includes `skills/outlier-swarm/scripts/fetch_page.sh`. It is an optional fallback for when the agent's normal web fetch cannot read a public page. It needs Google Chrome or Chromium. Set `CHROME_PATH` if the binary is not on `PATH`. If Chrome is missing, skip the script.

```bash
skills/outlier-swarm/scripts/fetch_page.sh https://example.com
```

## Logo

`assets/logo.png` is the plugin logo. The manifest references it as `assets/logo.png`.

## Links

- Repository: https://github.com/Eddale/research-swarms
- Powerhouse Lab: https://powerhouselab.ai
