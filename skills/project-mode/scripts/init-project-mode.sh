#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ASSETS_DIR="$SKILL_DIR/assets"

STATE_DIR="$TARGET/.project-mode"

mkdir -p "$STATE_DIR/prd" "$STATE_DIR/qa-reports" "$STATE_DIR/deploy-reports"

copy_if_missing() {
  local src="$1"
  local dest="$2"
  if [ -e "$dest" ]; then
    printf 'skip %s (exists)\n' "$dest"
  else
    cp "$src" "$dest"
    printf 'create %s\n' "$dest"
  fi
}

copy_if_missing "$ASSETS_DIR/AGENTS.template.md" "$TARGET/AGENTS.md"
copy_if_missing "$ASSETS_DIR/CLAUDE.template.md" "$TARGET/CLAUDE.md"
copy_if_missing "$ASSETS_DIR/project.template.md" "$STATE_DIR/project.md"
copy_if_missing "$ASSETS_DIR/board.template.json" "$STATE_DIR/board.json"
copy_if_missing "$ASSETS_DIR/decisions.template.md" "$STATE_DIR/decisions.md"

if [ ! -e "$STATE_DIR/comms.jsonl" ]; then
  : > "$STATE_DIR/comms.jsonl"
  printf 'create %s\n' "$STATE_DIR/comms.jsonl"
else
  printf 'skip %s (exists)\n' "$STATE_DIR/comms.jsonl"
fi
