#!/usr/bin/env bash
set -euo pipefail

SETTING="${1:-}"
REF="${2:-main}"

if [ -z "$SETTING" ]; then
  echo "Usage: curl -fsSL https://raw.githubusercontent.com/HappyOnigiri/ShareSettings/main/install.sh | bash -s <setting-name> [ref]" >&2
  echo "Example: curl -fsSL https://raw.githubusercontent.com/HappyOnigiri/ShareSettings/main/install.sh | bash -s BasicCloudSkillsJP" >&2
  exit 1
fi

BASE="https://raw.githubusercontent.com/HappyOnigiri/ShareSettings/${REF}"

MANIFEST=$(curl -fsSL "${BASE}/${SETTING}/files.txt") || {
  echo "Error: '${SETTING}' が見つかりません" >&2; exit 1
}

while IFS= read -r file; do
  [ -z "$file" ] && continue
  [[ "$file" == \#* ]] && continue
  mkdir -p "$(dirname "$file")"
  curl -fsSL "${BASE}/${SETTING}/shared-files/${file}" -o "$file"
  echo "  installed: $file"
done <<< "$MANIFEST"

echo "Done: ${SETTING}"
