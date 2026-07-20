# Context Hippo 🦛

<p align="center">
  <img src="assets/context-hippo-hero.png" alt="Context Hippo mark — a black hippo with its mouth wide open" width="380" />
</p>

<p align="center"><b>English</b> · <a href="00%20Project%20Hub/README.ko.md">한국어</a></p>

An Obsidian + GitHub template that takes your team's scattered chats, meetings, links, and documents and **digests them into shared context** that humans and AI read together.

Context Hippo is not a service that processes everything automatically. Instead, it defines where raw material goes, what gets digested into Markdown, and what becomes official decisions and current state. Humans and AI read the same rules and work from the same project context.

## How it works

### 1. Capture — collect the raw material
Anything not yet organized — meeting transcripts, links, PDF/PPT/Word files, photos, notes — goes into `00 Inbox/`. Originals are kept in each working folder's `_raw/`.

### 2. Digest — turn it into readable Markdown
A human or AI organizes the original into a Markdown note and files it under meetings, research, worklogs, or outputs depending on its nature. The digest always points back to the original.

### 3. Decide — update the official context
Confirmed choices go to `02 Decisions/` and `_system/DECISION_LOG.md`; work in progress and blockers go to `_system/CURRENT_STATE.md`. These files are the team's official baseline.

### 4. Reuse — the next person or AI picks up instantly
New teammates and AI start from `Project Hub/HOME.md`. Without scanning the whole vault, they get the current goal, decisions, rules, and next actions, then read only the evidence they need.

## Getting started

1. Create your team repository with **Use this template** — and make it **Private**. Contact handles, meeting notes, and unconfirmed ideas accumulate here. This template repository is public, but your team repository should always run private; consider going public only after the project ends and sensitive content has been scrubbed.
2. Follow `Project Hub/ONBOARDING.md`: the lead prepares the repository (step 0), fills the official docs through the AI **kickoff interview** (`_system/KICKOFF_INTERVIEW.md`, step 1), teammates join via onboarding PRs (step 2), and the first meeting locks in the team agreements (step 3).
3. Open the cloned folder with an AI tool like Claude Code or Codex and the start gate in `AGENTS.md` launches the kickoff interview automatically — it first asks for your team's working language (English, Korean, or any other). Working without AI? Fill in the bracketed placeholders in `Project Hub/HOME.md`, `_system/TEAM.md`, and `_system/CURRENT_STATE.md` yourself.
4. Raw material goes to `00 Inbox/`; each member works on a `member/<name>-<task>` branch.
5. The lead/integrator reviews PRs, gathers them into `integrate/<scope>-YYYY-MM-DD`, and merges to `main`.

## Structure

```text
Project Hub/HOME.md # The dashboard everyone — human or AI — starts from
AGENTS.md            # Shared rules for AI and humans + kickoff start gate
CLAUDE.md            # Entry point for Claude Code (imports AGENTS.md)
_system/             # Current state, decisions, team, glossary, rules — the official baseline
00 Inbox/            # Unsorted raw material and the intake ledger
Project Hub/      # Repository map + ONBOARDING.md and TEAM-GUIDE.md
01 Meetings/         # Meeting notes
02 Decisions/        # Confirmed ADRs/decisions
03 Research/         # Research and Markdown digests of PDF/PPT/Word files
04 Worklogs/         # Personal work logs
05 Tasks/            # Official to-dos
06 Team/             # Per-member responsibilities and AI prompts
07 Outputs/          # Deliverables: plans, demos, presentations
90 Archive/          # Closed work
99 Templates/        # Forms for meetings, decisions, research
```

## Ask your AI like this

```text
Read this repository and pick up the current project context.
Reading order: Project Hub/HOME.md → AGENTS.md → _system/CURRENT_STATE.md →
_system/DECISION_LOG.md → the evidence documents relevant to my request.

For new material, keep the original and digest it into Markdown.
For anything confirmed, propose updates to the decision log and current state.
For anything undecided, don't guess — leave it as a question.
```

## NotebookLM team briefings and Q&A

Context Hippo does not promise automatic GitHub-to-NotebookLM synchronization. It helps you make a reviewed **NotebookLM Handoff package**: one source with the current decisions and changes, ready for a human to upload.

- First time? Read [`06 Team/NOTEBOOKLM-HANDOFF.md`](06%20Team/NOTEBOOKLM-HANDOFF.md).
- Make a package: copy [`99 Templates/notebooklm-handoff.md`](99%20Templates/notebooklm-handoff.md) into `07 Outputs/`.
- The handoff file itself includes four ready-to-copy prompts: team briefing, slide outline, onboarding/Q&A, and decision review. Users discover prompts inside the file they upload, rather than having to find a separate prompt library.

## Keep originals alongside Markdown

Store PDF/PPT/Word files and meeting recordings as originals in the folder's `_raw/`. Put the `.md` extracted with tools like MarkItDown right next to it in the same folder. The first line of a digest names its origin:

```md
> Origin: _raw/interview-notes.pdf
```

## An important limitation

The documents in this template are an operating baseline. `main` branch protection and required reviews must be enabled separately in the repository Settings on GitHub to become real access control. `_system/GOVERNANCE.md` documents the three server-side gates (branch protection, CODEOWNERS, guard CI), the exact commands, and the free-plan fallback (CI signal mode) for private repositories.

## License

[MIT](LICENSE)
