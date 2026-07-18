#!/bin/bash
# Run from the PRIMARY clone after `git worktree add` / `herdr worktree create`.

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "usage: $0 <worktree-path>" >&2
  exit 2
fi

WT_PATH="$1"
REPO_ROOT=$(git rev-parse --show-toplevel)

if [ ! -d "$WT_PATH" ]; then
  echo "setup-worktree: worktree path does not exist: $WT_PATH" >&2
  exit 1
fi

# Symlink files
LINKS_FILE="$REPO_ROOT/worktree-links"
if [ -f "$LINKS_FILE" ]; then
  while IFS= read -r rel || [ -n "$rel" ]; do
    [[ "$rel" =~ ^#|^[[:space:]]*$ ]] && continue

    src="$REPO_ROOT/$rel"
    dst="$WT_PATH/$rel"

    [ -f "$src" ] || continue

    mkdir -p "$(dirname "$dst")"
    ln -sf "$src" "$dst"

    echo "setup-worktree: symlinked $rel"
  done < "$LINKS_FILE"
fi
