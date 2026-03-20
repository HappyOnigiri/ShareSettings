#!/usr/bin/env bash
set -euo pipefail

REPO="HappyOnigiri/ShareSettings"
SETTING="InstallBasicClaudeSkillsJP"
REF="${1:-main}"

TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

echo "Downloading $REPO@$REF ..."
curl -fsSL --retry 3 --retry-delay 1 --connect-timeout 10 --max-time 120 \
  "https://api.github.com/repos/$REPO/tarball/$REF" | tar xz -C "$TMPDIR"

# tarball 内トップレベルディレクトリ特定
_DIRS=()
while IFS= read -r -d '' _dir; do
  _DIRS+=("$_dir")
done < <(find "$TMPDIR" -mindepth 1 -maxdepth 1 -type d -print0)
if [[ "${#_DIRS[@]}" -ne 1 ]]; then
  echo "Error: Expected 1 top-level directory in tarball, found ${#_DIRS[@]}." >&2
  exit 1
fi

SHARED_FILES="${_DIRS[0]}/$SETTING/shared-files"
if [[ ! -d "$SHARED_FILES" ]]; then
  echo "Error: shared-files not found." >&2
  exit 1
fi

cp -R "$SHARED_FILES/." .
echo "Done: '$SETTING' installed."
