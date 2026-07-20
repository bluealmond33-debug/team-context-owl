# AGENTS.md — Shared rules for humans and AI

## Start gate — kickoff interview
If the `Status:` line at the top of `_system/KICKOFF_INTERVIEW.md` says `pending`, propose the kickoff interview to the team lead before handling any other request, and run it by that file's rules. When finished, set the status to `done (YYYY-MM-DD)`. If the lead defers, don't push — remind once per new session.

## Working language
The template ships in English. The kickoff interview asks for the team's working language and records it in `_system/KICKOFF_INTERVIEW.md`. Hold all conversation and write all generated notes and summaries in that language; keep file names, folder structure, and status keywords (`pending` / `done`) in English.

## Read these first
1. `Project Hub/HOME.md`
2. `_system/CURRENT_STATE.md`
3. `_system/DECISION_LOG.md`
4. Documents in the folders directly relevant to the request

## Context management — humans upload, AI organizes
- **Humans only upload into `00 Inbox/`.** The numbered folders (01–07), `_system/`, and the folder structure are created and organized **by AI/automation under owner oversight**. This keeps the context curated to one consistent standard.
- Non-owners never modify the base folder structure. The protected-file list lives in `_system/INTEGRATION_RULES.md`; who counts as an owner is defined in `_system/GOVERNANCE.md` (template placeholder: `{{OWNER_HANDLE}}`).
- **AI confirms with the branch's human before pushing.** Especially after digesting new Inbox material: ask "I organized it — push?" and only then push.
- The default is **single-writer mode**: `protected-paths` CI and `guard-structure` CI provide signals, not required merge gates. Before a fork or multi-writer transition, explicitly choose whether to enable branch protection, Code Owners review, and required checks. *"Was it AI or a human" cannot be told apart technically — enforcement works by path + authenticated PR author and, in team mode, approval instead.* Details: `_system/GOVERNANCE.md`.

## Inbox processing — all four steps, one commit
An item counts as "organized" only when ALL of the following are done. If any is missing, it is not organized:

1. **Digest** — a readable `.md` summary exists in the destination folder (01–07).
2. **Original moved** — the original is moved (not deleted) to the destination folder's `_raw/` (`_system/UPLOAD_RULES.md`). It does not stay in `00 Inbox/_raw/`.
3. **Link** — the origin link at the top of the digest points to the **final location** (the destination folder's `_raw/`). No link may keep pointing into `00 Inbox`.
4. **Inbox emptied** — the item is removed from `00 Inbox`, and its `INTAKE_INDEX.md` row is set to `classified` with the final location. If it is a duplicate (original/digest already elsewhere), delete only the Inbox copy.

> ⚠️ **`00 Inbox` does not empty itself.** Moving and emptying is the organizer's job and happens **in the same commit** as the digest. If anything other than `README.md`, `INTAKE_INDEX.md`, and an empty `_raw/` remains in `00 Inbox` before commit, processing is not finished.

## Working rules
- Never invent unverified facts, decisions, or numbers. If unsure, leave it as an open item or question in `_system/CURRENT_STATE.md`.
- Never delete PDF/PPT/Word/recording originals. Keep originals in `_raw/` and put a readable Markdown digest in the same folder.
- Log your own work in `04 Worklogs/` before and after working.
- Member branches touch only evidence, drafts, and outputs. Only the integrator changes `_system/`, `02 Decisions/`, `05 Tasks/`, and the guide files (repo root + `Project Hub/`).
- Anything AI produces — text, code, summaries — ships with its sources and assumptions, left for a human to review.

## AI prototype work
When handing implementation to AI, have it read this repository first, then write or implement Claude Code / Claude Design prompts grounded in the current goal, decisions, and constraints.

## Priority
Direct human instructions > shared rules in this file > AI defaults
