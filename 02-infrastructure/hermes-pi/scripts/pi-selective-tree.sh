#!/bin/bash
# pi-selective-tree.sh - Generate tree for backup candidate review from X230
# Usage: ./pi-selective-tree.sh [START_DIR] [OUTPUT_SUFFIX]

set -e

PI_HOST="hermes-pi"
TIMESTAMP=$(date +%Y%m%d-%H%M)
START_DIR="${1:-/home/gt-hermes}"   # Use full path instead of ~
SUFFIX="${2:-valuable}"
OUTPUT_FILE="hermes-pi-tree-${SUFFIX}-${TIMESTAMP}.txt"

echo "Generating selective tree on ${PI_HOST} starting from: ${START_DIR}"
echo "Output → ${OUTPUT_FILE}"

# Customize ignore patterns here
IGNORE=".git|node_modules|__pycache__|*.bak|*.log|*.tmp|unwanted-skills|skills-to-review|temp"

ssh "${PI_HOST}" "tree -a -I \"${IGNORE}\" --dirsfirst -L 6 \"${START_DIR}\"" > "${OUTPUT_FILE}"

if [ -f "${OUTPUT_FILE}" ]; then
    echo "✅ Tree generated successfully!"
    echo "   Review this file to identify valuable files for backup script."
    ls -lh "${OUTPUT_FILE}"
    emacsclient -n "${OUTPUT_FILE}" 2>/dev/null || true
else
    echo "❌ Failed."
    exit 1
fi
