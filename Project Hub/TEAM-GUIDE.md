# TEAM GUIDE — Using this without knowing Git

> Just joined? Follow **step 2 — Members join** in `Project Hub/ONBOARDING.md`. This document is the everyday manual you keep using afterwards.

## Adding material
- Anything unsorted — links, photos, PDFs, PPTs, meeting transcripts — goes into `00 Inbox/`.
- Ask the AI: "Keep the original and digest this into Markdown."

## Publishing your work
1. Create a `member/<name>-<task>` branch.
2. Meeting notes go to `01 Meetings/`, research to `03 Research/`, personal notes to `04 Worklogs/`, deliverables to `07 Outputs/`.
3. Write commit messages that say what you did and where the original lives.
4. Open a PR and request integration. In team mode, request review from the integrator; in the default single-writer mode, the owner verifies the PR scope and CI before merging.

## Files you must not edit directly
`HOME.md`, `AGENTS.md`, `CLAUDE.md`, `ONBOARDING.md`, `TEAM-GUIDE.md`, `_system/`, `02 Decisions/`, `05 Tasks/` are the team's official baseline. If a change is needed, explain why in a PR and request integration.

## What you can ask the AI
- "What has been done so far?" → answers from `CURRENT_STATE`, recent meeting notes, and worklogs.
- "Why did we go this direction?" → answers from the decision log and ADRs.
- "Write a Claude Design prompt for this prototype." → it reads current state and decisions first.
