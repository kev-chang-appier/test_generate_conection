---
name: TEST-ds-prototype-local
description: |
  EXPLICIT-INVOCATION ONLY — this is a test skill. Invoke ONLY when the user literally
  types the slash command /TEST-ds-prototype-local. Never auto-invoke from natural language.
  Do NOT match on "create a prototype", "mock up a screen", "build a UI", or any Appier /
  AdCloud / AIQUA / BotBonnie request — none of those are triggers. If the user did not type
  the slash command verbatim, this skill does not apply.
  (When explicitly invoked, it generates a self-contained Appier product HTML prototype:
  a single offline .html portal page using Appier design tokens, real icon SVGs, and the
  matching product shell — AdCloud (DS2), AIQUA (DS3), or BotBonnie (DS3) — inferred from
  the brief, with all design guidelines bundled under resources/design/, no `gh`/network at
  runtime. NOT for React/TypeScript production code or non-Appier products.)
arguments:
  - name: ds
    description: >
      Design system version: "2" (DS2) or "3" (DS3). Defaults to the product's version
      (AdCloud→DS2, AIQUA→DS3, BotBonnie→DS3); pass this only to override that default. DS3 swaps
      in DS3 tokens — Inter font, larger radii, borders-only elevation, 40px controls, full-pill chips.
  - name: fidelity
    description: >
      "hifi" (default) authors component CSS from the tokens doc + the consolidated component guide
      (escalating to a per-component file only where needed) for pixel-accurate output. "lofi" is the
      ideation path: injects the prebuilt local component CSS kit (resources/lofi-ds{2,3}-style.css)
      and uses the local pattern floor (resources/lofi-patterns.md) in place of the component-guide
      read — much faster/cheaper, on-brand but approximate, still pattern-compliant, for exploring
      direction before committing to a hifi build.
type: encoded-preference
allowed-tools: >
  Read, Write, Edit, Bash, Agent, AskUserQuestion,
  mcp__mcp-design-system-ui__list_icons,
  mcp__mcp-design-system-ui__search_icons,
  mcp__mcp-design-system-ui__get_icon_info,
  mcp__claude_ai_Appier_Design_System_UI__list_icons,
  mcp__claude_ai_Appier_Design_System_UI__search_icons,
  mcp__claude_ai_Appier_Design_System_UI__get_icon_info
---

# Appier Product Prototype (AdCloud · AIQUA · BotBonnie) — local/offline

Turn a product requirement into a rendered, Appier-recognizable portal page in the matching
product shell — AdCloud, AIQUA, or BotBonnie. Output is a single self-contained `.html` file
that opens directly in a browser — no build step, no tooling.

## Local design resources

All design guidelines ship **inside this skill** under `$SKILL_ROOT/resources/design/` — this skill
makes **no network or `gh` calls** at runtime. Read what you need directly with `Read` (no fetch, no
cache).

### Key paths (under `$SKILL_ROOT/resources/design/`)

| Resource | Path |
|---|---|
| Design tokens — DS2 (default) | `DESIGN-DS2.md` |
| Design tokens — DS3 (when `ds: 3`) | `DESIGN-DS3.md` |
| Component guide — essence (selection + hand-authoring anatomy; **primary**) | `component-guidelines/guideline-essence-for-AI.md` |
| Per-component guideline (escalation: full states/geometry) | `component-guidelines/{component}.md` |
| Component guidelines index | `component-guidelines/README.md` |
| Design-Patterns index | `Design-Patterns/README.md` |
| Per-pattern guideline | `Design-Patterns/{pattern}.md` |
| Design principles (quality lens) | `DESIGN-PRINCIPLES.md` |

## Icon keys

**Most icon keys are mechanically derivable** from the naming convention `{name}{Style}{size}` — e.g.
`search` → `searchOutlined20`, `edit` → `editOutlined16`. Don't look these up; derive them. For
directional icons (sort arrows, pagination, expand/collapse) and any key you can't derive, see
`resources/icons/index.md`, then resolve in Phase 2 (`jq` against `source.json`, MCP search as fallback).

