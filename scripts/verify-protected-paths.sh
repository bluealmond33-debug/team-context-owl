#!/usr/bin/env bash
# Blocks official-baseline file changes on regular member branches.
# Usage: ./scripts/verify-protected-paths.sh [base-ref] [head-ref]
set -euo pipefail

base_ref="${1:-origin/main}"
head_ref="${2:-HEAD}"
branch="${GITHUB_HEAD_REF:-$(git branch --show-current 2>/dev/null || true)}"

if [[ -z "$branch" ]]; then
  echo "ERROR: cannot determine the current branch. GITHUB_HEAD_REF or a checked-out branch is required." >&2
  exit 2
fi

if [[ "$branch" == "main" || "$branch" == integrate/* ]]; then
  echo "PASS: '$branch' is an integration path that may update protected files."
  exit 0
fi

if ! changed_files="$(git diff --name-only "${base_ref}...${head_ref}")"; then
  echo "ERROR: could not diff '$base_ref' against '$head_ref'." >&2
  exit 2
fi

is_protected() {
  case "$1" in
    '000 HOME.md'|README.md|README.ko.md|AGENTS.md|CLAUDE.md|00\ Project\ Hub/*|_system/*|02\ Decisions/*|05\ Tasks/*|.github/*|scripts/*)
      return 0 ;;
    00\ Inbox/README.md|01\ Meetings/README.md|02\ Decisions/README.md|03\ Research/README.md|04\ Worklogs/README.md|05\ Tasks/README.md|06\ Team/README.md|07\ Outputs/README.md|90\ Archive/README.md)
      return 0 ;;
    *) return 1 ;;
  esac
}

violations=()
while IFS= read -r path; do
  [[ -z "$path" ]] && continue
  if is_protected "$path"; then
    violations+=("$path")
  fi
done <<< "$changed_files"

if ((${#violations[@]} == 0)); then
  echo "PASS: no protected-file changes on a member branch."
  exit 0
fi

echo "FAIL: branch '$branch' may not change these official baseline files:" >&2
printf '  - %s\n' "${violations[@]}" >&2
cat >&2 <<'MESSAGE'

What to do:
1. Move the change into research, outputs, or a worklog, or
2. request selective integration on an integration branch (integrate/<scope>-YYYY-MM-DD), or
3. if it conflicts with an existing decision, leave a decision request for the integrator in your PR.
MESSAGE
exit 1
