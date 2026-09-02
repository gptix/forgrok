#!/usr/bin/env bash
# clean-readmultiplex-forum.sh
#
# Optional second-stage cleaner for ReadMultiplex *forum* SingleFile dumps
# that have already been run through pandoc (or dropped into 06-raw as .md).
#
# The essay cleaner (clean-roemmele-essay.sh) only strips TTS widgets and
# sponsor lines. Forum pages also contain breadcrumbs, subscribe/favorite
# URLs with wp nonces, avatars, pagination, TinyMCE reply chrome, and
# bbPress wrapper divs. This script is that extra pass.
#
# Usage:
#   ./clean-readmultiplex-forum.sh <input.md> [output.md]
#
# Examples:
#   ./clean-readmultiplex-forum.sh \
#     ~/local-side/06-raw/2026-09-01-Intro-Save-Wisdom-Project-at-SaveWisdom.md \
#     ~/local-side/04-sources/savewisdom/2026-09-01_Intro-Save-Wisdom-Project-at-SaveWisdom.md
#
#   # After the essay ingest script:
#   ./clean-readmultiplex-forum.sh \
#     ../cleaned/2026-09-01_Intro-Save-Wisdom-Project-at-SaveWisdom.md
#
# Exit 0 writes the cleaned file. Does not overwrite the input.

set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: $0 <input.md> [output.md]"
  exit 1
fi

IN="$1"
if [[ ! -f "$IN" ]]; then
  echo "ERROR: input not found: $IN"
  exit 1
fi

if [[ $# -eq 2 ]]; then
  OUT="$2"
else
  dir=$(dirname "$IN")
  base=$(basename "$IN" .md)
  OUT="${dir}/${base}.forum-clean.md"
fi

python3 - "$IN" "$OUT" << 'PY'
import re, sys
from pathlib import Path

inp, outp = Path(sys.argv[1]), Path(sys.argv[2])
text = inp.read_text(encoding="utf-8", errors="replace")

# Drop TinyMCE / reply-box and everything after the last real post pagination
# if the reply editor is present.
cut_marks = [
    r"^::::: bbp-pagination\s*$",
    r"^This forum is for intentional discussions",
    r"^:::: \{#wp-bbp_reply_content-editor-tools",
    r"<style id=\"editor-buttons-css\">",
]
for pat in cut_marks:
    m = re.search(pat, text, flags=re.M)
    if m and m.start() > 400:
        # keep first pagination (header) — only cut if this looks like the footer
        if "mce-tinymce" in text[m.start():] or "intentional discussions" in text[m.start():m.start()+200]:
            text = text[:m.start()]
            break

# Line-level drops
drop_res = [
    re.compile(r"breadcrumb", re.I),
    re.compile(r"subscription-toggle|favorite-toggle|bbp_unsubscribe|bbp_favorite"),
    re.compile(r"_wpnonce="),
    re.compile(r"bbp-pagination"),
    re.compile(r"Viewing \d+ posts"),
    re.compile(r"^:::? bbp-(topic-tags|template-notice|submit-wrapper)"),
    re.compile(r"^Tagged:"),
    re.compile(r"This topic has \d+ replies"),
    re.compile(r"bbp-topic-rules|Add another file"),
    re.compile(r"mce-tinymce|mce-container|editor-buttons-css|wp-editor"),
    re.compile(r"bbp-reply-permalink|bbp-topic-reply-link|bbp-report-link"),
    re.compile(r"bbp-reply-edit-link|bbp-reply-ip"),
    re.compile(r"This reply was modified"),
    re.compile(r"grav-hashed|grav-hijack|avatar-80|avatar-14"),
    re.compile(r"^Keymaster$|^Participant$|^Author$|^Posts$"),
    re.compile(r"^\[Offline\]|^\[Online\]|^- \[Off|^- \[On"),
]
kept = []
for line in text.splitlines():
    if any(r.search(line) for r in drop_res):
        continue
    if re.match(r"^:{2,}", line.strip()):
        continue
    if re.match(r"^- :{2,}", line.strip()):
        continue
    kept.append(line)
text = "\n".join(kept)

# Inline attr / widget cleanup
subs = [
    (r"\{\.tts-[^}]*\}", ""),
    (r"\{\.bbp-user-mention[^}]*\}", ""),
    (r"\{target=\"_blank\"[^}]*\}", ""),
    (r"\{rel=\"[^\"]*\"\}", ""),
    (r"\{download=\"\"\}", ""),
    (r"\{#[^}]*\}", ""),
    (r"\[\\@([A-Za-z0-9_]+)\]\([^)]+\)", r"@\1"),
    (r"\[@\]\{\.bbp-author-name\}\[([^\]]+)\]\{\.bbp-author-name\}", r"\1"),
    (r"\\\@", "@"),
    (r"\\<", "<"),
    (r"\\>", ">"),
]
for pat, repl in subs:
    text = re.sub(pat, repl, text)

# Collapse 3+ blank lines
text = re.sub(r"\n{3,}", "\n\n", text).strip() + "\n"

outp.parent.mkdir(parents=True, exist_ok=True)
outp.write_text(text, encoding="utf-8")
print(f"Wrote {outp} ({outp.stat().st_size} bytes, {text.count(chr(10))} lines)")
PY
