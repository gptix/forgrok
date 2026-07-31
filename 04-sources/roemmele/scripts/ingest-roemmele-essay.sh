#!/usr/bin/env bash
# ingest-roemmele-essay.sh
# Higher-level driver: HTML → pandoc → clean
# (No longer creates a skeleton .org file — Grok produces the full org node later)
#
# Usage:
#   ./ingest-roemmele-essay.sh <reasonable_filename>
#
# Example:
#   ./ingest-roemmele-essay.sh 2026-07-18_Prediction-Markets-AI-Model
#
# Prerequisites:
#   - HTML already present in  ../html/<reasonable_filename>.html
#   - clean-roemmele-essay.sh exists in the same directory

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <reasonable_filename>"
  echo "Example: $0 2026-07-18_Prediction-Markets-AI-Model"
  exit 1
fi

NAME="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"   # 04-sources/roemmele

HTML="$BASE_DIR/html/${NAME}.html"
RAW="$BASE_DIR/cleaned/${NAME}.raw.md"
CLEAN_MD="$BASE_DIR/cleaned/${NAME}.md"
CLEANER="$SCRIPT_DIR/clean-roemmele-essay.sh"

# --------------------------------------------------
# Sanity checks
# --------------------------------------------------
if [[ ! -f "$HTML" ]]; then
  echo "ERROR: HTML not found: $HTML"
  echo "Run SingleFile first and place the file correctly."
  exit 1
fi

if [[ ! -x "$CLEANER" ]]; then
  echo "ERROR: cleaner script not found or not executable: $CLEANER"
  exit 1
fi

echo "→ Ingesting: $NAME"
echo "  HTML : $HTML"

# --------------------------------------------------
# 1. Pandoc extraction
# --------------------------------------------------
echo "→ Running pandoc..."
pandoc "$HTML" \
  -f html \
  -t markdown \
  --wrap=none \
  --extract-media="$BASE_DIR/images/${NAME}" \
  -o "$RAW"

echo "  Created: $RAW"

# --------------------------------------------------
# 2. Clean
# --------------------------------------------------
echo "→ Running cleaner..."
"$CLEANER" "$NAME"

# --------------------------------------------------
# Final instructions
# --------------------------------------------------
echo
echo "════════════════════════════════════════════════════"
echo "  Ingest complete: $NAME"
echo "════════════════════════════════════════════════════"
echo
echo "Mechanical files produced:"
echo "  • $HTML"
echo "  • $CLEAN_MD"
echo "  • images/${NAME}/"
echo
echo "Next steps:"
echo "  1. (Optional) Quick visual check of the cleaned Markdown"
echo "  2. Push only the mechanical files (html + md + images)"
echo "  3. Tell Grok the mechanical files are pushed"
echo "  4. Grok will supply the full org-roam node"
echo "  5. Create the .org, review it, update inventory → pushed,"
echo "     then commit org + inventory together"
echo
