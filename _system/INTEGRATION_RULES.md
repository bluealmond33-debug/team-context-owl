# INTEGRATION_RULES — Branches and PRs

| Kind | Name | Can do | Cannot do |
|---|---|---|---|
| Member work branch | `member/<name>-<task>` | originals, meeting notes, research, worklogs, outputs | change official state/decisions/priorities |
| Integration branch | `integrate/<scope>-YYYY-MM-DD` | combine PRs, update protected files, resolve conflicts | merge to main without lead approval |
| `main` | official baseline | receive reviewed PRs | direct work / direct pushes |

## Protected files
`000 HOME.md`, `AGENTS.md`, `CLAUDE.md`, `ONBOARDING.md`, `TEAM-GUIDE.md`, `_system/**`, `02 Decisions/**`, `05 Tasks/**`, `.github/**` are changed only by the integrator.

## Procedure
1. Members commit evidence and drafts on their work branches.
2. The PR states its scope, sources, and whether it conflicts with existing decisions.
3. The integrator reviews and asks questions where needed.
4. On `integrate/...`, update `CURRENT_STATE`, `DECISION_LOG`, ADRs, and official tasks together.
5. The lead approves the final PR into `main`.

> Enable main branch protection and required reviews in GitHub Settings to make this real access control.
