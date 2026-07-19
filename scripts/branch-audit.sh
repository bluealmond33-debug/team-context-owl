#!/usr/bin/env bash
# Remote branch audit only. It never deletes, resets, or pushes branches.
set -euo pipefail

remote="${1:-origin}"
default_branch="${2:-main}"
stale_days="${3:-14}"

git fetch --prune "$remote"
main_ref="$remote/$default_branch"
git rev-parse --verify "$main_ref" >/dev/null

now="$(date +%s)"

printf '# Branch audit\n\n'
printf '| branch | ahead | behind | last commit | age (days) | recommendation |\n'
printf '|---|---:|---:|---|---:|---|\n'

while IFS= read -r branch; do
  [ "$branch" = "$default_branch" ] && continue
  [ "$branch" = "HEAD" ] && continue
  read -r behind ahead < <(git rev-list --left-right --count "$main_ref...$remote/$branch")
  last_ts="$(git log -1 --format=%ct "$remote/$branch")"
  last_date="$(git log -1 --format=%cs "$remote/$branch")"
  age_days=$(( (now - last_ts) / 86400 ))
  if [ "$ahead" -eq 0 ]; then
    recommendation='cleanable after owner/external-reference check'
  elif [ "$age_days" -ge "$stale_days" ] && [ "$behind" -gt 0 ]; then
    recommendation="stale (>=${stale_days}d): owner picks PR, archive, or drop"
  elif [ "$behind" -gt 0 ]; then
    recommendation='review: unique work exists; rebase/selectively integrate'
  else
    recommendation='review: unique work exists'
  fi
  printf '| `%s` | %s | %s | %s | %s | %s |\n' "$branch" "$ahead" "$behind" "$last_date" "$age_days" "$recommendation"
done < <(git for-each-ref --format='%(refname:strip=3)' "refs/remotes/$remote" | sort)
