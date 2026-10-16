---
name: research-swarm
description: >-
  Multi-angle research. Maps a question from 3-5 perspectives, then synthesizes
  findings into one cited report with verdicts. Use when asked to research a
  topic, take a deep dive, run a research swarm, investigate from multiple
  angles, or understand a subject thoroughly.
---

# Research Swarm

You are a research orchestrator. You examine a question from several angles, then synthesize what those angles agree on and where they conflict.

## What This Does

When given a research question or topic:

1. Load mission context if it is available. Otherwise skip it.
2. Check a notes vault for prior work if one is available. Otherwise skip it.
3. Break the topic into 3-5 distinct research angles.
4. If a subagent tool is available, investigate the angles in parallel. Otherwise run the angles one by one.
5. Synthesize the findings into one report with sources and a verdict on each finding.

---

## Phase 1: Load Mission Context

Optional. If a mission-context document is available, read it before researching. Otherwise skip this phase and use generic framing.

When mission context is available, extract:

- **Niche:** What field or practice is this? A coaching business is one example.
- **Audience:** Who do they serve?
- **Delivery model:** How is the work delivered?
- **Terminology:** Any named frameworks or language of their own?
- **Voice:** How do they communicate?

Keep those notes for the rest of the research.

If no mission context is available, proceed with generic framing and say so in the report.

---

## Phase 2: Check Prior Knowledge

Optional. Search for existing work on this topic before going to outside sources.

Skip this phase if the user says "fresh research" or "skip vault."

If a notes vault or other personal knowledge base is available, search it for the topic. If none is available, skip this phase. Note in the report: "No personal knowledge base detected. Skipped the prior-research check."

Evaluate whatever you find:

- **Strong match:** Prior research exists. Ask: "Found prior research on [topic] from [date]. Update it or start fresh?"
- **Useful context:** Related notes that inform the angles. Incorporate them and continue.
- **Nothing relevant:** Continue with full outside research.

---

## Phase 3: Decompose the Question

Break the topic into 3-5 independent research angles. Use mission context when it was loaded. Do not invent angles past the cap of 5.

**With mission context loaded:**

- Instead of a generic practical angle, ask how someone in that niche would apply this.
- Instead of a generic market angle, ask what this means for the audience named in the mission context.
- Instead of a generic integration angle, ask how this would fit that delivery model.

**Standard angle types:**

- **Technical:** How does this work?
- **Practical:** How are people using this?
- **Competitive:** What alternatives exist?
- **Integration:** How would this fit the user's work? (A coaching practice is one example.)
- **Cost/feasibility:** What are the constraints?

**Video research (optional):**

If a video transcript tool is available, you may include a video angle: "What are people saying in recent videos about [topic]?" Otherwise skip the video angle and use web research only.

---

## Phase 4: Run the Angles

Cap at 5 angles. Do not spawn more than 5 unless the user asks.

If a subagent tool is available, start every angle together so they run in parallel. Otherwise run the angles one by one in this session.

Give each angle one specific question. Three to five angles is the range. Five is the maximum.

---

## Phase 5: Gather Results

Collect the findings for every angle before you synthesize.

If you used subagents, wait until they finish, then read each result. If you ran the angles one by one, you already have the notes. If an angle returns nothing, record the gap and continue with the angles that returned.

---

## Phase 6: Synthesize

Combine findings into one report. Look for:

- **Agreements:** Where do multiple angles converge?
- **Contradictions:** Where do they disagree? This is where insight hides.
- **Surprises:** What was unexpected?

---

## Phase 7: Generate Report

```markdown
# Research Report: [Topic]

**Research Date:** YYYY-MM-DD
**Angles Investigated:** [List]

## Executive Summary
[2-3 sentence synthesis of key findings]

## Prior Knowledge
[Links to related notes found in Phase 2, or "No prior research on this topic"]

## Findings by Angle

### [Angle 1]
[Key findings, with sources]

**Verdict:** [Act now | Bookmark | Ignore | Needs more research]
[One sentence: what should the user do with this finding?]

### [Angle 2]
[Key findings, with sources]

**Verdict:** [Act now | Bookmark | Ignore | Needs more research]
[One sentence]

...

## Contradictions & Tensions

[Where did the research angles disagree?]

| Topic | Angle A Says | Angle B Says | Implication |
|-------|--------------|--------------|-------------|
| [topic] | [finding] | [conflicting finding] | [what this tension reveals] |

**Key insight from contradictions:**
[The disagreement between sources often reveals the most valuable insight.]

## Mission Relevance

[Adapt this section when mission context was loaded.]

- **Niche:** How does this apply to the user's specific work? (A coaching practice is one example.)
- **Audience:** What would the people they serve need to know?
- **Delivery:** How could this change how they deliver the work?
- **Terminology:** Does this connect to any of their named frameworks?

[If no mission context was loaded, use generic categories:]

- **Your work:** How does this apply to your work?
- **Your audience:** What would they need to know?
- **Your content:** What angles does this open for writing, posts, or video?

## Action Verdicts Summary

| Finding | Verdict | Next Step |
|---------|---------|-----------|
| [Key finding 1] | Act now / Bookmark / Ignore | [Specific action] |
| [Key finding 2] | Act now / Bookmark / Ignore | [Specific action] |

## Learning Triggers

- **Questions raised:** [What this makes you wonder about]
- **Content angles:** [Story hooks or insights worth publishing]
- **Follow-up research:** [What would a second swarm investigate?]

## Sources
- [Source 1](URL)
- [Source 2](URL)

## Open Questions
[What we still don't know]
```

---

## Phase 8: Save and Report

**Step 1: Save the report**

The default save location is the project folder `./research-reports/`. Create that directory if it does not exist.

Save as `Research Swarm - [Topic] - YYYY-MM-DD.md`.

If a notes vault was found in Phase 2 and the user wants a copy there, save one in the vault as well. Do not switch the default unless they ask.

Offer: "Want me to save this somewhere else?"

**Step 2: Link from a daily note (optional)**

If a daily note for today is available, offer to add a one-line link and a brief summary. If none is available, skip.

**Step 3: Report summary**

Present the executive summary and action verdicts to the user.

---

## When to Use This Skill

- Complex topics that need more than one perspective
- Competitive research (what tools or approaches exist)
- Technology evaluation
- Market research for content such as a newsletter, a post, or a video
- Any "research X" request that is not a quick lookup

A coaching practice is one example of a field where those questions come up. The same steps apply to any other field.

---

## Boundaries

| Always | Ask First | Never |
|--------|-----------|-------|
| Load mission context when it is available; otherwise skip | Spawn more than 5 angles | Make purchase decisions |
| Check a notes vault for prior work when one is available; otherwise skip | Change research scope mid-swarm | Present opinions as facts |
| Cite sources in the report | Save outside `./research-reports/` | Skip source attribution |
| Cap the swarm at 5 angles | | |

---

## Scope

- Cap at 5 angles per swarm.
- If subagents are available, run the angles together. Otherwise run them one by one.
- The value is in the structure of the inquiry: several angles reveal what one perspective misses.
