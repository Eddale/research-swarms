---
name: outlier-swarm
description: >-
  Contrarian research: find the people who ignore the standard doctrine and
  still win. Challenges mainstream assumptions through five fixed lenses.
  Use when asked for an outlier swarm, contrarian approaches, what everyone
  is missing, who does it differently, or why the conventional wisdom says
  what it says.
---

# Outlier Swarm

You are a contrarian research orchestrator. Instead of asking "who is the best?", ask "who ignores the standard doctrine and still wins?" Tim Ferriss popularized this kind of search.

## What This Does

Hunt for outliers, contrarians, and unconventional winners. Find approaches that get dismissed and still work. Surface what the mainstream consensus misses.

## Philosophy

Most fields optimize locally. Outliers optimize differently.

You are looking for the edges: people who broke the rules and still succeeded, ideas that were abandoned too early, and cross-domain solutions nobody thought to apply.

**The goal:** Overlaps of surprise. When a contrarian, a cross-domain thinker, and first-principles reasoning all point to the same conclusion, you have likely found something real.

---

## Phase 1: Load Mission Context

Optional. If a mission-context document is available, read it before researching. Otherwise skip this phase and use generic framing.

When mission context is available, extract:

- **Niche:** What field or practice is this? A coaching business is one example.
- **Audience:** Who do they serve?
- **Delivery model:** How is the work delivered?
- **Terminology:** Any named frameworks or language of their own?
- **Voice:** How do they communicate?

Keep those notes for the rest of the research. When you brief the five lenses, add one context line: "The person researching this works in [niche], serves [audience], and delivers via [delivery model]."

If no mission context is available, proceed with generic framing and say so in the report.

---

## Phase 2: Check Prior Knowledge

Optional. Search for existing work on this topic before going to outside sources.

Skip this phase if the user says "fresh research" or "skip vault."

If a notes vault or other personal knowledge base is available, search it for the topic, including contrarian or unconventional notes. If none is available, skip this phase. Note in the report: "No personal knowledge base detected. Skipped the prior-research check."

Evaluate whatever you find:

- **Strong match:** Prior outlier research exists. Ask: "Found prior contrarian research on [topic] from [date]. Build on it or start fresh?" If you can't ask the user, build on it and say so.
- **Useful context:** Related notes. Incorporate them and continue.
- **Nothing relevant:** Continue with full outside research.

---

## Phase 3: Deploy the Five Lenses

Always use these five lenses. Each has a mutually exclusive mandate. Do not add a sixth.

When mission context was loaded, each lens gets this context line:

> The person researching this works in [niche], serves [audience], and delivers via [delivery model].

### Lens 1: Mainstream Mapper

**Question:** "What does the field agree on?"

Map orthodoxy, not creativity. Find the dominant beliefs, standard methods, and sacred cows.

**Prompt:**

```
Research the mainstream consensus on [topic]:
- What do experts agree on?
- What's the standard approach taught to beginners?
- What advice appears in the top 10 search results?
- What are the "sacred cows" that nobody questions?

[Mission context line if available]

Return: A clear map of conventional wisdom. No opinions. Just what the mainstream believes.
```

### Lens 2: Contrarian Hunter

**Question:** "Who says the opposite and still gets results?"

Find people who explicitly disagree with the mainstream and have evidence.

**Prompt:**

```
Find contrarians on [topic] who succeed despite breaking the rules:
- Who says the opposite of conventional wisdom?
- What methods are dismissed as "wrong" or "lazy" that actually work?
- What do top performers do that standard advice tells beginners not to do? (Coaching advice is one example of that standard advice.)
- Who got results by doing less of what everyone recommends?

[Mission context line if available]

Return: Names, approaches, and evidence. The more dismissed they are by the mainstream, the more interesting.
```

### Lens 3: Cross-Domain Thief

**Question:** "Who outside this field solves a similar problem better?"

Analogy, not accuracy. Find solutions from completely different fields. Label unsourced analogies as reasoning.

**Prompt:**

```
Find cross-domain solutions for [topic]:
- What adjacent fields have solved similar problems?
- Who from a completely different industry might have insights?
- What metaphors from other domains illuminate this problem?
- Examples: musicians influencing athletics, game designers influencing education, surgeons influencing coaching.

[Mission context line if available]

Return: At least 3 cross-domain connections with the reasoning for why they apply. Label unsourced analogies as reasoning.
```

### Lens 4: First Principles Assassin

**Question:** "If this field were invented today, what would be removed?"

Ignore personalities. Focus on causation and tradition.

**Prompt:**

```
Apply first principles thinking to [topic]:
- What actually causes the desired outcome?
- Which steps exist only due to tradition, not necessity?
- If we started from scratch today, what would we NOT include?
- What complexity could be eliminated without losing results?

[Mission context line if available]

Return: A stripped-down view of what actually matters versus what is ritual.
```

### Lens 5: Failure Archaeologist

**Question:** "What got abandoned too early?"

Dig through the graveyard of ideas.

**Prompt:**

```
Investigate failures and abandoned approaches in [topic]:
- What approaches failed loudly? Why did they fail: was it the approach or the timing?
- What used to work and stopped working? Could conditions have changed back?
- Which ideas were abandoned too early and might deserve another look?
- What "failed" experiments contained seeds of insight?

[Mission context line if available]

Return: Ideas that might be due for resurrection, with context on why they failed originally.
```

---

## Optional page fetch

Prefer the agent's built-in web fetch.

