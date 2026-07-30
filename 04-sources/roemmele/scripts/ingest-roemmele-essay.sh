#!/usr/bin/env bash
# ingest-roemmele-essay.sh
# Higher-level driver: HTML → pandoc → clean → skeleton.org
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
ORG="$BASE_DIR/cleaned/${NAME}.org"
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
# 3. Generate skeleton .org (only if it does not already exist)
# --------------------------------------------------
if [[ -f "$ORG" ]]; then
  echo "→ Org node already exists: $ORG"
  echo "  (Skipping skeleton generation — edit it manually if needed)"
else
  echo "→ Generating skeleton org-roam node..."

  # Derive a clean NODE-NAME (no spaces) from the filename
  # Strip leading date_ and turn remaining hyphens into CamelCase
  SLUG="${NAME#*_}"                          # remove YYYY-MM-DD_
  NODE_NAME=$(echo "$SLUG" | sed -E 's/-([a-z])/\U\1/g' | sed -E 's/[^A-Za-z0-9]//g')

  # Simple title guess (replace hyphens with spaces)
  TITLE_GUESS=$(echo "$SLUG" | tr '-' ' ')

  # Today's date for the ID
  TODAY=$(date +%Y%m%d)

  cat > "$ORG" <<EOF
:PROPERTIES:
:ID:       ${TODAY}-${SLUG,,}
:END:
#+TITLE: ${TITLE_GUESS}
#+NODE-NAME: ${NODE_NAME}
#+FILETAGS: :roemmele:essay:high-protein:
#+DATE: 
#+SOURCE: 
#+CAPTURE_METHOD: SingleFile (member login)
#+STATUS: cleaned
#+AUTHOR: Brian Roemmele

* Summary

(Write a 3–6 sentence summary here.)

* Key Claims & Concepts

- 
- 
- 

* Major Sections

- 

* Notes / Follow-ups

- 

* Related

- [[roemmele-essays-inventory]]
- [[RoemmeleEssayIngestWorkflow]]
EOF

  echo "  Created: $ORG"
  echo "  NODE-NAME used: $NODE_NAME"
fi

# --------------------------------------------------
# Final instructions
# --------------------------------------------------
echo
echo "════════════════════════════════════════════════════"
echo "  Ingest complete for: $NAME"
echo "════════════════════════════════════════════════════"
echo
echo "Remaining human steps:"
echo
echo "  1. Visual pass on the cleaned Markdown:"
echo "       emacsclient -n -c $CLEAN_MD"
echo
echo "  2. Edit the org-roam node (fill summary, key claims, SOURCE, DATE, improve TITLE if needed):"
echo "       emacsclient -n -c $ORG"
echo
echo "  3. Update inventory status → cleaned (or pushed after commit)"
echo
echo "  4. Commit when ready:"
echo "       cd ~/local-side"
echo "       git add 04-sources/roemmele/"
echo "       git commit -m \"processed Roemmele essay <id> (<short title>)\""
echo "       git push"
echo
