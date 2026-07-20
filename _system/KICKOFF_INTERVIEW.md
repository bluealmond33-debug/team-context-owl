# KICKOFF_INTERVIEW — Project start interview

Status: pending
Language: not set

> While `Status:` above is `pending`, the AI proposes this interview to the team lead before any other work (see the start gate in `AGENTS.md`).
> When the interview ends, the AI changes the first line to `Status: done (YYYY-MM-DD)`. Reset it to `pending` to run it again.

## Purpose

When a new team adopts this template, the AI interviews the team lead for team makeup, contacts, strengths, team norms, and goals, then fills the official documents. The lead never has to edit placeholder files by hand.

## Rules for the AI

1. **Ask the working language first.** Before anything else, ask which language the team works in (e.g., English, Korean). Record it in the `Language:` line above, then conduct the interview — and write all generated notes — in that language. File names, folder structure, and the `Status:` keywords stay in English.
2. Ask the five groups below **one group at a time**. Never all at once.
3. Items marked **(required)** must be answered. Everything else can be skipped; skipped items go to the open questions in `_system/CURRENT_STATE.md`.
4. **Sensitive data rule**: check repository visibility at the start (`gh repo view --json visibility` or ask the lead). Team repositories default to **private** — if the repo turns out to be public, first recommend switching it to private (Settings → General → Danger Zone → Change visibility). If it stays public anyway, never write phone numbers or personal emails into any committed file; record them only in `_system/TEAM_CONTACTS.local.md` (gitignored, exists only on the lead's machine). If private, the lead may choose to keep them in `_system/TEAM.md`.
5. Never invent answers. If something is ambiguous, ask again; if undecided, leave it open.
6. When the interview ends, update the documents per **Where answers go**, show the lead the list of changed files, and offer to commit.
7. Finally, update the `Status:` line of this file.
8. **Governance placeholders**: if `{{OWNER_HANDLE}}` remains in `.github/CODEOWNERS` or `.github/workflows/guard-structure.yml`, offer to replace it with the lead's/integrator's GitHub handles collected in group 2. Until replaced, CODEOWNERS is inert and guard-structure passes neutrally with a warning (see `_system/GOVERNANCE.md`).
9. This interview is step 1 of `00 Project Hub/ONBOARDING.md`. On completion, point the lead to the next steps — inviting members (if step 0 was skipped) and member onboarding PRs (step 2).

## Question groups

### 1) Project and goals (required)
- Project name and one-line definition — whose problem does it solve
- What the team wants out of this project — the shared goal (e.g., award, grade, portfolio, real users)
- Definition of success — what must exist on deadline day to call it a success
- Final deadline and intermediate milestones (presentation and submission dates)

### 2) Team makeup (required: headcount and each member's name/alias)
- Number of members, each member's name or alias
- Who is the lead, who is the integrator
- Is the repository private or public (this changes where sensitive data goes)

### 3) Contacts (per member)
- GitHub ID (needed for collaboration — recommended)
- Handles for whatever the team uses: Discord, Slack, Gmail, Figma, phone (sensitive), etc.
- One primary channel, plus the channel for urgent matters
- Expected response time (e.g., within 24 hours)

### 4) Strengths, roles, availability (per member)
- What they're good at (e.g., presenting, design, data analysis, writing, code)
- The role they want, and what they want to learn from this project
- Weekly hours available and hard-blocked time slots (including schedule risks like exam periods)
- Git/GitHub familiarity (identifies who needs `00 Project Hub/TEAM-GUIDE.md`)

### 5) Team norms — what we ask of each other
- Meetings: cadence, day/time, rules for lateness and absence
- When someone can't make a deadline: by when, and whom, must they tell
- Decision-making style (consensus / majority / lead decides) and the tie-breaker
- How conflict or free-riding is handled
- Anything else members want from each other (open)

## Where answers go

| Collected | Written to |
|---|---|
| Project name, one-line definition, phase | `000 HOME.md`, `_system/CURRENT_STATE.md` |
| Goals, definition of success, milestones | `000 HOME.md`, `_system/CURRENT_STATE.md` (milestones as next tasks) |
| Members, roles, integration rights, public handles | `_system/TEAM.md` |
| Per-member strengths, availability, personal goals | `06 Team/<alias>.md` (use `99 Templates/member.md`) |
| Team norms | `_system/WORKING_AGREEMENTS.md` |
| Sensitive contacts (phone, personal email) | `_system/TEAM_CONTACTS.local.md` — **never committed**, lead's machine only |

## TEAM_CONTACTS.local.md format (gitignored — never committed)

```md
# TEAM_CONTACTS (local only — never pushed to git)

| Name | Phone | Email | Notes |
|---|---|---|---|
| [name] | [number] | [address] | - |
```
