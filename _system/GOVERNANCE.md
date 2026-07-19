# GOVERNANCE — How context curation is enforced

> Goal: **humans only upload into `00 Inbox/`; the numbered folders (01–07), `_system/`, and the folder structure are created and organized by AI/automation under owner approval.** That is what keeps the context curated to one consistent standard.
>
> Sister document: [INTEGRATION_RULES.md](INTEGRATION_RULES.md) — the protected-file list and the integration-branch (`integrate/*`) procedure.
> **Role split:** INTEGRATION_RULES + the `protected-paths` CI answer *which files* are protected (branch-based; `integrate/*` passes). This document + the `guard-structure` CI answer *who* — owner vs non-owner — may land what on `main` (author-based; owners pass). Integration-branch PRs are opened by an owner, so they pass both checks.

## First, the technical limits (know them precisely)

- **"Did AI or a human make this commit" cannot be distinguished.** Git's author/committer fields and `Co-Authored-By` trailers are plain text anyone can set — forgeable. "Detect and block human commits" is impossible in principle.
- So enforcement works **not by "who typed it" but by path + approval + PR author**. The PR author is GitHub-authenticated and cannot be forged.
- **Client-side hooks (pre-commit/pre-push) are not walls** — they don't come along with a clone and are bypassed with `--no-verify`. They can help; they cannot enforce. Real enforcement is server-side on GitHub only.

## Enforcement scope

- **Personal branches (`member/*`) = free.** This is where AI works and where humans upload into `00 Inbox` freely.
- **`main` = locked (the canonical context).** Only material organized and verified on personal branches enters, through an owner-approved PR.

## The three gates (all server-side = not bypassable)

1. **Branch protection on `main`** — no direct pushes, PR required, ≥1 approval, "Require review from Code Owners" ON, and the `guard` check marked **required**.
2. **CODEOWNERS** (`.github/CODEOWNERS`) — every path owned by the owner(s), so no main PR merges without owner approval. Replace `{{OWNER_HANDLE}}` with the real handle(s); a wrong handle silently disables the gate.
3. **guard-structure Action** (`.github/workflows/guard-structure.yml`) — if a main PR's author is not in the OWNERS list and the PR touches anything outside `00 Inbox/`, the check **fails automatically**. It only becomes a wall once marked "required" in branch protection.

## What the owner enables once (Settings or gh)

> **Plan caveat (measured in practice):** on the **free plan, branch protection on a *private* repository returns 403** ("Upgrade to GitHub Pro or make this repository public"). Your options:
>
> - **Public repository** → branch protection is free. But this template recommends running team repos private; going public means every sensitive detail must live in gitignored `*.local.md` files and the team accepts the exposure.
> - **Private repository + GitHub Pro** (paid) → the full enforcement below works.
> - **Private repository + free plan → CI signal mode (the default fallback):** `guard-structure` and `protected-paths` still run on every main PR and paint a red ❌ on violations. Merging isn't physically blocked, but ignoring a red check is a rule break the whole team can see — with attentive owners on a small team, that is real deterrence. In this mode CODEOWNERS only auto-requests review; it cannot require it.

```bash
# main protection: PR required + 1 approval + Code Owners review + required guard check + no direct pushes
gh api -X PUT "repos/{{OWNER_HANDLE}}/{{REPO}}/branches/main/protection" \
  -H "Accept: application/vnd.github+json" \
  -f 'required_status_checks[strict]=true' \
  -f 'required_status_checks[checks][][context]=guard' \
  -F 'enforce_admins=false' \
  -F 'required_pull_request_reviews[required_approving_review_count]=1' \
  -F 'required_pull_request_reviews[require_code_owner_reviews]=true' \
  -F 'restrictions=null'
# (Confirm the check's context name in the Checks tab after the Action has run once — usually "guard".)
```

> ⚠️ **You cannot approve your own PR.** With a single owner, that owner's PRs would be stuck. Either keep two owners who approve each other, or leave `enforce_admins=false` so an admin can bypass when needed.

## The daily flow (what AI must follow — also stated in AGENTS.md)

1. A human uploads originals into `00 Inbox` on a personal branch.
2. AI runs the four Inbox steps (AGENTS.md → "Inbox processing"): digest into 01–07, move the original to the destination `_raw/`, point the origin link at the final location, empty the Inbox — all in one commit.
3. **AI confirms with the branch's human before pushing.**
4. `main` changes land only via owner-approved PRs. Structure and context changes are filtered here.

## Reverting

Everything is reversible: `gh api -X DELETE "repos/{{OWNER_HANDLE}}/{{REPO}}/branches/main/protection"` lifts protection; deleting the CODEOWNERS/workflow files restores the previous state.