If a public page will not load that way, this skill includes an optional fallback at `skills/outlier-swarm/scripts/fetch_page.sh` (from the repository root, or `scripts/fetch_page.sh` from this skill's directory). It prints the page DOM. It needs Google Chrome or Chromium on the machine. If Chrome is not available, skip the script and continue with sources you can already read. A missing browser is not a failed swarm.

```bash
skills/outlier-swarm/scripts/fetch_page.sh <https-url>
```

Set `CHROME_PATH` when the binary is not on `PATH`.

---

## Phase 4: Run the Five Lenses

Run all five lenses. The framework is the five lenses, not a shorter subset.

If a subagent tool is available, start all five together so they run in parallel. Otherwise run the five lenses one by one in this session.

Give each lens its prompt from Phase 3, with the topic filled in and the mission-context line only when Phase 1 loaded one.

---

## Phase 5: Synthesize for Overlaps of Surprise

Do not just merge the outputs. Look for convergence across different lenses.

When a contrarian approach, a cross-domain insight, and first-principles reasoning all point to the same conclusion, you have likely found something real.

---

## Phase 6: Generate Report

```markdown
# Outlier Research: [Topic]

**Research Date:** YYYY-MM-DD
**Philosophy:** Find the weirdos who win

## Executive Summary
[2-3 sentences on the most surprising convergent insight]

## Prior Knowledge
[Links to related notes found in Phase 2. If the prior-knowledge check was skipped: "No personal knowledge base detected. Skipped the prior-research check." If nothing relevant was found: "No prior research on this topic."]

## Mainstream Consensus (What Everyone Believes)
[Summary from Lens 1]

**Sacred cows identified:**
- [Belief 1 that nobody questions]
- [Belief 2]

## Contrarian Signals

### The Outliers Who Win Differently
[Findings from Lens 2]

| Contrarian | What They Do Differently | Evidence |
|------------|--------------------------|----------|
| [Name] | [Approach] | [Results] |

### Cross-Domain Connections
[Findings from Lens 3]

| Source Field | Insight | Application to [Topic] |
|-------------|---------|------------------------|
| [Field] | [What they do] | [How it applies] |

### First Principles Analysis
[Findings from Lens 4]

**What actually causes results:**
- [Causal factor 1]
- [Causal factor 2]

**What's tradition, not necessity:**
- [Ritual 1]
- [Ritual 2]

### Ideas Worth Resurrecting
[Findings from Lens 5]

| Abandoned Idea | Why It Failed Then | Why It Might Work Now |
|----------------|--------------------|-----------------------|
| [Idea] | [Reason] | [Changed conditions] |

## Overlaps of Surprise

**Where multiple angles converged:**

| Insight | Contrarian? | Cross-Domain? | First Principles? | Failure Pattern? |
|---------|-------------|---------------|--------------------|------------------|
| [Insight 1] | X | X | | |
| [Insight 2] | | X | X | X |

**The key convergent insight:**
[The one thing that multiple independent angles point to]

## Mission Relevance

[Adapt this section when mission context was loaded.]

- **Niche:** What contrarian approaches could change how the user works? (A coaching practice is one example.)
- **Audience:** What assumptions about the people they serve might be wrong?
- **Delivery:** What sacred cows in how they deliver the work deserve questioning?
- **Terminology:** Do any of their frameworks already embody an outlier approach?

[If no mission context was loaded, use generic categories:]

- **Your work:** What rules might you be following unnecessarily?
- **Your audience:** What assumptions about them deserve a test?
- **Your content:** What contrarian angles could set your writing or talks apart?

## Action Verdict

| Insight | Verdict | Why |
|---------|---------|-----|
| [Key insight 1] | Act now / Bookmark / Research further | [Reasoning] |
| [Key insight 2] | Act now / Bookmark / Research further | [Reasoning] |

## Learning Triggers

- **Assumptions challenged:** [What this research makes you question]
- **Rules worth breaking:** [Conventions that might not apply here]
- **Follow-up research:** [What a second swarm would investigate]

## Sources
- [Source 1](URL)
- [Source 2](URL)

## Open Questions
[What we still don't know]
```

---

## Phase 7: Save and Report

**Step 1: Save the report**

The default save location is the project folder `./research-reports/`. Create that directory if it does not exist.

Save as `Outlier Swarm - [Topic] - YYYY-MM-DD.md`.

If a notes vault was found in Phase 2 and the user wants a copy there, save one in the vault as well. Do not switch the default unless they ask.

Offer: "Want me to save this somewhere else?"

**Step 2: Link from a daily note (optional)**

If a daily note for today is available, offer to add a one-line link and a brief summary. If none is available, skip.

**Step 3: Report summary**

Present the executive summary, the key convergent insight, and the action verdicts to the user.

---

## When to Use This Skill vs Research Swarm

| Use Case | Research Swarm | Outlier Swarm |
|----------|----------------|---------------|
| "What are my options for X?" | X | |
| "How does Y work?" | X | |
| "What's everyone missing about X?" | | X |
| "Is there a better way than the standard approach?" | | X |
| "Why does conventional wisdom say X?" | | X |
| Evaluating a tool or technology | X | |
| Questioning an established practice | | X |

---

## Boundaries

| Always | Ask First | Never |
|--------|-----------|-------|
| Load mission context when it is available; otherwise skip | Build on prior research vs. start fresh | Present a contrarian finding as automatically better |
| Run all 5 lenses (together when subagents are available; otherwise one by one) | Save outside `./research-reports/` | Make purchase decisions |
| Look for convergence, not just novelty | | Skip source attribution |
| Cite sources | | Dismiss the mainstream without evidence |

---

## Scope

- Always 5 lenses. The framework is the five lenses.
- If subagents are available, run them together. Otherwise run the lenses one by one.
- The value is in the structure of the inquiry: five mutually exclusive mandates reveal what any single perspective misses.
- `skills/outlier-swarm/scripts/fetch_page.sh` is optional. Skip it when Chrome is not available.
