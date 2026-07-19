# INTAKE_INDEX — Inbox ledger

> `00 Inbox/` is not a temporary trash can. It is a **triage queue**. Even after items move on, Git history and the originals remain.

| Received | Item | Status | Original path | Digest/destination | Owner | Notes |
|---|---|---|---|---|---|---|
| YYYY-MM-DD | [item name] | untriaged | `_raw/...` | - | [id] | - |

## Statuses

- `untriaged`: not yet sorted
- `classified`: moved to a `01–07` folder with `git mv`; the row records the final location
- `hold`: parked; the reason and next review date go in Notes
- `archived`: no longer active context, kept in `90 Archive/`

## Principles

1. When material arrives, put the original in `00 Inbox/_raw/` first and add a row here.
2. File by moving with `git mv` to the destination folder (or its `_raw/`) — never by deleting.
3. For PDF/PPT/Word/recordings, move the original first, then add a Markdown digest in the same destination folder.
4. An empty active list in `00 Inbox/` means **processing is done** — not that material disappeared.
