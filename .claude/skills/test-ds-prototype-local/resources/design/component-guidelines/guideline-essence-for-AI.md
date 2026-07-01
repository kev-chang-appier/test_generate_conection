# Appier Design System — Agent Component Guide

**Last updated:** 2026-06-30

A consolidated, decision-oriented index of every Appier DS component, written for a capable LLM building DS2 / DS3 UI. It is **not** a full spec — it deliberately omits generic UX advice a capable model already knows (e.g. "one primary button per surface", "icon-only buttons need a tooltip", "sentence-case labels", "validate inline"). It keeps only what a model **cannot** infer: which components exist, their exact names, version availability, how to pick between siblings, Appier-specific variant/size names, and the non-obvious rules.

**How to use this file**
1. Scan the index to pick the right component and confirm it exists in your target version.
2. Read its entry for selection logic and the **Watch** gotchas.
3. For exact tokens, geometry, anatomy, and full do's/don'ts, open the depth layer:
   - **Token / geometry values** → [DESIGN-DS3.md](../DESIGN-DS3.md) · [DESIGN-DS2.md](../DESIGN-DS2.md) · cross-version deltas in [DS3-vs-DS2.md](../DS3-vs-DS2.md), or the live `mcp-design-system-ui` MCP (`get_design_tokens`, `get_component_info`).
   - **Full per-component doc** → the sibling `<name>.md` in this folder (e.g. [button.md](button.md)).
   - **Layout / placement** → [Design-Patterns/layout-patterns.md](../Design-Patterns/layout-patterns.md). **Copy / labels** → [guidelines-ux-writing/](../guidelines-ux-writing/).

> **⚠ Hi-fi escalation — for these components this essence is NOT enough; open the full `<name>.md` before authoring CSS.** Their DS visual form diverges from the generic/market default far enough that this essence + a model's own priors produce a plausible-but-wrong render: **Stepper** ([stepper.md](stepper.md) — no ✓ on completed steps; warning/error icon has no circle), **Filters** chips ([filters.md](filters.md) — unset chip = solid border, no clear-icon; × clear-icon appears only once a value is set), **Loader** ([loader.md](loader.md) — four-square loop animation, not a ring spinner), **Pagination** ([pagination.md](pagination.md) — Rows-per-page select + range + nav cluster: first / prev / `[n] / N` page input / next / last; chevron nav icons, no numbered page buttons), **Menu** ([menu.md](menu.md) — borderless in-menu search; selected = blue/primary text only (no bg, no check); Apply / Select-all footer), **Toast** ([toast.md](toast.md) — severity tints the whole panel: `semantic-bg-*` background + matching `semantic-*` icon, Hint recipe; DS2 and DS3 identical), **UploadWindow** ([upload-window.md](upload-window.md) — 288px collapsible panel with a blue title-bar, not a notification stack), **ContentAssistant** ([content-assistant.md](content-assistant.md) — 48px round button → 400px panel with a blue header bar, not a chat bubble). (Selection from this essence is still fine; it's the *visual* layer that needs the full file.)

> Maintainers: keep entries terse and free of generic UX truisms. If a capable model would already assume it, it does not belong here.

---

## The version model (read first)

DS3 is a **restyled, curated subset of DS2** — same component API (names, variants, props), same behavior and state logic. Only the visual layer differs: larger radius, more spacing, Inter (not Open Sans), flatter elevation (borders for structural chrome, shadows only for floating surfaces). **Enterprise products use DS3; legacy surfaces may remain on DS2.** When the version is unspecified, default to DS3 for new work.

Because the API is shared, "how to use" is version-agnostic. What changes per version is **geometry** (see the [DS3-vs-DS2 tables](../DS3-vs-DS2.md)) and **availability** — which is the high-risk part:

### Availability cheat-sheet (the non-obvious gaps)

| Situation | Components | What to do |
|---|---|---|
| **No DS3 component** — DS2 only | `TextButton` | Use `Button` **Minimal** variant in DS3 |
| | `Breadcrumb` / `BreadcrumbItem` | Compose from `Link` in DS3 |
| | `ContentAssistant` | Compose an absolutely-positioned `Drawer` / floating surface in DS3 |
| | `ConnectorCard` | Compose `Card` + platform icon + `Badge`/status in DS3 |
| | `ScopedSearch` | Compose `TextSelect` + `Search` in DS3 |
| | `EditColumnConfig` (table column settings) | No DS3 equivalent |
| | `ProductTour` | Keep DS2 until a DS3 version ships |
| **Figma-only** — no code counterpart | `Sidebar`, `Progress bar` / `Progress bar_budget goal` | Confirm with the DS team before implementing in code |
| **DS2 implementation reused in DS3** (no dedicated DS3 styling/stories — picks up Inter via global tokens) | `Dropzone` / `FileInfoCard`, `UploadWindow`, `Skeleton`, `Loader` family | Safe to use; just expect DS2-era visuals |

### Cross-cutting rules

