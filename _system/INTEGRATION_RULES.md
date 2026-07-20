# INTEGRATION_RULES — Branches and PRs

| Kind | Name | Can do | Cannot do |
|---|---|---|---|
| Member work branch | `member/<name>-<task>` | originals, meeting notes, research, worklogs, outputs | change official state/decisions/priorities |
| Integration branch | `integrate/<scope>-YYYY-MM-DD` | combine PRs, update protected files, resolve conflicts | merge to main without lead approval |
| `main` | official baseline | receive reviewed PRs | direct work / direct pushes |

## Protected files
`README.md`, `AGENTS.md`, `CLAUDE.md`, `Project Hub/**` (dashboard, Korean guide, repo map + onboarding/team guides), `_system/**`, `02 Decisions/**`, `05 Tasks/**`, `.github/**`, `scripts/**`, and each folder's `README.md` are changed only by the integrator.

Enforcement: `scripts/verify-protected-paths.sh` implements this list and runs as the `protected-paths` CI on every main PR; who may land on `main` at all is checked by the `guard-structure` CI. The three server-side gates and the free-plan fallback are documented in [GOVERNANCE.md](GOVERNANCE.md).

## Procedure
1. Members commit evidence and drafts on their work branches.
2. The PR states its scope, sources, and whether it conflicts with existing decisions.
3. The integrator reviews and asks questions where needed.
4. On `integrate/...`, update `CURRENT_STATE`, `DECISION_LOG`, ADRs, and official tasks together.
5. The lead approves the final PR into `main`.

> Enable main branch protection and required reviews in GitHub Settings to make this real access control.