## Workflow

### Phase 0 — Understand requirements

**Pick the product, DS version, and fidelity first** — all three drive later phases, so carry them through.

- **Product** (selects the shell *and* the default DS version) — infer from the brief; default
  **AIQUA** when no product is named:

  | Product | Shell (`$SKILL_ROOT/resources/…`) | Default DS |
  |---|---|---|
  | AIQUA (default) | `aiqua-shell.html` | DS3 |
  | AdCloud | `ad-cloud-portal-shell.html` | DS2 |
  | BotBonnie | `botbonnie-shell.html` | DS3 |

- **DS version** — defaults to the product's row above (so an unspecified brief is **AIQUA + DS3**).
  Override only when the user explicitly asks (`ds: 2`/`ds: 3`, or "use DS2").
- **Fidelity** — default **hifi**; use **lofi** when the user asks to ideate / explore / "rough it
  out" (`fidelity: lofi`).

- **hifi** (default): author component CSS from the tokens doc + guidelines for pixel-accurate output
  (the full Phase 1 → 3 flow below).
- **lofi** (ideation): inject the prebuilt **component CSS kit** instead of authoring it, and replace
  the guideline reads with the local **pattern floor** (`lofi-patterns.md`) — faster and cheaper,
  on-brand but approximate, still pattern-compliant. For confirming layout/direction before a hifi
  build. lofi deltas are flagged inline at each phase (tagged **lofi:**); the compliance baseline is
  detailed in the Phase 1 shortcut.

Open with the screen's **core tension** — the one conflict that decides what earns visual weight
and which states matter (e.g. "a dense operational table that must not read as empty on day one").
Then pin down:
- What page or feature this is (name and purpose)
- The primary user action(s) on the screen
- The main data or content displayed
- Which DS UI patterns are involved (table, form, filters, tabs, cards, dialogs, etc.)
- **Which states the screen must cover** *(hifi only)* — populated, empty, loading, error,
  selected/disabled. Decide the set now and build every one that applies; for a list/table screen the
  empty state is not optional. **lofi builds a single representative view** — no state set, no state
  switcher; multi-state coverage is a hifi concern, deferred to the lofi→hifi conversion.

If any of the above is ambiguous, ask with `AskUserQuestion` before proceeding. Do not generate
a placeholder screen just to "have something to show" — a focused brief produces far better output.

Identify the active rail/nav item for this screen so you can set it correctly in Phase 3.

### Phase 1 — Load design resources

> **lofi shortcut:** skip the design-doc reads (steps 3+) entirely. Resolve `SKILL_ROOT`, read the shell,
> the kit (`$SKILL_ROOT/resources/lofi-ds2-style.css`, or `lofi-ds3-style.css` for `ds: 3`) for its class names, and
> **`$SKILL_ROOT/resources/lofi-patterns.md`** for the pattern floor. Together these are lofi's
> compliance baseline — the kit covers *visual* rules, the pattern floor covers *which component /
> variant / anatomy* (the part skipping the guidelines would otherwise lose). That's the whole of
> lofi Phase 1 — no tokens doc, no per-component guidelines.

1. **Resolve SKILL_ROOT**: the directory containing this loaded `SKILL.md`.
2. **Read the product's shell** (always — the file from the Phase 0 table): e.g.
   `Read($SKILL_ROOT/resources/aiqua-shell.html)`. Read its header `CUSTOMIZABLE ZONE`
   comment too — it lists that shell's inject markers and editable anchors (these differ per shell).
