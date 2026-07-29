#!/usr/bin/env bash
# clean-roemmele-essay.sh
# Usage: ./clean-roemmele-essay.sh <reasonable_filename>
# Example: ./clean-roemmele-essay.sh 2026-07-22_40pct-Webpages-Gone-AI-Training

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <reasonable_filename>"
  echo "Example: $0 2026-07-22_40pct-Webpages-Gone-AI-Training"
  exit 1
fi

NAME="$1"
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"   # 04-sources/roemmele
RAW="$BASE_DIR/cleaned/${NAME}.raw.md"
CLEAN="$BASE_DIR/cleaned/${NAME}.md"

if [[ ! -f "$RAW" ]]; then
  echo "ERROR: raw file not found: $RAW"
  echo "Run the pandoc extraction step first."
  exit 1
fi

echo "Cleaning: $RAW → $CLEAN"

sed -E \
  -e 's/\[\[\]\{\.tts-circle\}\[\]\{\.tts-paragraph-player-button[^]]*\]\{\.tts-paragraph-player\}//g' \
  -e 's/\{\.tts-paragraph-player[^}]*\}//g' \
  -e 's/\[\]\{\.tts-circle\}//g' \
  -e 's/\[\]\{\.tts-paragraph-player-button[^]]*\}//g' \
  -e '/This article is sponsored by Read Multiplex/d' \
  -e '/It is also sponsored by many who have donated/d' \
  -e '/Listen to the companion podcast/d' \
  -e '/View original/d' \
  -e '/[0-9]+ min\. read/d' \
  -e '/^::::::/d' \
  -e '/^::::: /d' \
  -e '/^::::/d' \
  -e '/^:::/d' \
  -e '/^\s*$/N;/^\s*\n\s*$/D' \
  "$RAW" > "$CLEAN"

# Simple report
RAW_LINES=$(wc -l < "$RAW")
CLEAN_LINES=$(wc -l < "$CLEAN")
echo "Done."
echo "  Raw lines : $RAW_LINES"
echo "  Clean lines: $CLEAN_LINES"
echo "  Output    : $CLEAN"
echo
echo "Next: open $CLEAN in Emacs for a quick visual pass, then create the org-roam node."
