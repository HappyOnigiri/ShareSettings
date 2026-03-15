#!/usr/bin/env bash
set -euo pipefail

REPO="HappyOnigiri/ShareSettings"

usage() {
  cat <<EOF
Usage: install.sh <SETTING> [TARGET_DIR] [REF]

Arguments:
  SETTING     設定セット名（例: BasicCloudSkillsJP）
  TARGET_DIR  展開先ディレクトリ（デフォルト: .）
  REF         ブランチ/タグ/コミット（デフォルト: main）

Example:
  install.sh BasicCloudSkillsJP
  install.sh BasicCloudSkillsJP /path/to/project
  install.sh BasicCloudSkillsJP . v1
EOF
}

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  usage
  exit 0
fi

if [[ $# -lt 1 ]]; then
  echo "Error: SETTING argument is required." >&2
  echo "" >&2
  usage >&2
  exit 1
fi

SETTING="$1"
TARGET="${2:-.}"
REF="${3:-main}"

TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

echo "Downloading $REPO@$REF ..."
curl -fsSL "https://api.github.com/repos/$REPO/tarball/$REF" | tar xz -C "$TMPDIR"

# tarball 内の唯一のトップレベルディレクトリを特定
EXTRACTED_DIR="$(find "$TMPDIR" -mindepth 1 -maxdepth 1 -type d | head -1)"

SHARED_FILES_DIR="$EXTRACTED_DIR/$SETTING/shared-files"
if [[ ! -d "$SHARED_FILES_DIR" ]]; then
  echo "Error: Setting '$SETTING' not found in $REPO." >&2
  exit 1
fi

mkdir -p "$TARGET"
cp -a "$SHARED_FILES_DIR/." "$TARGET/"

echo "Done: '$SETTING' installed to '$TARGET'."