3. **Read the design docs the screen needs** — all live under `$SKILL_ROOT/resources/design/`:
   - The **tokens doc for the chosen version** (Phase 0): `design/DESIGN-DS2.md` for DS2, or
     `design/DESIGN-DS3.md` for DS3. Exactly one tokens doc per run.
   - **The component guide (essence): `design/component-guidelines/guideline-essence-for-AI.md`** — the
     **primary** component guidance, sufficient for most screens. It carries component selection (which
     component, how to pick between siblings, the non-obvious rules) **and** hand-authoring anatomy (HTML
     skeletons + anti-native-control guardrails) for the high-risk interactive components — TextSelect,
     DatePicker, TagSelect, SingleSelectFilter, Pagination, Table. One file covers the whole screen and
     matches the per-component files on DS2 fidelity (LESSONS-LEARNED §7).
   - **When to escalate to `design/component-guidelines/{component}.md`** — read the full file for a
     single component only when one of these holds; otherwise the essence is enough:
       - **(hifi) the essence guide flags the component in its "Hi-fi escalation" list** — its DS form
         diverges from generic/market norms enough that essence + model priors render it wrong; always
         open the full file for these;
       - you need its **full visual states** (empty/loading/error/selected) or **exact geometry** beyond
         what the essence summarizes — pixel-exact or multi-state hifi work;
       - it's interactive / anatomy-heavy but **not** in the essence anatomy set above;
       - the essence entry is too terse for an unusual component.
     Read only that one component's file — never blanket-read the essence **plus** every detail file
     (worst cost/quality tradeoff: highest tokens, no fidelity gain). File names are exact — `filters.md`
     is plural.
   - Only the `design/Design-Patterns/{pattern}.md` files for UX patterns applicable to this screen.

Cover every component the screen actually renders (read its essence entry; escalate a detail file only
where the rule above applies) — completeness across the screen's real components, not speculative breadth.

**Batch the reads — never one file per turn.** These `Read`s are independent, so issue them as parallel
calls in a single message; reading them one at a time is the main way this skill burns through Claude
Chat's per-turn tool-use cap. Two waves only: **(1)** the shell + tokens doc + essence guide + any
Design-Patterns index together; then **(2)** only where a component needs escalation (rule above), the
per-component and per-pattern files in one parallel batch. lofi collapses to a single wave
(shell + kit + `lofi-patterns.md`).

**Read only the sections you need.** The docs are local and read-only, so there's nothing to fetch or
cache — but they're large, so still **`Read` only the sections in play**, never a whole guideline file
(the more components you bring in under the rule above, the more this matters):
- **Tokens doc** (`design/DESIGN-DS2.md` or `design/DESIGN-DS3.md`) — read only light-theme tokens;
  ignore everything from `  dark-primary:` on (dark-theme / animation / interaction-state are noise). In
  DS3, read the geometry tables (Component heights, Shapes, per-component `components:` block) — they
  carry the DS3 control/row heights, radii, and font directly.
- **component guide (essence)** — read the entries for the components the screen renders **plus** the
  "Hand-authoring anatomy" section for any high-risk interactive ones. For an escalated `{component}.md`,
  `Read` only the relevant sections (Anatomy, Sizes/Spacing, Visual States, Do's & Don'ts), not the whole
  file. Shared across versions; apply the DS3 variant notes in DS3 runs.

**Design-Patterns caveat** — `design/Design-Patterns/layout-patterns.md` is labelled "DS3 Layout
Patterns". Use it for layout structure (content padding, card containers, gap values) but do
**not** apply its DS3 shell dimensions (56px TopBar, 296px sidebar) — they conflict with the DS2 shell.

### Phase 2 — Fetch icons from local source

Icons live in `$SKILL_ROOT/resources/icons/source.json` (883 icons, keyed by `{name}{Style}{size}`).
See the "Icon keys" section above and `resources/icons/index.md` for key resolution.

1. **Decide all icons upfront** — list every icon the screen needs before any fetch (the page-title
   leading icon, nav, action buttons, row actions, status indicators, empty states). Skip the four already in the shell
   sprite: `addOutlined16`, `applicationOutlined24`, `broadcastOutlined20`, `lockOutlined20`.

