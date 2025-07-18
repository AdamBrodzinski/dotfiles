#!/usr/bin/env bash
set -euo pipefail

URLS=(
  "https://github.com/dj95/zj-smart-sessions/releases/download/v0.3.0/zj-smart-sessions.wasm"
)

for URL in "${URLS[@]}"; do
  OUTPUT=$(basename "$URL")

  echo "Downloading $URL ..."
  curl -L -o "$OUTPUT" "$URL"
  echo "Saved to $OUTPUT"
done

