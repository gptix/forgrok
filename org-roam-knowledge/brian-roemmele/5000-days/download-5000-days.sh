#!/bin/bash
# =============================================
# 5000 Days Full-Essay Downloader (curl + cookies)
# Saves clean HTML to your Org-roam knowledge base
# =============================================

set -euo pipefail

TARGET_DIR="$HOME/local-side/org-roam-knowledge/brian-roemmele/5000-days"
COOKIE_FILE="cookies.txt"          # ← must be in the same folder as this script
URL_LIST="5000-days-urls.txt"      # ← one URL per line

# Create directory if missing
mkdir -p "$TARGET_DIR"

cd "$TARGET_DIR" || { echo "Cannot cd to $TARGET_DIR"; exit 1; }

echo "🚀 Starting 5000 Days download → $TARGET_DIR"
echo "Using cookies from $COOKIE_FILE"

if [[ ! -f "../$COOKIE_FILE" && ! -f "$COOKIE_FILE" ]]; then
  echo "❌ ERROR: cookies.txt not found! Export it with the browser extension first."
  exit 1
fi

# Use the cookies file from parent or current dir
if [[ -f "../$COOKIE_FILE" ]]; then
  COOKIE_PATH="../$COOKIE_FILE"
else
  COOKIE_PATH="$COOKIE_FILE"
fi

counter=0
while IFS= read -r url || [[ -n $url ]]; do
  # Skip empty lines and comments
  [[ -z "$url" || "$url" =~ ^# ]] && continue

  counter=$((counter + 1))
  # Friendly filename: 5000-days-part-01.html etc.
  filename=$(printf "5000-days-part-%02d.html" "$counter")

  echo "↓ Downloading Part $counter → $filename"
  curl -L \
       -b "$COOKIE_PATH" \
       -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36" \
       --fail \
       -o "$filename" \
       "$url"

  echo "✅ Saved $filename ($(wc -c < "$filename") bytes)"
done < <(cat "../$URL_LIST" 2>/dev/null || cat "$URL_LIST")

echo "🎉 All done! $counter essays downloaded."
echo "Next: convert to .org with pandoc if you like, then we’ll build the Org-roam graph."