2. **Resolve keys** — derive from the naming convention; use `resources/icons/index.md` for
   directional/pattern keys. If a key returns `null`, try both `Outlined`/`outlined` casings.

3. **Check the keys resolve** — one call confirms each key is present (don't read the whole
   `source.json`, and don't read the bodies — step 6 emits them straight to a file). Prints
   `<key>: ok` / `<key>: null`; resolve the `null`s via steps 4–5:
   ```bash
   bash "$SKILL_ROOT/resources/scripts/icon-source.sh" check \
     campaignOutlined20 homeOutlined20 filterOutlined20 searchOutlined20 editOutlined16 trashOutlined16
   ```

4. **Alias-search `source.json` locally for un-derivable / `null` keys** — before any MCP call.
   Icons are named by **shape, not use case**, so a use-case word often misses. Search the keys
   with a regex of shape synonyms (e.g. delete → `trash|bin|remove`), then feed the chosen key to the
   sprite builder in step 6:
   ```bash
   bash "$SKILL_ROOT/resources/scripts/icon-source.sh" search 'trash|bin|delete|remove'
   ```

   Both helpers (and `build-sprite.sh`) use `jq` when present and fall back to `python3` automatically —
   don't call raw `jq` yourself, and don't hand-write a fallback (see the runtime-fallback guardrail).

5. **MCP fallback** — only if local search is dry. `search_icons` with the same synonyms, then
   `get_icon_info` (`raw_svg: true`) for the chosen key.

6. **Assemble the sprite into a file — never type it.** SVG path data is the slowest content to emit
   (high-entropy coordinates tokenize ~2.4× worse than HTML — 46 s / 120 B/s for one screen's sprite)
   and already exists verbatim in `source.json`, so emit it with the helper and let Phase 3 inject it
   (copied, never typed). It writes one `fill-rule="evenodd"` `<symbol>` per resolved key, skipping any
   absent from `source.json`:
   ```bash
   SPRITE="${TMPDIR:-/tmp}/sprite.html"   # remember this path for the Phase 3 inject
   bash "$SKILL_ROOT/resources/scripts/build-sprite.sh" "$SPRITE" searchOutlined20 filterOutlined20 editOutlined16 …
   ```
   For a key resolved via MCP (step 5), append its `<symbol>` line to `$SPRITE` by hand. Truly
   unresolvable → append `<!-- ICON_MISSING: <keyword> -->` and use a neutral 24×24 circle placeholder.

**Never** use emoji, emoticons, or SVG paths recalled from memory (Core Rule 3).

### Phase 3 — Generate prototype

**Copy the shell, never retype it.** The shell (~31 KB), state switcher (~8 KB), and icon sprite
(~7.5 KB) are ~60% of the file and either identical every run or already on disk — re-emitting them
is the single biggest waste in generation (the sprite alone measured 46 s to *type*; it injects in
~1 s). So:

1. **Copy the shell and inject the boilerplate in one Bash call** — `cp` the product's shell from the
   Phase 0 table to `<out>.html`, then inject the sprite (and, hifi with >1 state, the switcher) in the
   *same* command. Don't split these across turns and don't paste either file — copy them. The `inject`
   helper replaces a marker line with a file's contents (literal match, so `*`/`/` in markers need no
   escaping); the sprite is `$SPRITE` from Phase 2.
   ```bash
   cp "$SKILL_ROOT/resources/<product-shell>.html" <out>.html
   inject(){ awk -v m="$1" 'index($0,m){while((getline l < "'"$2"'")>0)print l;next}1' "$3">"$3.tmp"&&mv "$3.tmp" "$3"; }
   inject '<!-- ICON_SPRITE_INJECT -->' "$SPRITE" <out>.html                                   # icons — always
   inject '<!-- SWITCHER_INJECT -->'    "$SKILL_ROOT/resources/state-switcher.html" <out>.html # switcher — hifi, >1 state only
   ```
   **lofi:** inject the component CSS kit at the token slot instead (copied, not authored), and **no
   switcher, no `PROTOSTATES`** (single view):
   ```bash
   inject '/* DS_TOKENS_INJECT */' "$SKILL_ROOT/resources/lofi-ds2-style.css" <out>.html   # lofi-ds3-style.css for ds:3
   ```
2. **`Edit` only the screen-specific slots** at the markers below — each edit's new text is content
   you'd emit anyway; the boilerplate is never re-typed. The slots target **distinct markers**, so the
   edits are independent — issue them as parallel `Edit` calls in a single message, not one per turn. The marker rows (`DS_TOKENS_INJECT`,
   `PAGE_CONTENT_INJECT`, `PAGE_END_INJECT`) are common to every shell; the title / primary-action /
   nav anchors below are the **AdCloud** shell's. For the **AIQUA/BotBonnie** shells use the equivalent
   anchors named in that shell's `CUSTOMIZABLE ZONE` comment (page title, active rail/nav item via
   `.active`, and dialogs/drawers at the `<!-- OVERLAY_INJECT -->` marker those shells provide):

