# BRANCH_LIFECYCLE — Keeping branches from piling up

## Purpose

Work branches are not left unattended forever. But branches with unique commits are never auto-deleted or force-reset to main either. The order is always **audit → confirm with the owner → selectively integrate/archive → clean up**.

## States

| State | Criteria | Next action |
|---|---|---|
| active | being worked on, or has an open PR | owner keeps working / updates the PR |
| review | unique commits ahead of `main`, but no PR | within 7 days the owner picks: PR, archive, or drop |
| stale | no updates for 14+ days and behind main | the automated audit reports it; confirm with the owner |
| cleanable | 0 ahead of `main` | deletion candidate after checking external references |
| archived | review concluded keep-only | tag `archive/<original branch>`, then the branch may be deleted |

## Reusing a personal branch

If you want to keep using the same work branch (`member/<name>-<task>`) for the next task, run this only after your PR has merged to main:

```bash
git fetch origin
git switch member/<name>-<task>
git status --short  # must be empty
git reset --hard origin/main
git push --force-with-lease origin member/<name>-<task>
```

- The name stays; only the content is aligned with main.
- Never run this while you have work not yet in a PR.
- Never force-push someone else's branch.

## Scope of automation

`.github/workflows/branch-audit.yml` produces a weekly **read-only audit report**. It computes each branch's ahead/behind and days since its last commit, flags stale (14-day) candidates from the table above, and posts the result to the repository's "Branch audit report" issue. It never auto-deletes or auto-resets. Automation that destroys unique work is dangerous and requires an explicit decision by the owner and the lead.
