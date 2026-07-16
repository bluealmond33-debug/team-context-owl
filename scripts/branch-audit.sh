#!/usr/bin/env bash
# Remote branch audit only. It never deletes, resets, or pushes branches.
set -euo pipefail

remote="${1:-origin}"
default_branch="${2:-main}"

git fetch --prune "$remote"
main_ref="$remote/$default_branch"
git rev-parse --verify "$main_ref" >/dev/null

printf '# Branch audit\n\n'
printf '| branch | ahead | behind | recommendation |\n'
printf '|---|---:|---:|---|\n'

while IFS= read -r branch; do
  [ "$branch" = "$default_branch" ] && continue
  [ "$branch" = "HEAD" ] && continue
  read -r behind ahead < <(git rev-list --left-right --count "$main_ref...$remote/$branch")
  if [ "$ahead" -eq 0 ]; then
    recommendation='cleanable after owner/external-reference check'
  elif [ "$behind" -gt 0 ]; then
    recommendation='review: unique work exists; rebase/selectively integrate'
  else
    recommendation='review: unique work exists'
  fi
  printf '| `%s` | %s | %s | %s |\n' "$branch" "$ahead" "$behind" "$recommendation"
done < <(git for-each-ref --format='%(refname:strip=3)' "refs/remotes/$remote" | sort)