| Slot (anchor in the copied file) | What to inject |
|---|---|
| `/* DS_TOKENS_INJECT */` | **hifi:** `--color-*`, `--shadow-*`, `--radius-*` from the tokens doc **plus** the screen's component CSS. **lofi:** already filled by the injected kit — add only screen-specific layout CSS, and build the page content with `kit-*` classes |
| page title (leading icon + text) — `.page-title-icon` svg + `<h1 class="page-title">Page title</h1>` *(AIQUA/BotBonnie)*; `<h5 class="css-b9p9v6">Page Title</h5>` *(AdCloud — text only, no leading icon)* | **Mandatory — always set this; never ship the shell's default `Page title`/`Page Title`.** Replace the shell's title row **in place**: set the `<h1>`/`<h5>` text to the screen name, and (AIQUA/BotBonnie) swap the inline `.page-title-icon` `<svg>` for the screen's icon as `<svg width="24" height="24" fill-rule="evenodd"><use href="#{key}"></use></svg>` — `{key}` resolved in Phase 2, never a hand-typed path (Core Rule 3); the leading icon usually mirrors the active nav section. (AdCloud is **text-only** — set the `<h5>`, no leading icon.) This row is the **one** page title — do **not** inject a second title/heading-with-icon at `PAGE_CONTENT_INJECT` (causes a double header); start injected content at the first toolbar/section/card |
| header `.btn-primary` (label `Create`) *(AdCloud)* | the screen's **single** primary action (label, icon, `onclick`) — do **not** add a second primary CTA inside `.page-content`; this is the one place it lives |
| active nav `<a>` *(AdCloud)* | add `v4-jss38` + `aria-current="page"` to the correct nav link |
| `<!-- PAGE_CONTENT_INJECT -->` | the screen UI |
| `<!-- PAGE_END_INJECT -->` | the page `<script>` — JS data arrays, render functions, state functions. **hifi (>1 state):** also `window.PROTOSTATES` (see below). **lofi:** no `PROTOSTATES` — single view |

Do **not** restructure the topbar, sidebar/rail, header, JS, or any CSS outside these slots. If a
delegated subagent does the write (Rule B), it runs this same cp + inject + edit flow.

**Every shell is used verbatim — DS applies to content only.** The AIQUA and BotBonnie shells are
the DS3-native product chrome; copy them as-is like any shell (Rule 1) and apply DS3 only inside the
content area. If the user *overrides* AdCloud to DS3, the AdCloud shell likewise stays **verbatim**
(Open Sans chrome, 48px header, existing nav/header) and DS3 applies only inside `.page-content` —
tokens, geometry, and components on the screen UI, shell untouched. The only DS3-specific shell touch
is adding the Inter font link for the content (an AdCloud shell keeps Open Sans chrome).

