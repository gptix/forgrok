#!/bin/bash
# =============================================
# 5000 Days → Org-roam Converter (matches your C-c n f behavior)
# Timestamped filenames + PROPERTIES drawer first
# =============================================

set -euo pipefail

echo "🚀 Converting 25 HTML files to Org-roam nodes (timestamped filenames)..."

# Check dependencies
if ! command -v pandoc >/dev/null 2>&1; then
  echo "Pandoc not found — installing..."
  sudo apt update && sudo apt install -y pandoc
fi
if ! command -v uuidgen >/dev/null 2>&1; then
  echo "uuidgen not found — installing..."
  sudo apt install -y uuid-runtime
fi

# Base unix time so each file gets a unique timestamp
base_unix=$(date +%s)
counter=0

for html in 5000-days-part-*.html; do
  [[ -f "$html" ]] || continue
  counter=$((counter + 1))

  # Extract clean title from HTML
  raw_title=$(sed -n 's/.*<title>\(.*\)<\/title>.*/\1/p' "$html" | sed 's/ - Brian Roemmele.*//; s/^[ \t]*//; s/[ \t]*$//')
  title="${raw_title:-5000 Days Part ${counter}}"

  # Slugify for filename (lowercase, hyphens, no special chars)
  slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-+|-+$//g')

  # Unique timestamp (starts now, increments 1 second per file)
  current_unix=$((base_unix + counter))
  timestamp=$(date -d "@$current_unix" +%Y%m%d%H%M%S)

  filename="${timestamp}-${slug}.org"

  echo "Converting $html → $filename"

  # Convert HTML to Org
  pandoc -f html -t org --standalone --wrap=none -o "$filename.tmp" "$html"

  # Generate UUID
  uuid=$(uuidgen | tr '[:upper:]' '[:lower:]')

  # Build final Org-roam file (exact format you showed)
  cat > "$filename" <<EOF
:PROPERTIES:
:ID:       $uuid
:END:
#+title: $title
#+filetags: :brian_roemmele:5000_days:essay:
#+date: $(date +%Y-%m-%d)
#+roam_alias: 

#+begin_summary
<<SUMMARY WILL BE ADDED IN NEXT STEP>>
#+end_summary

$(cat "$filename.tmp")

EOF

  rm "$filename.tmp"
  echo "✅ $filename created (ID: $uuid)"
done

echo "🎉 Conversion complete! 25 timestamped Org-roam nodes ready in current directory."
echo "Next: reply with “Conversion complete” and I’ll instantly give you the overview MOC + concepts folder + all bidirectional roam links."
