#!/usr/bin/env bash
# Emit an SVG <symbol> sprite (one per icon key) from the local icon source — copied, never typed
# (SVG path data is the slowest content to generate; it already exists verbatim in source.json).
# fill-rule="evenodd" is mandatory (Core Rule 4). Keys absent from source.json are skipped — resolve
# those via MCP and append their <symbol> line by hand.
#
# Uses jq when present, else falls back to python3 (identical output). Claude Chat sandboxes ship
# python3 but not always jq — see the runtime-fallback guardrail in SKILL.md. Prints
# NO_JQ_OR_PYTHON + exits 1 if neither is available.
#
# Usage: build-sprite.sh <out-sprite-file> <icon-key> [<icon-key> ...]
#   e.g. build-sprite.sh "$CACHE/sprite.html" searchOutlined20 filterOutlined20 editOutlined16
set -u
DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$DIR/../icons/source.json"   # scripts/ → resources/icons/source.json
OUT="$1"; shift

if command -v jq >/dev/null 2>&1; then
  KEYS=$(printf '%s\n' "$@" | jq -R . | jq -s .)   # requested keys as a JSON array
  jq -r --argjson keys "$KEYS" '
    $keys[] as $k | .[$k] | select(. != null)
    | "<symbol id=\"\($k)\" viewBox=\"0 0 \(.size) \(.size)\" fill-rule=\"evenodd\">\(.body)</symbol>"
  ' "$SRC" > "$OUT"
elif command -v python3 >/dev/null 2>&1; then
  SRC="$SRC" python3 - "$OUT" "$@" <<'PY'
import json, os, sys
out, keys = sys.argv[1], sys.argv[2:]
data = json.load(open(os.environ["SRC"]))
lines = []
for k in keys:
    v = data.get(k)
    if not v:
        continue
    lines.append('<symbol id="%s" viewBox="0 0 %s %s" fill-rule="evenodd">%s</symbol>'
                 % (k, v["size"], v["size"], v["body"]))
open(out, "w").write("\n".join(lines) + ("\n" if lines else ""))
PY
else
  echo "NO_JQ_OR_PYTHON: cannot build sprite — install jq or python3" >&2
  exit 1
fi