**State switcher (hifi, >1 state only — never lofi).** Injected by the Bash step above; your only job
is to define `window.PROTOSTATES = [{id, label, apply}, …]` in the page `<script>` — one entry per
Phase-0 state, first is the default, each `apply` calling the page's own state functions (`showEmpty`,
`openCreate`, …; see the contract comment in that file). It is **not** product UI — keep it wired to
the real state functions, never faked.

**Context overflow prevention — always apply these two rules:**

**Rule A — JS-render any repeated block.** Any block that repeats 3+ times — table rows, metric
cards, filter chips, form fields, list items — is written as a compact JS data array + a render
function, never as repeated inline HTML. One `renderRows(ROWS)` instead of 8 `<tr>`s (and likewise
`renderCards`, `renderChips`, …). This cuts ~70% off that block's output (~15,000–20,000 tokens for a
typical table) and is the single most effective guard against the context limit. Rows are the
canonical case:

```html
<tbody id="campaignTbody"></tbody>
…
<script>
var ROWS = [
  {id:'c001', name:'JP Summer Sale 2026', status:'active', type:'Retargeting',
   format:'Display', budget:'¥5,000,000', imp:'2,847,301', clk:'42,158',
   ctr:'1.48%', start:'Jun 1, 2026', end:'Aug 31, 2026'},
  /* …more rows… */
];
function renderRows(data) {
  document.getElementById('campaignTbody').innerHTML = data.map(function(r) {
    return '<tr class="tbl-row" data-id="' + r.id + '" data-status="' + r.status + '">'
      + '<td class="col-cb"><input type="checkbox" class="cb row-cb" onchange="toggleRow(this)"></td>'
      + '<td class="col-name"><a class="campaign-link" href="#" onclick="openEditDialog(\'' + r.id + '\');return false;">' + r.name + '</a></td>'
      + '<td><span class="status-badge ' + r.status + '">' + r.status.charAt(0).toUpperCase() + r.status.slice(1) + '</span></td>'
      /* …remaining cells… */
      + '</tr>';
  }).join('');
}
renderRows(ROWS);
</script>
```

**Rule B — Delegate to a subagent for complex screens.** If the screen pairs a table with two or
more overlays (dialog/drawer), or the file will exceed ~50KB, delegate the whole build to a subagent
via the `Agent` tool. Pass it a compact brief (token CSS, the **prebuilt `$SPRITE` path** — not icon
markup to retype, JS data arrays, feature spec, and the slot anchors) and have it run the cp +
sprite/switcher-inject + `Edit` flow above. The parent session only receives
`"File written: name.html"` — no generation tokens land in the parent context:

```
Agent({
  description: "Write campaign-management.html",
  prompt: "Copy the shell to <path>, inject the sprite + switcher, then Edit the slots. Full spec: …"
})
```

Rule A alone is sufficient for most screens. The Rule B trigger is **mechanical, not a judgment
call** — apply it whenever it matches (table + 2+ overlays, or >50KB), and when unsure, delegate.