- **AI-surface exclusivity:** `Button` **AI Exclusive** variant, `TriggerButton`, and `Badge` **AI** variant are reserved strictly for AI-powered surfaces / AI-generated content — never decorative use elsewhere.
- **Action-button placement** (page header / dialog / drawer footer, group gap 12px DS3 / 8px DS2) is defined centrally in [DESIGN-DS3.md → Placement patterns](../DESIGN-DS3.md#placement-patterns) — don't reinvent per component.
- **Immediate vs deferred selection:** `Switch`, `ToggleButtonGroup`, `SegmentedControl`, single-select pickers apply immediately; `Checkbox` / `Radio` apply on form submit. Pick by whether a commit step exists.

---

## Inputs

### Button, SplitButton, IconButton, TextButton, TriggerButton
**Is:** Action triggers; `Button` is default and can render icon-only. **Availability:** DS2+DS3, except `TextButton` (DS2/Figma only — no DS3 component, use `Button` Minimal). `TriggerButton` lives in the AI Copilot library.
**Pick when / vs siblings:** `Button` = all standard actions; `IconButton` = dedicated icon-only in tight spaces (header/table rows); `TextButton` = low-emphasis inline (DS2 only); `SplitButton` = primary action + dropdown alternatives; `TriggerButton` = AI/Copilot surfaces ONLY; mode switches → `ToggleButtonGroup`.
**Variants:** Primary, Secondary, Minimal, Emphasis (blue border/text when a blue fill would clash with the surface), Danger, AI Exclusive (gradient, AI surfaces only). **Sizes:** M 40px(DS3)/32px(DS2), S 32px(DS3)/24px(DS2).
**Watch:**
- Icon-only buttons (incl. table row actions) — **always pair a `Tooltip`** (its text is the accessible label; verb-first, 2–4 words, e.g. "Delete campaign"). `aria-label` alone is not sufficient — it gives no visible hover affordance.
- `TextButton` has no DS3 equivalent — substitute `Button` Minimal.
- AI Exclusive variant and `TriggerButton` are forbidden outside AI surfaces.
- Loading is a built-in state on `Button`, NOT a separate component (Figma's `*Loading button` is Figma-only).

### TextInput, Textarea, AffixInput, QuantityInput, StepperInput
**Is:** Free-form text and numeric entry family; shares height/border/radius/state tokens. **Availability:** DS2+DS3.
**Pick when / vs siblings:** `TextInput` = single-line; `Textarea` = multi-line; `AffixInput` = static prefix/suffix label (e.g. `$`, `https://`, `.com`); `QuantityInput` = numeric with up/down caret controls + optional unit; `StepperInput` = numeric with −/+ operator buttons (a minimal variant of `QuantityInput`).
**Sizes:** DS3 40px inline / 68px stacked; DS2 32px (56px stacked). **States:** Summary = read-only display variant on `TextInput`.
**Watch:**
- Affixes are display-only — never put interactive controls inside; use a trailing icon on `TextInput` instead.
- Required marker `*` color: `semantic-red` in DS2, `text-high` in DS3.
- `TextInput` Summary state hides the editable affordance — use only for confirmed read-only displays.

### Search, ScopedSearch
**Is:** Keyword filter/locate field with built-in search icon, clear button, placeholder. **Availability:** `Search` DS2+DS3; `ScopedSearch` has no DS3 variant.
**Pick when / vs siblings:** `Search` = filter a table/list by text; `ScopedSearch` = only when scope/category narrowing is genuinely required (DS3: compose `TextSelect` + `Search`). Inside a dropdown menu use the built-in search of `TextSelect`/`MultiSelectFilter`, never a standalone `Search`.
**Watch:**
- `Search` keeps its pill radius (20px) in **both** versions — unlike other inputs it is not re-rounded in DS3.
- No label in control bars — icon + placeholder suffice.

### Dropzone, FileInfoCard
**Is:** Inline file selection (drag-drop or browse) with per-file status/preview; `FileInfoCard` is the single-file row it renders. **Availability:** DS2 component reused in both versions (no dedicated DS3 styling/stories).
**Pick when / vs siblings:** `Dropzone` = inline form file input where attach + status share the view; for background/batch uploads use `UploadWindow`. Use `FileInfoCard` directly only for custom file-list layouts.
**Variants:** Card (default — stacked rows, any non-image/multi-file), Image (single thumbnail, hides dropzone once a file is present — single-image only).
**Watch:**
- Never use Image variant for multi-file or non-image uploads.
- Show the row loading state the moment a file is dropped (before upload finishes) to block duplicate submissions.

---

## Selection

### Checkbox, CheckboxGroup, CheckboxTree
**Is:** Zero-or-more selection, applied on form submit. **Availability:** DS2+DS3.
**Pick when / vs siblings:** `Checkbox` = single item; `CheckboxGroup` = flat list of 2+; `CheckboxTree` = hierarchical parent-child multi-select. Use `Switch` (not Checkbox) for settings that take effect immediately; never mix `Checkbox` and `Radio` in one group.
**Sizes:** box 14px(DS2)/16px(DS3). **States:** Indeterminate (dash) for partially-checked parents; Summary checkbox = dimmed non-interactive parent visual.
**Watch:**
- Checked = white `checkOutlined` glyph on `primary` fill; indeterminate = white `minusOutlined` glyph. Don't hand-draw a CSS tick — use the DS glyph, or a native `<input>` + `accent-color: {primary}`.
- Checkbox/Radio are **low-risk** — the native control + `accent-color` is acceptable; the anti-native guardrail targets `Select`/`DatePicker`/free-form tags, not checkboxes.
- Cap `CheckboxTree` nesting at 3 levels; children indent 16px/level.
- Horizontal layout only for 2–3 short labels (or tag-style wrapping sets); 4+ items go vertical.

### Radio, RadioGroup
**Is:** Exactly-one selection from mutually exclusive options, applied on submit. **Availability:** DS2+DS3.
**Pick when / vs siblings:** Use when exactly one must be chosen and zero is invalid; if zero is valid use `Checkbox`; for >6 options use a `Select`; for 2–3 compact mode options consider `ToggleButtonGroup`/`SegmentedControl`.
**Sizes:** circle 16px(DS2)/18px(DS3).
**Watch:**
- Never nest a `RadioGroup` inside another `RadioGroup`.
- Horizontal layout only for ≤3 options with short labels.
- An optional badge ("Recommended", "Beta") can sit beside a `Radio` label.

### Switch
**Is:** Binary on/off setting that applies immediately, no form submit. **Availability:** DS2+DS3 (behavior identical; DS3 only widens track 36→38px).
**Pick when / vs siblings:** `Switch` for immediate-effect on/off; `Checkbox` when the change defers to a form submit.
**Watch:**
- Binary only — never for more than two options.
- Never use a `Switch` that looks immediate but silently defers — use `Checkbox`.
- Don't rewrite the label to its position ("On"/"Off") — name the setting once; the track shows state.

### TextSelect, TagSelect, SingleSelectFilter, MultiSelectFilter, SelectableTag
**Is:** Choose from a predefined option list; each variant targets a specific context. **Availability:** DS2+DS3.
**Pick when / vs siblings:** `TextSelect` = default form-field dropdown (single or multi; multi shows inline pills); `TagSelect` = multi-only form field where selections render as dismissible chips; `SingleSelectFilter` = filter toolbar, closes on select; `MultiSelectFilter` = filter toolbar with checkbox list + Apply/Cancel; `SelectableTag` = visible toggle-chip row, no dropdown. Don't use a Select for binary (→ Checkbox/Switch) or 2–3 exclusive visible options (→ ToggleButtonGroup/RadioGroup).
**States:** Selected menu item = `primary`/blue label text only — **no** background fill and **no** check icon. (The `compBg/blueLite` tint is for `SelectableTag`/`TagSelect` chips, not menu items.)
**Watch:**
- Turn on inline search at >10 options; virtualize at 100+.
- `SelectableTag` cap 6–8 chips per row; beyond that use `TagSelect`.
- `MultiSelectFilter` is not committed until Apply — never drop the Apply/Cancel footer.
- Don't mix multi-select `TextSelect` and `TagSelect` in the same form.

### DatePicker, DateRangePicker, DateQuickSelectionPicker, TimePicker
**Is:** Temporal input via calendar/time dropdowns on a text trigger. **Availability:** DS2+DS3 (DS3 only widens panel radius; behavior unchanged).
**Pick when / vs siblings:** `DatePicker` = single date (no Apply — commits on each pick); `DateRangePicker` = start+end with Apply/Cancel; `DateQuickSelectionPicker` = preset windows (Today / Last 7 / 30 days / All time / Custom) for dashboards/analytics; `TimePicker` = hour+minute via two selects.
**Watch:**
- `DateRangePicker`/QuickSelection: the live preview is NOT a confirmation — only Apply (or Clear) commits.
- `TimePicker`: setting min hour ≥ max hour silently falls back to the full 0–23 day.
- Localise visible labels (Today, Apply, Cancel) — not auto-translated.

### Slider
**Is:** Pick an approximate value or ordered level within a bounded range by dragging/clicking the track. **Availability:** DS2+DS3 (DS3 only adds a `border-general` outline on the handle).
**Pick when / vs siblings:** Use for low-to-high progressions (thresholds, budgets, Low/Med/High); for exact values use `Input` (or pair Slider+Input); for unordered options use `Select`/`SegmentedControl`; for binary use `Switch`/`Checkbox`.
**Watch:**
- Only for ordered options with a clear low-to-high progression — not unordered sets.
- Cap at ~7 labeled levels and ~20 stops; beyond that use `Select`.
- Always show the current value/level label; for ordered sliders show tick marks + labels at each stop.

### ColorPicker
**Is:** Inline panel for color selection via saturation/brightness gradient, hue+alpha sliders, and Hex/RGBA input. **Availability:** DS2+DS3 (DS3 widens panel to 300px; numeric inputs 28→32px).
**Pick when / vs siblings:** Use for free color choice (brand/chart/text/bg); for a fixed brand palette use a `Select` with color swatches instead (prevents off-brand values).
**Watch:**
- Accepts only `#rrggbb` hex or `rgba(…)`; hex is treated as fully opaque.
- Needs ~260px width — never inline in a table cell or tight sidebar; pair with a swatch-button trigger in a `Popover`.
- Eyedropper is not part of the panel — offer as a separate icon button only where the browser supports it.

### SegmentedControl
**Is:** Compact single-select for switching 2–4 modes/filter presets in toolbar/control-bar contexts. **Availability:** DS2+DS3 (DS3 adds a `blue-normal` outline on the active pill).
**Pick when / vs siblings:** Use inside toolbars/control bars; for standalone mode toggles outside a toolbar use `ToggleButtonGroup`; for >4 options use `Tabs`; for multi-select use a Checkbox group.
**Variants:** Text, Icon (icon-only, always with a Tooltip; icon segment 52px).
**Watch:**
- 2–4 options only; one segment must always be selected on first display.
- Size all segments to the longest label so the control reads as one unit — never let segments size to their own text.
- Don't place on a tinted surface that washes out the `surface-primary` active pill.

### ToggleButtonGroup, ToggleButton
**Is:** Standalone single-select for persistent settings (view mode, theme, platform) outside toolbars; selection immediate, no confirm. **Availability:** DS2+DS3.
**Pick when / vs siblings:** Standalone page-level mode/view toggles (list/grid); for compact toggles inside a toolbar use `SegmentedControl`; for >4 options use `Tabs`; for multi-select use a Checkbox group.
**Watch:**
- 2–4 items only; one item must always be active on first display.
- Don't give some items an icon and others none within one group; don't drop unrelated controls into the toggle row.

---

## Navigation

### Sidebar
**Is:** Left-edge primary navigation shell — section links, collapsible groups, workspace/product switcher. **Availability:** DS2+DS3, **Figma-only** (no Storybook/code export). DS2 ships `Sidebar (AIQUA)` / `Sidebar (AIXON)`; DS3 consolidates into one `*sidebar 3` and moves product branding to the top nav bar.
**Pick when / vs siblings:** Cross-section app navigation only. For in-page section navigation use `Tabs` or `SegmentedControl`.
**Watch:**
- Nesting capped at one level (top-level → sub-item); never deeper. Never create a group with only one item.
- All top-level items have icons; don't mix icon and no-icon items. Sub-items have no icon.
- Navigation only — no action triggers (buttons, filters) in the sidebar.
- If a group containing the active sub-item is collapsed, the group header must carry the active highlight. DS3 width fixed 296px.

### Breadcrumb, BreadcrumbItem
**Is:** Hierarchy/back-navigation, lives only in the left slot of the 48px header bar. **Availability:** DS2 only — compose from `Link` for DS3.
**Pick when / vs siblings:** Page-hierarchy navigation. Not for filtering/view-switching (use `Filters`/`SegmentedControl`); not for multi-step progress (use `Stepper`).
**Watch:**
- Only the last crumb may be editable, and only when the page name is user-defined; ancestors must always be links. Provide a fallback name when the user clears it.
- An ancestor reads as a link only if given a destination — otherwise it looks like an ancestor (text-low) but isn't clickable.
- Paths over 4 crumbs auto-truncate (middle collapses to `…`). Never place outside the header bar.

### Tabs, Tab, TabList, TabPanel
**Is:** Named sections where one large panel shows at a time. **Availability:** DS2+DS3 (contained variant is new in DS3; default underline unchanged).
**Pick when / vs siblings:** Use when each option swaps a distinct, large content area. For 2–4 compact toggles with no content swap use `SegmentedControl`/`ToggleButtonGroup`.
**Variants:** default (blue underline indicator), contained (raised pill on a track).
**Watch:**
- Choose contained when tabs sit inside a bordered card/panel, on colored/dark backgrounds, or when the list may overflow — horizontal scroll for overflow works only in the contained variant.
- Don't nest Tabs in Tabs (if unavoidable, default outer / contained inner); don't mix icon-only and text-label tabs in one list.
- Preserve panel state across switches (no scroll/input reset).

### Pagination, PaginationTable
**Is:** Page navigation for a split dataset — rows-per-page select + record-range summary + nav cluster (first / prev / `[n] / N` page input / next / last). Chevron nav icons (`directionalDefaultLeft/RightOutlined20`); `jumpToFirst/LastOutlined20` for the ends. No numbered page buttons. **Availability:** DS2+DS3 (DS3 `Pagination` standalone; DS2 embedded inside `Table`).
**Pick when / vs siblings:** `PaginationTable` when paging a `Table`/`VirtualizedTable` (pre-connected to rows); standalone `Pagination` for lists/grids outside a table. Never put both on the same table.
**Watch:**
- The record-range summary ("1–50 of 320 items") is supplied by the product team — always provide it; it's the only place the count appears.
- Reset to page 1 when items-per-page changes; show the items-per-page selector only for large datasets (~100+ records), never empty.

### Link
**Is:** Navigation to a URL/route/anchor with standardized type sizing and color. **Availability:** DS2+DS3 (DS3 only thickens the hover underline to 1.2px).
**Pick when / vs siblings:** Going somewhere. For actions that change state (submit, delete, open dialog) use a Minimal `Button`.
**Sizes:** Small 12px, Medium 14px, Large 14px (`headline-5`, 600 weight).
**Watch:**
- No underline at rest — color (`primary`) is the only resting cue, so never recolor a Link to match body text. Underline appears on hover only.
- Never nest a Link inside another interactive element; never wrap a full paragraph.

### Stepper
**Is:** Progress indicator across a linear multi-step sequence; one node per step with a status. **Availability:** DS2+DS3 (same API; connector margin 4px DS2 / 12px DS3). Note: numeric +/- input is a different component, `StepperInput` (see Inputs).
**Pick when / vs siblings:** Linear sequenced flows. For independent (non-linear) sections use `Tabs`.
**States:** Current, Success, Warning, Error, Pending. Warning/Error render a standalone 24px icon (no circle); Success has no check icon.
**Watch:**
- Exactly one step must be Current at all times.
- Only completed (Success/Warning) steps may be clickable; never make an Error step clickable. Don't mark steps Success speculatively before submit.
- Don't place a Stepper inside a `Dialog` or `Drawer` — it belongs at the top of main content.

---

## Overlays

### MenuItem, MenuIconItem
**Is:** Building-block option rows for all DS dropdown menus — never standalone, always children of a select/filter/action menu. **Availability:** DS2+DS3 (DS3 single-line rows 40px vs 36px DS2).
**Pick when / vs siblings:** `MenuItem` = standard option row; `MenuIconItem` = wrapper adding leading/trailing icon slots (use when every item carries an icon). `TextSelect`/`SingleSelectFilter` take `MenuItem` children; `MultiSelectFilter` takes options directly (no MenuItem children).
**Watch:**
- Don't mix icon-bearing and icon-less items — switch the whole list to `MenuIconItem`.
- Cap submenu nesting at two levels; submenu opens on hover (tap on touch).
- Place destructive actions (Delete/Archive) last, after a divider — never at top.
- Add search at ≥7 items (auto-focus on open, except hover-opened menus); skip for ≤6.
- Don't repeat the parent `TextSelect` label in every item ("Active", not "Active status"). The menu's surface/border/radius/shadow are its own, not inherited from the parent.

### Dialog
**Is:** Modal overlay blocking all page interaction until resolved. **Availability:** DS2+DS3 (radius 16px DS3 / 8px DS2).
**Pick when / vs siblings:** Confirmations, alerts, short required forms. For forms >4 fields or multi-section use `Drawer`; for non-critical supplementary content use `Popover`.
**Watch:**
- Confirm label must name the verb in the title ("Delete campaign" → "Delete"); avoid "OK"/"Yes"/"Submit".
- Exactly one primary footer button, rightmost after Cancel; Danger variant for destructive actions. Close (×) in header only when there is no footer.
- Optional leading severity icon → **Solid** variant, **32×32, no background/circle**, colored to its own semantic (warning=orange, error=red, caution=yellow); don't mismatch glyph and color. The confirm button keeps its own semantic regardless.
- Centered in the viewport (both axes), never top-anchored. Header/footer dividers are scroll shadows — shown only when the body overflows, not by default.
- Fixed widths: 400/600/800/1000/1200px or full width. Form fields: place related settings adjacent / paired (short peers on a shared row), not one rigid column; keep a clear top-to-bottom reading path. Warn before discarding unsaved changes.
- Don't nest a Dialog inside a Drawer except for an unavoidable confirmation.

### Drawer, AbsoluteDrawerContainer
**Is:** Side panel sliding from the screen edge, keeps the underlying page visible — a longer-lived workspace than a Dialog. **Availability:** DS2+DS3 (non-modal variant and dynamic widths are new in DS3).
**Pick when / vs siblings:** Long/multi-section forms, or when the user needs page context while working. For a modal decision that must be made first use `Dialog`; for AI-powered floating panels use `ContentAssistant`.
**Variants:** Modal (default, backdrop) · Non-modal (no backdrop, page stays interactive — DS3 only).
**Watch:**
- Fixed widths SMALL 400 / MEDIUM 800 (default) / LARGE 1000px, or dynamic 25%/40%/55% (min 375, max 1000). DS2 MEDIUM default is 720.
- Title is a noun phrase naming the workspace ("Audience details"), not a verb phrase or restated page heading.
- Form fields: place related settings adjacent / paired (short peers on a shared row), grouped under section labels — don't force a single rigid column with equal spacing.
- Never apply the modal backdrop (`surface/mask`) to non-modal Drawers; always include a close (×). Don't nest a Drawer inside a Dialog.

### Popover
**Is:** Non-modal floating panel of rich supplementary content anchored to a trigger; auto-dismisses on outside click/Escape. **Availability:** DS2+DS3 (single shared component — no dedicated DS3 variant).
**Pick when / vs siblings:** Custom dropdown panels, date/color pickers, inline filters. For critical confirmations use `Dialog`; for short text hints use `Tooltip`.
**Watch:**
- The panel sets only `text-high`; the consumer supplies `surface/popover` fill, `border-popover` (lighter than `border-general`), and Shadow M.
- Anchor must look interactive (button/chevron/hover) — never anchor to plain body text or a bare icon.
- Open on click, not hover, when the panel contains buttons/inputs. Never apply the modal backdrop; allow auto-flip near viewport edges.

### ContentAssistant
**Is:** Floating, collapsible AI-assistant panel beside the workspace — a layout shell with trigger/header/body/footer slots (consumer fills content). **Availability:** DS2 only — compose an absolutely-positioned `Drawer` for DS3.
**Pick when / vs siblings:** Persistent on-demand AI capability. For non-AI side content or a larger canvas use `Drawer`.
**States:** Collapsed (only a built-in round 48px AI button visible) · Expanded (full panel). No built-in loading state — manage in the body.
**Watch:**
- Collapse state can be driven externally (e.g. a toolbar button); the trigger must be a single focusable element signaling AI.
- Footer = primary actions only, one emphasized commit rightmost (e.g. Send).
- Panel body uses `surface-primary`/`border-general`, not popover tokens; render at/near the page-layout root for consistent stacking.

### UploadWindow
**Is:** Floating, non-blocking panel tracking a batch/background upload queue with per-item status. **Availability:** DS2+DS3 (DS2 component reused in DS3, no dedicated DS3 styling).
**Pick when / vs siblings:** Multi-file or multi-second background transfers where each item needs its own status. For single inline uploads use `Dropzone`; for a one-off action result use `Toast`. Also fits non-file batch jobs (exports, imports).
**States:** Open · Collapsed (title bar only) · per-item uploading (spinner) / success (check) / error (icon + tooltip with reason).
**Watch:**
- Every row must be a tracked task — don't use as a generic notification panel. Keep the spinner/check/error icon language.
- Make the title reflect live state ("Uploading 3 files" / "All uploads complete"), not a static "Upload".

---

## Data Display

### Table (VirtualizedTable, PaginationTable, EditColumnConfig)
**Is:** Virtualized tabular data family rendering only visible rows. **Availability:** DS2+DS3, except `EditColumnConfig` (DS2 only).
**Pick when / vs siblings:** `VirtualizedTable` = scroll, no pagination UI (very large/streaming data); `PaginationTable` = same features plus an integrated pagination footer.
**Sizes (row height — by content, not a blanket default):** **L 56 for rows with subtext / two-line cells**, M 48 standard single-line (default), S 40 dense, XL 64 media/avatars (DS3: XL 68 (default) / L 52 / S 36 — no M). Pick by cell content: a primary cell with muted subtext below → L, not M.
**Watch:**
- Row-action icon cluster → right-aligned, group gap 8px DS2 / 12px DS3 ([Placement patterns](../DESIGN-DS3.md#placement-patterns)); each icon button carries a Tooltip.
- `Table-cell/*` Figma cells are design-time references only — never reproduce them verbatim; recreate as custom cells.
- Always key rows by a unique data field, not position — otherwise selection breaks on add/remove/reorder.
- Max 3 expandable-row layers; deeper content goes to a Drawer/Dialog.
- DS3 gap: grouped headers + editable column settings are not supported together; parent group headers aren't resizable; DS3 header color is fixed to CARD color.
- `EditColumnConfig` trigger is a top-right IconButton — never orphan it on its own row; never allow hiding all columns; persist layout.

### ColumnChart, LineChart, PercentageStackedAreaChart
**Is:** Analytics chart family sharing one data-binding/theming/axis foundation. **Availability:** DS2+DS3 (identical behavior).
**Pick when / vs siblings:** `ColumnChart` = discrete values across categories/time buckets; `LineChart` = trends over a continuous range (switch from ColumnChart past ~15 time buckets); `PercentageStackedAreaChart` = proportional composition over time (never when absolute magnitude matters — y-axis fixed 0–100%).
**States:** Thumbnail mode (LineChart only) hides all axes/legend/tooltips for spark-lines.
**Watch:**
- One metric per Y-axis side; assigning two metrics to one side silently drops one. Dual-unit LineCharts need separate Y-axes.
- A time-series LineChart must have the date field set or x-axis ordering is undefined.
- Series palette is fixed-order and version-specific (cycles through 20 stops); pin a series' color so it stays consistent across dashboard charts.
- Set timezone from session and numeric precision/date format explicitly — don't rely on defaults.

### BaseFilter, SingleSelectFilter, MultiSelectFilter, AddFilter
**Is:** Filter-chip family rendered above a table/list to narrow data. **Availability:** DS2+DS3 (same behavior).
**Pick when / vs siblings:** `SingleSelectFilter` = exactly one value (supports drill-down); `MultiSelectFilter` = zero-or-more with staged Apply/Cancel; `BaseFilter` = custom popover content (date/numeric range) only when neither preset fits; `AddFilter` = controls chip visibility, never holds a value.
**States:** Unset = solid border + placeholder, no clear icon; value set = solid border + value text + × clear; popover-open = chip pinned focused.
**Watch:**
- `MultiSelectFilter` must stage changes behind Apply/Cancel and refresh the table once on Apply; add inline search at ≥8 options.
- Place Search to the left of all chips; keep chips on one uniform-gap row above the table (never below or in column headers).
- Cap initial bar at ~5–6 chips and hide the rest behind `AddFilter`; disable `AddFilter` once all filters are active.
- Never disable a chip to mean "no data" — show an empty state in the popover.

### Tag, SelectableTag, TagInput, TagSelect, AddTag
**Is:** Compact chip family for labeling/categorizing and tag entry/selection. **Availability:** DS2+DS3.
**Pick when / vs siblings:** `Tag` = display label (optionally clickable/removable/editable); `SelectableTag` = visible toggle chip row, no dropdown (≤6–8 options, else `TagSelect`); `TagInput` = free-form token entry (emails/keywords); `TagSelect` = multi-select from predefined options where chosen values render as removable chips; `AddTag` = inline add control (search existing or create). Use `Badge` (not Tag) for read-only system statuses/counts/AI markers.
**Sizes:** Small, Normal (default), Large. **Color variants:** Gray (neutral), Blue (active/selected only — not decoration).
**Watch:**
- `TagInput` vs `TagSelect` is not interchangeable — never use `TagInput` when values come from a fixed set.
- `TagInput` tags commit on Enter, comma, Space, or Tab; the field grows vertically — always set a height limit.
- Editable tags activate on double-click (not discoverable) — show a visible hint.
- v3 default tag size for `TagInput`/`TagSelect` changed from medium to large.

### Badge
**Is:** Compact inline label for statuses, categories, counts, and AI markers. **Availability:** DS2+DS3 (DS3 adds `large`; DS2 has small/medium).
**Pick when / vs siblings:** Use over `Tag` for read-only, non-interactive labels/counts/AI markers; use `Tag` when the item must be removable/interactive (Badge has no remove action).
**Variants:** text (labels/statuses), number (counts — `radius-full` pill), AI (AI-generated content only). **Sizes:** small, medium, (large DS3-only).
**Watch:**
- AI variant is reserved strictly for AI-generated content (never decoration); in dark mode it requires the dark theme or the gradient won't adapt.
- Reserve the solid color style for one or two critical statuses per page; tinted style otherwise. Pair each semantic background tint with its matching same-hue `semantic-text-*` foreground.
- Keep one status term + color reused app-wide (always "Active", never mixing "Live").

### Status
**Is:** Entity-state indicator for a record's state (Active, Error, In progress…). **Visual differs by version:** **DS2** = semantic-colored **dot + `text-high` label, no background/pill**; **DS3** = **tinted status badge** (`semantic-bg-*` fill + `semantic-text-*` text, `radius-4`). **Availability:** DS2+DS3.
**Pick when / vs siblings:** Use for record/entity state. Use `Tag` for tinted/removable labels and `Badge` for counts/markers/AI — neither is the status treatment.
**Watch:**
- **DS2 has no tinted status badge** — the DS2 `status-badge-*` token group was phantom and has been removed; render DS2 status as dot + `text-high` label. **DS3 status *is* a tinted pill** (legitimate, different design) — don't unify the two.
- DS2: only the dot carries the hue (Error=`semantic-red`, Warning=`semantic-orange`, Ok=`semantic-green`, Stand by=`semantic-blue`, Extra=`semantic-purple`, Inactive=`semantic-gray`, In progress=primary blue); label stays `text-high`. DS3: pair each tint with its same-hue `semantic-text-*`. See [status.md](status.md).

### Avatar
**Is:** Identity element showing a photo, auto-derived initials, or a manual abbreviation. **Availability:** DS2+DS3 (single shared component).
**Pick when / vs siblings:** Use `Tag` or a custom icon for non-identity/decorative content.
**Sizes:** small 20px, medium 24px (default), large 32px. **Shape:** round (default) or square — use square for system-level entities (integrations, bots, channels) to distinguish them from users.
**Watch:**
- Resolution precedence: manual abbreviation > photo > name-derived two-letter initials (auto background color from a fixed palette) > generic placeholder.
- Always supply a name even with a photo (it's the screen-reader text).
- Don't hardcode color for user avatars — the name-hash auto-color gives distinction across a list; don't use abbreviations for human users.

### Card, StackedCard
**Is:** Bounded surface grouping related content/actions for browsing and selection. **Availability:** DS2+DS3.
**Pick when / vs siblings:** `Card` (vertical) = grids/option pickers; `Card` (horizontal) = record lists with a fixed left identity column + variable right metadata; `StackedCard` = vertical card with a separate bottom title/subtitle/action zone (catalog/template items). Use `ConnectorCard` for integration tiles, `WidgetCard` for dashboard panels, and the layout-patterns section-grouping container (not Card) for passive settings/data sections.
**Variants:** direction (vertical/horizontal — only horizontal supports subtitle + dynamic right zone), clickable, single/multi-select, status (error/warning border), background-context (gray/white — describes the parent surface).
**Watch:**
- Never use Card as a passive section wrapper — its interactive behaviors don't belong on a layout surface.
- Don't combine a clickable card with a button in its content zone (conflicting click targets); error/warning states are for validation only.
- In a grid, keep width/padding/border/radius/gutters/row-height uniform; clamp variable titles to fixed lines.
- `StackedCard` has no direction/clickable/background-context options and keeps DS2 radius (8px, not Card's 12px).

### ConnectorCard
**Is:** Fixed-layout tile for discovering/connecting third-party platform integrations (LINE, Instagram, TikTok, etc.). **Availability:** DS2 only — for DS3, compose `Card` + platform icon + `Badge`/status indicator.
**Pick when / vs siblings:** Platform/connector grids with a status badge + category tags; use `Card` for general option pickers without domain-specific status or fixed layout.
**Variants:** element type (link by default, button when it triggers an inline action), with-tags, external-link (link-out icon, always with a hover label).
**States / status values:** Available, Connected, Error ("N errors"), Info, Warning ("N disconnected"), Loading (spinner, no label — must resolve), none.
**Watch:**
- Always pair the status indicator with a label — never rely on indicator color alone; one status reading per tile.
- Keep internal order (icon → title → tags → status) identical across all tiles; draw category labels from one shared concise set.
- Never leave a tile permanently in Loading.

### WidgetCard
**Is:** Dashboard panel with a fixed titled header, an action slot, and drag/active states over a free-form body. **Availability:** DS2+DS3 (DS3 enlarges radius/padding; behavior unchanged).
**Pick when / vs siblings:** Dashboard panels/metric tiles with a title header and drag-to-rearrange; use `Card` for general cards without a fixed header or drag behavior.
**Variants:** standard, with drag handle (top-left, shown only in edit/arrange mode), with subtitles (left subtitle qualifies the title, right subtitle qualifies the action).
**States:** Active (blue-normal border — only one active at a time during layout edit), Dragging (elevated shadow; applied together with Active during a drag).
**Watch:**
- Title is required and must be a short identifier, not a sentence.
- Action slot holds a single compact control (icon button / overflow menu) — never form controls or multi-button groups.
- Hide the drag handle when layout is locked or only one widget is on screen.

---

## Feedback & Message

### Tooltip, IconTooltip
**Is:** Floating hover label for supplementary, ignorable help anchored to a trigger. **Availability:** DS2+DS3.
**Pick when / vs siblings:** Help the user can safely skip. If the content is required to complete the task, use `Hint`. Use `IconTooltip` instead of hand-wrapping an icon in `Tooltip`.
**Variants:** `Tooltip` (opens below by default), `IconTooltip` (pre-packaged info-icon, opens above by default; icon defaults to `text-low`).
**Watch:**
- Never put interactive elements inside — not keyboard-reachable. Don't use on touch-only UIs (no hover).
- Drive visibility from app state when it must stay synced with other UI.

### Hint
**Is:** Persistent inline alert in document flow for guidance/status/warnings; stays until dismissed. **Availability:** DS2+DS3.
**Pick when / vs siblings:** Guidance needed before/during a task. For transient post-action feedback use `Toast`; for decisions needing input use `Dialog`.
**Variants (severity):** Success, Info, Warning, Error, Info-secondary (low-emphasis).
**Watch:**
- Make non-dismissable only when dismissing would hide a blocking condition; never for purely informational hints.
- Action button must directly resolve the stated condition; label verb-first ("Increase budget"), not "OK".
- Form-level validation errors after submission belong here (field-level go inline). Don't stack same-purpose hints — consolidate.

### Toast
**Is:** Ephemeral floating feedback panel for completed async operations; auto-dismisses ~6s. **Availability:** DS2+DS3.
**Pick when / vs siblings:** Acknowledge completed background actions. For persistent in-page guidance use `Hint`; for input decisions use `Dialog`; for field validation show inline.
**Watch:**
- Severity tints the icon only, not the panel. Keep error toasts persistent.
- One action button max per toast; label verb-first ("Undo", "Retry").
- Keep one consistent placement app-wide (don't mix top/bottom).

### Skeleton
**Is:** Loading placeholder mimicking the shape/size of incoming content. **Availability:** DS2+DS3 (one component; not yet a DS3 Storybook story — use the DS2 component in DS3 contexts).
**Pick when / vs siblings:** Use when the target layout is predictable (tables, cards, lists, fields). Use `Loader`/spinner when output shape is unknown or the whole page is blocked.
**Variants:** Rectangle (default, no built-in radius), Circle (`radius-full`, 1:1).
**Watch:**
- No intrinsic size — always set explicit width and height or it collapses.
- Rectangle has no built-in radius; apply 8px to match DS3 form controls.
- Show 3–10 rows for list/table states; swap all skeletons for real data at once (never mix).

### Loader, InfiniteLoadingSpinner, InfiniteLoadingDots, LoadingTooltip
**Is:** The Appier loading-indicator family. **Availability:** DS2 (Storybook published); no dedicated DS3 files — use the DS2 components.
**Pick when / vs siblings:**
- `InfiniteLoadingSpinner` — indeterminate wait of unknown duration (data fetch, submit).
- `InfiniteLoadingDots` — compact/inline indeterminate wait (table cells, badges) where a spinner is too heavy.
- `Loader` — full-screen blocking state needing an explanatory title; uses its own four-square animation, not the spinner.
- `LoadingTooltip` — labeled loading within a contained area (spinner + required title + optional description).
- Use `Skeleton` when layout is predictable; use a determinate `Progress bar` when a real percentage exists.
**Sizes:** Spinner small/normal/large (16/20/24px). Dots: default 2px, Larger 16px, Black.
**Watch:**
- Override spinner/dot arc color to white (`text-white-hold`) on dark/primary surfaces.
- Use the small spinner size inside a `Button` (must not exceed label height).
- `Loader` requires a meaningful title (no spinner-only use); `LoadingTooltip`'s required title doubles as the screen-reader label.

### Progress bar, Progress bar_budget goal
**Is:** Determinate percentage-progress track; the budget-goal variant adds a vertical goal-marker rule. **Availability:** **Figma-only** in both DS2 and DS3 — no code counterpart (confirm with the DS team before implementing).
**Pick when / vs siblings:** `Progress bar` only with real completion data; `Progress bar_budget goal` only in budget/quota contexts (its marker implies a threshold). For indeterminate waits use `InfiniteLoadingSpinner`.
**Variants (fill color = state):** Primary blue (active), `semantic-green` (complete), `semantic-red` (error). Plus indeterminate shimmer.
**Watch:**
- Fill color is state-encoded — never reuse green/red for in-progress (keep blue).
- Never show a spinner and a Progress bar for the same operation.

---

## Onboarding

### ProductTour
**Is:** Overlay callout anchored to a reference element for guided walkthroughs / first-visit feature intros. **Availability:** DS2 only — keep using DS2 until a DS3 version releases.
**Pick when / vs siblings:** Introduce/advance feature walkthroughs. For errors/warnings/status use `Toast` or `Hint`.
**Variants:** Regular (default, white panel, blue accent), Blue (high-emphasis, one per screen at most).
**Watch:**
- Never render multiple instances at once — sequence one at a time; not a persistent annotation.
- Anchor beside the target (arrow touching it); never overlap the element it explains.
- One primary advance action per step; render Skip/opt-out as minimal; keep advance/dismiss labels identical across steps.


---

## Hand-authoring anatomy — high-risk components (raw HTML/CSS, no component library)

> **Scope:** for agents that **emit raw HTML/CSS** (no React / component import). Library consumers can
> skip it — `import` the component instead. It exists because, for a from-scratch HTML author, naming a
> component ("use `TextSelect`") is not enough: without the structure to build, models reliably fall back
> to native controls (`<select>`, `<input type="date">`, free-form tags). Class names below are
> **illustrative**; exact tokens/geometry live in each per-component doc and
> [DESIGN-DS2.md](../DESIGN-DS2.md) / [DESIGN-DS3.md](../DESIGN-DS3.md). **NEVER substitute a native
> control for the patterns below.**

Shared tokens: height 32px controls · radius 4px (`--radius-sm`) · menu radius 8px + `--shadow-m` · border `#D9DAE1` (general) / `#DEDFE5` (popover) · primary `#296AFF` · selected menu/select item = `primary`/blue label text only (no background fill, no check icon). Text 14px/20px, letter-spacing .2px.

### TextSelect (form dropdown)
**Guardrail:** Never `<select>`. Build a clickable trigger `div` + absolutely-positioned popover `<ul>`.
```html
<div class="sel-wrap">
  <div class="ds-select" role="combobox" tabindex="0" aria-haspopup="listbox" aria-expanded="false" onclick="toggleSelect(this)">
    <span class="sel-value">Conversion</span>
    <svg class="sel-arrow"><use href="#directionalTriangleArrowDownSolid20"/></svg>  <!-- ▾ chevron -->
  </div>
  <div class="sel-menu" role="listbox">  <!-- absolute; top:calc(100% + 4px); display:none until .open -->
    <div class="sel-item selected" role="option"><span>Conversion</span></div>
    <!-- selected = primary/blue label text only (.sel-item.selected { color: var(--color-primary) }); no bg, no check icon -->
    <div class="sel-item" role="option"><span>Engagement</span></div>
  </div>
</div>
```
- Trigger = 32px field with `border-general`, `justify-content:space-between`, a `▾` chevron that rotates 180° when open; on open border turns primary.
- Menu surface: `border-popover` + `--shadow-m`, radius 8px, 4px padding, `max-height:260px; overflow:auto`, items 32px tall.
- Selected item: `primary`/blue label text only (`color: var(--color-primary)`) — **no** background fill and **no** check icon. Single-select closes on pick.

### DatePicker (date field)
**Guardrail:** Never `<input type="date">`. Build a read-only trigger field showing the formatted date + calendar icon (opens a calendar popover).
```html
<div class="ds-input ds-date" tabindex="0">
  <span class="ds-affix-text">Jun 1, 2026</span>
  <svg class="date-icon"><use href="#datePickerOutlined20"/></svg>
</div>
```
- Trigger is a 32px bordered field — must read as an opener (border + calendar icon or chevron), never static text.
- Always show the selected date in the trigger as formatted text (`Jun 1, 2026`), not an ISO box.
- For a span use two fields (start/end) or a DateRangePicker; a range popover commits only on **Apply** (live preview is not confirmation).

### TagSelect (predefined multi-select)
**Guardrail:** Never a free-form TagInput or `<select multiple>`. Build a chip region + dropdown of predefined options.
```html
<div class="tag-field">  <!-- flex-wrap; min-height:32px; padding:4px 8px -->
  <span class="tag">Japan
    <svg class="tag-x" onclick="removeTag(...)"><use href="#crossOutlined16"/></svg>
  </span>
  <button type="button" class="tag-trigger">  <!-- opens predefined-option popover -->
    <svg class="search-ic"><use href="#searchOutlined20"/></svg>Add region
  </button>
</div>
```
- Chips: 24px tall, `rgba(41,106,255,0.12)` bg, 12px/600 text, trailing × (`crossOutlined16`) to remove.
- Options come from a **fixed predefined list** (the dropdown), never typed free-form.
- The option popover is a checkbox list staged behind an **Apply / Cancel** footer — selection commits only on Apply.

### SingleSelectFilter (filter chip)
**Guardrail:** Not a native control and not the form TextSelect — build a pill chip (above the table) opening a single-select menu.
```html
<button class="filter-pill" aria-haspopup="true" onclick="toggleMenu('statusMenu', this)">
  <span class="filter-label">Status:</span>
  <span class="filter-value">All</span>
  <svg class="filter-caret"><use href="#directionalTriangleArrowDownSolid20"/></svg>
</button>
<div class="menu-panel" id="statusMenu"></div>  <!-- position:fixed; menu-item rows w/ .check -->
```
- Pill: 32px, radius 20px (rounded), reads `Label: Value`. Keep label to the dimension noun ("Status"); value carries the choice.
- Unset shows a placeholder ("All"/"Any"); when a value is set, add an × clear that resets value **and** removes the chip.
- Single-select **commits and closes on pick** (no Apply). (MultiSelectFilter, by contrast, stages behind Apply/Cancel.) Place Search left of all chips.

### Pagination
**Guardrail:** Never raw page `<a>` links / numbered page buttons / native paging — build the DS bar: a **rows-per-page select**, the **range summary**, then a nav cluster of **first / prev / `[n] / N` page input / next / last**. Nav buttons are borderless chevron/jump icons; only the page input and rows select are bordered.
```html
<div class="seg-pagination">  <!-- DS2 56px bordered footer; DS3 32px transparent bar -->
  <span class="pg-rows" role="button">Rows <span class="pg-rows-val">10</span> <svg><use href="#directionalTriangleArrowDownSolid20"/></svg></span>
  <span class="pg-range">1–10 of 24 segments</span>
  <span class="pg-spacer"></span>
  <button class="pg-btn" aria-label="First page" title="First page" disabled><svg><use href="#jumpToFirstOutlined20"/></svg></button>
  <button class="pg-btn" aria-label="Previous page" title="Previous page" disabled><svg><use href="#directionalDefaultLeftOutlined20"/></svg></button>
  <span class="pg-page"><input type="text" value="1"> / 3</span>
  <button class="pg-btn" aria-label="Next page" title="Next page"><svg><use href="#directionalDefaultRightOutlined20"/></svg></button>
  <button class="pg-btn" aria-label="Last page" title="Last page"><svg><use href="#jumpToLastOutlined20"/></svg></button>
</div>
```
- The record-range summary (`1–10 of 24 …`) is **mandatory** — it is the only place the total count appears.
- Page input is a small bordered text input reading `[n] / N` (current page over total); first + prev disabled on page 1, next + last disabled on the last page.
- Rows-per-page is a small TextSelect-style trigger; changing it resets to page 1. No numbered page buttons anywhere.

### Table (row / header anatomy)
**Guardrail:** Build the DS table — sticky `surface-tertiary` header, name column as a link, right-aligned numerics. Not a bare unstyled `<table>`.
```html
<table class="seg-table">
  <thead><tr>
    <th data-sortable><span class="th-inner">Name
      <svg class="sort-icon sort-up"><use href="#directionalArrowUpOutlined20"/></svg>
      <svg class="sort-icon sort-down"><use href="#directionalArrowDownOutlined20"/></svg></span></th>
    <th class="num" data-sortable><span class="th-inner">Estimated size …</span></th>  <!-- num = right-align -->
    <th class="col-actions" aria-label="Actions"></th>
  </tr></thead>
  <tbody>
    <tr class="tbl-row">
      <td><div class="seg-name" onclick="open(...)">High-value cart abandoners</div>
        <div class="seg-sub">Behavioral · 30-day window</div></td>
      <td class="num">2,148,902</td>
      <td><span class="ds-status"><span class="dot"></span>Active</span></td>  <!-- Status: semantic-colored dot + text-high label; NO background tint/pill -->
      <td class="col-actions"><button class="icon-btn"><svg><use href="#moreOutlined20"/></svg></button></td>
    </tr>
  </tbody>
</table>
```
- Header row 40px, `surface-tertiary` bg, 600 weight, sticky, bottom `border-general`. Body rows: **56px when a row carries subtext / two-line content** (as here), 48px for single-line; bottom divider, hover `#F7F8F9`.
- **Name (primary) column is a link** — `color:#296AFF`, 600, underline on hover; optional muted subtext below.
- Numeric columns: add `.num` → right-align + `font-variant-numeric:tabular-nums`; header label also right-aligns (`flex-direction:row-reverse`).
- Sort icons live in the header, hidden until active; rightmost actions column is right-aligned and holds a `more` icon-button menu. When a row exposes **multiple** icon actions, space them with the action-button group gap (8px DS2 / 12px DS3) and give each a Tooltip/`title` (not `aria-label` alone). Status cells use the Status component — in **DS2** a semantic-colored dot + `text-high` label with **no** background tint/pill (as above); in **DS3** a tinted status badge (`semantic-bg-*` + `semantic-text-*`).
