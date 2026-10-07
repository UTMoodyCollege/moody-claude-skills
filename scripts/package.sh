#!/usr/bin/env bash
# Build uploadable .skill files (for claude.ai / Claude desktop) into dist/.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
for dir in plugins/*/skills/*/; do
  name=$(basename "$dir")
  rm -f "dist/$name.skill"
  (cd "$(dirname "$dir")" && zip -qr "$OLDPWD/dist/$name.skill" "$name" -x '*/__pycache__/*' '*.DS_Store')
  echo "built dist/$name.skill"
done