**If the `Agent` tool isn't available** (e.g. Claude Chat's skill runtime exposes only Bash + file ops
+ Edit — `allowed-tools` requests it, the host may not grant it), don't block: fall back to **Rule A +
inline build**. You lose the parent-context token savings, not correctness. For an oversized screen in
that mode, prefer building incrementally (shell + table first, then add each overlay via the "patch,
don't regenerate" path below) to keep each turn's output — and tool-call count — small.

Place the output in the user's current working directory unless they specify otherwise.

**Iterating on an existing prototype — patch, don't regenerate.** When the user asks to change an
already-built prototype, never rebuild the file. Locate the one slot that changes (the `.page-content`
block, the `ROWS`/data array, the token block, a single state function) and `Edit` only that region.
Regenerating a 77 KB file to alter one section is the costliest avoidable move in the loop; a targeted
edit is a few KB. Then re-run Verification for the **affected states only**.

**Converting lofi → hifi (once a direction is confirmed).** lofi is built to upgrade in place — its
single view already has the real markup, `kit-*` classes, content, and JS-rendered data. Converting is
mostly a **CSS-layer swap, not a regenerate**:
1. run Phase 1 now for the components the lofi build actually uses (you can read them straight off the
   screen — no guessing) — tokens doc + each `design/component-guidelines/*.md`;
2. **replace the injected kit CSS** — the block between `/* KIT-CSS-START … */` and `/* KIT-CSS-END */`
   — with token-exact CSS for the same `kit-*` selectors (`Edit` that one region), adding rules for
   any component the kit didn't cover;
3. **add the states** lofi skipped — decide the state set (Phase 0), build empty/selected/overlays,
   inject the switcher, and define `window.PROTOSTATES`;
4. apply the full **hifi** Verification across every state, including checks 5–6 the kit had owned.
The markup and class names carry over, so the populated view is one `Edit` plus refinements; the new
work is the additional states — and the lofi round's direction decisions carry over intact.

## Core rules

1. **Shell is verbatim — copy it, never retype it.** `cp` the template to the output; the only
   permitted changes are the Phase-3 slot edits. Never rewrite the sidebar markup, header, or
   `<script>` block.
2. **Design resources are bundled locally — read them, never recall from memory.** Read the chosen
   version's tokens doc (`design/DESIGN-DS2.md` or `design/DESIGN-DS3.md`), component-guidelines,
   and Design-Patterns from `$SKILL_ROOT/resources/design/` (Phase 1). Never use token values or
   component rules recalled from memory. *(lofi: the kit + `lofi-patterns.md` are the resources
   instead — see Guardrails.)*
3. **Icons from source.json first, MCP as fallback** — no emoji, no emoticons, no SVG paths from
   memory. Extract only needed icons from `$SKILL_ROOT/resources/icons/source.json` via the Phase-2
   helpers (`icon-source.sh`, `build-sprite.sh` — they use `jq` or `python3`, never raw `jq`); fall
   back to `get_icon_info` (with `raw_svg: true`) only for keys absent from that file.
4. **Icon SVGs: `fill-rule`, explicit size, inheritable color.** Every `<symbol>` and every `<svg>`
   wrapper around a `<use>` carries `fill-rule="evenodd"`. Each icon `<svg>` must also **declare its
   own `width`/`height`** — a `<use>` svg with none balloons to the default ~300×150 — and use
   **`fill: currentColor`** so it follows its container's text color (a white-text primary/danger
   button's leading icon must turn white; a colored sort/status icon must pick up that color).
   Reveal a hidden icon with `inline-block`/`inline-flex`, never bare `display:block` (it breaks to a
   new line and reads as a giant detached glyph).
5. **Self-contained output** — the `.html` file must open without a build step. Inline all CSS
   and JS. The Google Fonts `<link>` already in the template is the only external dependency.
6. **Match the chosen DS version (Phase 0); never mix the two in one prototype.**
   *DS2 (default):* `#296AFF` primary, `#000A3A` text-high, 32px controls, 4/8px radii, Open Sans,
   shadows on chrome. *DS3:* the shell stays as-is (Rule 1) — apply DS3 only to the **page content**:
   same semantic colors but Inter, 40px controls, 8/12/16px radii, full-pill filter chips, and
   borders-only card elevation — exact values in `design/DESIGN-DS3.md`.
7. **Realistic content** — use plausible data, real-sounding names, domain-accurate labels.
   No lorem ipsum. CTAs use plain verbs in sentence case ("Create campaign", not "Submit").

## Guardrails

- **Guideline access required (hifi) — hard stop if a needed bundled doc is missing.** All guideline
  docs ship under `$SKILL_ROOT/resources/design/`. If a doc the screen needs is missing or unreadable
  there, stop immediately, tell the user exactly which file failed and why, and wait. Do **not** fall
  back to recalled knowledge, approximations, or partial output. *(lofi relies on the local kit +
  `lofi-patterns.md` instead — but those files must be readable; if either is missing, stop.)*
- **Runtime commands must degrade, not hard-fail.** The environment may lack a CLI tool — Claude Chat's
  sandbox, for instance, ships `python3` but not always `jq`, and may have no Chrome. A skill can't know
  this upfront; it's discovered only by running the command. So never assume a non-core tool is present:
  route optional-tool work through the bundled scripts, which probe with `command -v` and fall back
  (`jq`→`python3` in the icon helpers; no Chrome→source-level review in `screenshot-states.sh`). Don't
  hand-write raw `jq`/tool calls in the workflow, and if a script prints a sentinel (`NO_JQ_OR_PYTHON`,
  `NO_CHROME`), follow its fallback rather than aborting. Core POSIX tools (`cp`, `awk`, `mv`) are assumed.
- Never write React or TSX. Output is always a `.html` file.
- Never leave the `<!-- WORDMARK_ASSET -->` slot empty if you have brand assets; if not, leave
  the comment as-is (the template handles logo-only display correctly).
- If a guardrail conflicts with the user's request, surface the conflict and ask rather than
  silently overriding.

## Verification

After writing the output file, confirm. *(lofi: the bar is layout, direction, and **pattern
compliance**, not pixels — checks 1–4 and 8 hold, the kit owns 5–6, and check 7 (states) does **not**
apply (lofi is a single view). Additionally confirm the screen obeys `lofi-patterns.md`: right
component for the job, correct filter selection model, single primary, verb-named dialog buttons.
Screenshot the **one** view (`file://<out>#shot`, no `#state=`) and judge whether it reads correctly
and uses the right patterns — not whether spacing is pixel-exact.)*

**Structural integrity**
1. Every `<use href="#…">` references a `<symbol id="…">` present in the sprite — no broken refs.
2. Core Rule 4 holds for every icon — spot-check a white-text button's icon (must turn white) and a
   hover-revealed sort arrow (correct size, not a giant detached glyph).
3. Every CSS `var(--…)` used in the page content has a corresponding declaration in the
   DS_TOKENS_INJECT block.
4. The file has no external resource dependencies beyond the Google Fonts link already in the template.
   **Also — page title:** the title row is set to the screen name (no shell left at the default
   `Page title`/`Page Title`), and no second page-level heading was injected at `PAGE_CONTENT_INJECT`.

**Design quality** — structural checks aren't enough; review the screen against the design
principles (`Read $SKILL_ROOT/resources/design/DESIGN-PRINCIPLES.md` if not already loaded):
5. **Hierarchy & contrast** — one clear primary per region; selected / error states are unmistakable,
   not a faint cue alone; sections divided by surface or border, not a soft shadow.
6. **Grouping** — related fields and controls share a container or inset sub-section, not equal spacing.
7. **States** *(hifi)* — every state chosen in Phase 0 is actually built, not just the populated happy
   path. *(lofi is single-view — not applicable.)*
8. **Accessibility** — inputs bound to `<label>`, dialogs/controls carry `aria-*`, and every
   interactive element has a visible focus state.

**Render and judge — judge pixels, not markup.** Don't sign off from source alone. The helper renders
states concurrently with headless Chrome (each capture bounded), and prints `NO_CHROME` + exits 1 if no
browser is found — then fall back to source-level review and say so in the report.
```bash
SHOT="$SKILL_ROOT/resources/scripts/screenshot-states.sh"
bash "$SHOT" "$OUT" "$TMPDIR"                                  # lofi: single #shot view → judge checks 5–6 + pattern floor
bash "$SHOT" "$OUT" "$TMPDIR" populated empty selected drawer-create confirm   # hifi: your PROTOSTATES ids
```
Then `Read` each PNG from `$TMPDIR` and apply the checks (lofi: 5–6 + pattern floor; hifi: 5–8). Fix
and re-shoot on any issue.

Report the output file path, the product/shell and DS version used, and which guideline and Design-Pattern files were consulted.
