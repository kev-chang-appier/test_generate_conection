#!/usr/bin/env bash
# Query the local icon source (resources/icons/source.json) without a hard jq dependency.
# Uses jq when present, else python3 (identical output). Claude Chat sandboxes ship python3 but
# not always jq — see the runtime-fallback guardrail in SKILL.md. The skill can't know upfront
# whether jq exists; this probes it at call time with `command -v`.
#
# Usage:
#   icon-source.sh check <key> [<key> ...]   # print "<key>: ok" or "<key>: null" per requested key
#   icon-source.sh search <regex>            # print keys whose name matches the regex (case-insensitive)
set -u
DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$DIR/../icons/source.json"
MODE="${1:-}"; shift 2>/dev/null || true

have(){ command -v "$1" >/dev/null 2>&1; }

case "$MODE" in
  check)
    if have jq; then
      KEYS=$(printf '%s\n' "$@" | jq -R . | jq -s .)
      jq -r --argjson keys "$KEYS" '$keys[] as $k | "\($k): \(if (.[$k] // null)==null then "null" else "ok" end)"' "$SRC"
    elif have python3; then
      SRC="$SRC" python3 - "$@" <<'PY'
import json, os, sys
data = json.load(open(os.environ["SRC"]))
for k in sys.argv[1:]:
    print("%s: %s" % (k, "ok" if data.get(k) else "null"))
PY
    else echo "NO_JQ_OR_PYTHON: install jq or python3" >&2; exit 1; fi
    ;;
  search)
    RE="${1:-}"
    if have jq; then
      jq -r --arg re "$RE" 'keys[] | select(test($re; "i"))' "$SRC"
    elif have python3; then
      SRC="$SRC" RE="$RE" python3 - <<'PY'
import json, os, re
data = json.load(open(os.environ["SRC"]))
rx = re.compile(os.environ["RE"], re.I)
for k in sorted(data):
    if rx.search(k): print(k)
PY
    else echo "NO_JQ_OR_PYTHON: install jq or python3" >&2; exit 1; fi
    ;;
  *)
    echo "usage: icon-source.sh {check <keys...>|search <regex>}" >&2; exit 2 ;;
esac
