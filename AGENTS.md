# AGENTS.md — Shared rules for humans and AI

## Start gate — kickoff interview
If the `Status:` line at the top of `_system/KICKOFF_INTERVIEW.md` says `pending`, propose the kickoff interview to the team lead before handling any other request, and run it by that file's rules. When finished, set the status to `done (YYYY-MM-DD)`. If the lead defers, don't push — remind once per new session.

## Working language
The template ships in English. The kickoff interview asks for the team's working language and records it in `_system/KICKOFF_INTERVIEW.md`. Hold all conversation and write all generated notes and summaries in that language; keep file names, folder structure, and status keywords (`pending` / `done`) in English.

## Read these first
1. `000 HOME.md`
2. `_system/CURRENT_STATE.md`
3. `_system/DECISION_LOG.md`
4. Documents in the folders directly relevant to the request

## Working rules
- Never invent unverified facts, decisions, or numbers. If unsure, leave it as an open item or question in `_system/CURRENT_STATE.md`.
- Never delete PDF/PPT/Word/recording originals. Keep originals in `_raw/` and put a readable Markdown digest in the same folder.
- Log your own work in `04 Worklogs/` before and after working.
- Member branches touch only evidence, drafts, and outputs. Only the integrator changes `_system/`, `02 Decisions/`, `05 Tasks/`, and the top-level guide files.
- Anything AI produces — text, code, summaries — ships with its sources and assumptions, left for a human to review.

## AI prototype work
When handing implementation to AI, have it read this repository first, then write or implement Claude Code / Claude Design prompts grounded in the current goal, decisions, and constraints.

## Priority
Direct human instructions > shared rules in this file > AI defaults
