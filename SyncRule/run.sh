#!/usr/bin/env bash
set -euo pipefail

# --- AGENTS.md / CLAUDE.md ---
if [ -f .ai/AGENTS.md ]; then
  for dest in AGENTS.md CLAUDE.md; do
    if ! cmp -s .ai/AGENTS.md "$dest" 2>/dev/null; then
      cp .ai/AGENTS.md "$dest"
      echo "$dest updated"
    fi
  done
fi

# --- skills ---
SKILLS_SRC=".ai/skills"
if [ -d "$SKILLS_SRC" ]; then
  if ! command -v rsync >/dev/null 2>&1; then
    echo "Error: rsync is required" >&2
    exit 1
  fi
  for dest in .claude/skills .cursor/skills .agent/skills; do
    mkdir -p "$dest"
    rsync -a --delete "$SKILLS_SRC/" "$dest/"
    echo "$dest synced"
  done
fi
