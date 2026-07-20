# ONBOARDING — How a team gets started

> Goal: within two days, everyone starts their first task on the same context.
> The lead runs steps 0–1, members run step 2, everyone runs step 3.

## Progress check

| Step | Owner | Time | Done when |
|---|---|---:|---|
| 0. Repo setup | Lead | 10 min | Private repo created + all members invited |
| 1. Kickoff interview | Lead + AI | 20 min | `KICKOFF_INTERVIEW.md` status `done`, official docs filled |
| 2. Members join | Each member | 15 min | Each member's onboarding PR merged |
| 3. First meeting | Everyone | 30 min | Working agreements confirmed + top-3 next tasks set |

## Step 0 — Repo setup (lead)

1. Create the team repository with **Use this template**, and make sure to pick **Private**.
   - The repository accumulates contact handles, meeting notes, unconfirmed ideas, even conflict records. **Always run it private**; consider going public only after the project ends and sensitive content has been scrubbed.
   - GitHub's free plan allows unlimited collaborators on private repositories.
2. In Settings → Collaborators, invite every member with **Write** access.
3. Replace the `{{OWNER_HANDLE}}` placeholders with the integrator's GitHub handle in `.github/CODEOWNERS` and `.github/workflows/guard-structure.yml` (the kickoff interview offers to do this for you).
4. Enable enforcement per `_system/GOVERNANCE.md`: on a public repo (or private + GitHub Pro), turn on `main` branch protection with Code Owners review and the required `guard` check. On a private repo with the free plan, branch protection returns 403 — the checks still run in **CI signal mode** (red ❌ on violations; merging isn't physically blocked).
5. Check the Actions tab to confirm workflows are enabled (weekly Branch audit + the two PR guards).

## Step 1 — Kickoff interview (lead + AI)

1. Clone the repository and open it with an AI tool like Claude Code or Codex.
2. The start gate in `AGENTS.md` launches the kickoff interview. It first asks for the team's working language, then walks through team makeup, contacts, strengths, team norms, and goals, and fills `_system/TEAM.md`, `_system/WORKING_AGREEMENTS.md`, `HOME.md`, `_system/CURRENT_STATE.md`, and `06 Team/*`.
3. Without AI, walk through the question groups in `_system/KICKOFF_INTERVIEW.md` and fill the same files yourself.
4. Commit and push the result. Team norms and member profiles are **drafts** at this point — they get confirmed in step 3.

## Step 2 — Members join (each member)

This doubles as a rehearsal of your first PR. New to Git? Keep `Project Hub/TEAM-GUIDE.md` open beside you.

1. Accept the invite and clone the repository.
2. Read in order: `HOME.md` → `_system/WORKING_AGREEMENTS.md` (draft) → `06 Team/<your-alias>.md`. (10 min)
3. Create a `member/<name>-onboarding` branch.
4. Review and improve your own profile (`06 Team/<your-alias>.md`) that the lead drafted — strengths, availability, what you want to learn.
5. Add one line to `04 Worklogs/YYYY-MM-DD-<alias>.md`: that you finished onboarding, plus one line of feedback on the norms draft if you have any.
6. Open a PR and get the lead's review and merge. **When this PR merges, your onboarding is done.**

## Step 3 — First meeting (everyone)

1. Read `_system/WORKING_AGREEMENTS.md` together; revise and confirm it. Address feedback left in onboarding PRs here.
2. Once confirmed, record "team norms v1 confirmed" in `_system/DECISION_LOG.md`.
3. Confirm the top-3 next tasks and their owners in `_system/CURRENT_STATE.md`.
4. Save the meeting notes as `01 Meetings/YYYY-MM-DD-kickoff.md` using `99 Templates/meeting.md`.

## Definition of done

- [ ] Repo private + everyone invited and cloned
- [ ] `KICKOFF_INTERVIEW.md` status `done`
- [ ] One onboarding PR merged per member
- [ ] `WORKING_AGREEMENTS.md` confirmed + logged in `DECISION_LOG.md`
- [ ] Top-3 next tasks in `CURRENT_STATE.md`
