#!/usr/bin/env bash
# Screenshot a prototype with headless Chrome for visual judging (switcher auto-hidden via #shot).
# Renders states concurrently, bounding each capture so a hung render fails fast.
# Exits 1 with "NO_CHROME" if no browser is found — fall back to source-level review and say so.
#
# Usage:
#   screenshot-states.sh <out.html> <png-dir>                       # lofi: single #shot capture
#   screenshot-states.sh <out.html> <png-dir> <state-id> [<id> ...] # hifi: one PNG per PROTOSTATE id
set -u
OUT="$1"; PNGDIR="$2"; shift 2
CHROME=$(command -v google-chrome || command -v chromium \
  || ls "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" 2>/dev/null | head -1)
[ -z "$CHROME" ] && { echo "NO_CHROME" >&2; exit 1; }
TO=$(command -v timeout || command -v gtimeout); [ -n "$TO" ] && TO="$TO 45" || TO=""
shot () { $TO "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
  --screenshot="$1" --window-size=1440,1600 "$2"; }

if [ "$#" -eq 0 ]; then
  shot "$PNGDIR/view.png" "file://$OUT#shot"          # single view (lofi)
else
  for st in "$@"; do shot "$PNGDIR/$st.png" "file://$OUT#state=$st&shot" & done
  wait
fi
