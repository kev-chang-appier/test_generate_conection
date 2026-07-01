# Menu Usage Guidelines

**Last updated:** 2026-06-30

**Components:** `MenuItem`, `MenuIconItem`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63299-82389)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-58), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=742-31))  
**Storybook:** [Menu](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-menu-menu--docs)

---

## Overview

A menu presents a list of options in a temporary overlay that appears on user interaction — typically a click. It lets users make a selection or trigger an action without navigating away from the current context.

`MenuItem` and `MenuIconItem` are the building blocks for all dropdown menus in the design system. They are composed as children inside select and filter components (`TextSelect`, `SingleSelectFilter`, `MultiSelectFilter`) and in action menus triggered by buttons.

`MenuIconItem` is a convenience wrapper around `MenuItem` that adds leading and trailing icon slots — use it when menu items need icons consistently throughout a list.

---

## Components at a Glance

| Component | Use inside | When to use |
|---|---|---|
| `MenuItem` | `TextSelect`, `SingleSelectFilter`, `MultiSelectFilter` | Standard option row — text label with optional start/end elements |
| `MenuIconItem` | Same as above | Option row that always carries a leading icon |

---

## Relationship with Select

`MenuItem` and `MenuIconItem` are always used as children of a select or filter component — they are not standalone. The parent component controls opening, closing, shadow, and border; menu items control what appears inside the panel.

| Parent component | Children |
|---|---|
| `TextSelect` | `MenuItem`, `MenuIconItem` |
| `SingleSelectFilter` | `MenuItem`, `MenuIconItem` |
| `MultiSelectFilter` | Takes its options directly — no `MenuItem` children |

For guidance on choosing the right parent component, see the [Select guidelines](select.md).

---

## States

| State | Visual |
|---|---|
| Default | `surface-primary` background, full opacity |
| Hover | `stateOverlay/hover` overlay |
| Selected | Label in **primary/blue text**; **no** background fill and **no** check icon |
| Disabled | Item dimmed; not interactive |
| Read-only | Visible but cursor is default; no hover state |
| Focused (keyboard) | `primary` outline, 2px offset — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |

---

## Panel Composition

How items sit together in the panel governs how fast users find the right one.

- **Group related items with a `Divider`.** Cluster items that belong to the same task and separate distinct groups with a divider; tighter spacing within a group than between groups signals what belongs together.
- **Align leading elements consistently.** When some items carry a leading icon, keep labels starting at one edge so the column scans cleanly — switch the whole list to `MenuIconItem` rather than letting some labels indent and others flush left.
- **Set destructive items apart.** Place Delete, Archive, and similar actions last, after a `Divider`, so a destructive choice never sits adjacent to a routine one.

---

## Do's and Don'ts

**Do**
- Group related items and divide distinct groups with a `Divider`; keep within-group spacing tighter than between-group spacing
- Use `MenuIconItem` when every item in a list carries an icon — consistency across the full list matters more than any single icon
- Give items a leading icon when only some items have them (mixed icon lists)
- Add a secondary line of subtext to give context without cluttering the label (e.g. "Paused — No delivery")
- Tag items with search keywords so they match synonyms users might type in searchable menus
- Keep menu item labels short — one line is strongly preferred; subtext handles supplementary detail
- Write labels in parallel grammatical form within a single menu — all noun phrases or all verb phrases, not a mix
- Label a submenu parent as a noun phrase and give it a trailing arrow ("Export as", "Move to") so it reads as opening a panel, not performing an action
- Disable options that are structurally unavailable; remove items that should never appear

**Don't**
- Avoid nesting more than two levels of submenus — users lose track of their path; flatten the hierarchy or use drill-down navigation
- Avoid mixing icon-bearing and icon-less items so some labels indent and others sit flush — switch the list to `MenuIconItem` so labels align at one edge
- Avoid mixing checkbox items and non-checkbox items in the same menu without a visual divider
- Never make an option read-only when it is only temporarily unavailable — disable it instead
- Avoid placing critical information in the secondary subtext; it is visually secondary and may be missed
- Avoid placing destructive actions (Delete, Archive) at the top of a menu — put them last, optionally after a divider
- Avoid using a menu for binary yes/no choices — use `Checkbox` or `Switch` instead
- Avoid repeating the parent `TextSelect` label text in every item label (e.g. if the label is "Status", write "Active" not "Active status")

---

## Anatomy

### Menu panel

```
  ┌──────────────────────────────┐  ← Shadow M, border-popover, radius-8
  │  [icon]  Label         [▸]   │  ← leading icon + submenu arrow
  │  [icon]  Label   [badge/▸]   │  ← trailing badge or arrow
  │  ──────────────────────────  │  ← Divider (optional grouping)
  │          Subtext             │  ← secondary label below main text
  │  [icon]  Disabled item       │  ← dimmed item
  └──────────────────────────────┘
              ↑ horizontal padding + item height — see [Component heights](../DESIGN-DS3.md#component-heights)
```

### MenuItem zones

```
  ┌──────────────────────────────────────────┐
  │  [leading icon]  Label   [subtext]  [trailing icon]  │
  └──────────────────────────────────────────┘
       leading icon   label                    trailing icon
```

Item height, padding, icon size, panel radius, and shadow are defined centrally — see DESIGN-DS3 [Component heights](../DESIGN-DS3.md#component-heights) · [Shapes](../DESIGN-DS3.md#shapes) · [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) (DS2 values in [DESIGN-DS2.md](../DESIGN-DS2.md)).

---

## MenuItem

The base option row. Supports a leading icon (in mixed icon/icon-less lists; switch to `MenuIconItem` when every item carries one), a trailing icon, badge, or submenu arrow, a secondary context line of subtext, and search keywords that match terms not in the visible label. It can also open a nested submenu panel, support drill-down navigation, or carry an inline checkbox (see [Patterns](#patterns)).

**Row height is a minimum, not a fixed value.** A single-line item is 36px in DS2 and 40px in DS3 (the shared `min-height: 36px` floor plus DS3's `py-spacing-10` padding override); the row grows with its content. A two-line item — primary label in `body1` over a secondary line in `body2` at low-emphasis (`text-low`), stacked with a 4px gap — is **56px**. Use the secondary line for a supporting value (an ID, count, or description), not for critical information (see Anti-patterns).

---

## MenuIconItem

Extends `MenuItem` with dedicated leading and trailing icon slots (20px each). Prefer it over a base `MenuItem` with manually placed icons when every item carries an icon.

---

## Patterns

### Submenus

Give an item a trailing arrow and a nested panel of its own items, labelled as a noun phrase ("Export as"). The submenu opens on hover (or tap on touch devices). Use drill-down navigation instead when you want click-through rather than a fly-out panel.

### Drill-down navigation

Inside a drill-down-enabled select, a parent item acts as a breadcrumb-navigable header; users click into sub-levels rather than hovering to reveal them.

### Checkbox list

Items can carry an inline checkbox for lightweight multi-select embedded in custom UI. For standard filter toolbars, prefer `MultiSelectFilter` instead.

### Searchable menus

**When to add search** — enable search when a menu has 7 or more items, or when users are likely to know the name of what they want rather than scan for it (e.g. a long country list, a metric picker). Avoid search for short, stable lists of 6 or fewer items — it adds UI weight without saving time.

**Focus on open** — auto-focus the search field when the menu opens. Users who open a long menu almost always intend to type; requiring an extra click to reach the field creates unnecessary friction. The exception is menus that open on hover or are triggered by a non-intentional gesture — in those cases leave focus on the trigger. In a searchable menu, tag items with keywords so they match terms not in their visible label.

**Anatomy** — the search field is *not* the bordered pill `Search` used in filter bars. It's a borderless row laid out like a menu item (leading magnifier icon + placeholder), separated from the list by a full-width divider. The multi-select variant below adds a Select all / Clear row between the divider and the checkbox list.

```
  ┌────────────────────────────┐  ← panel: surface-popover, border-popover, radius-8, Shadow M
  │  🔍  Search                 │  ← search row: borderless; magnifier + placeholder (body1, low-emphasis)
  ├────────────────────────────┤  ← Divider (border-general, full width)
  │  Select all         Clear   │  ← multi-select only: text buttons (headline6, primary), 36px row
  │  ☐  Label                   │
  │  ☐  Label                   │  ← MenuItem rows; multi-select carries a 20px leading checkbox
  │  ☐  Label                   │
  ├────────────────────────────┤
  │              [Cancel] [Apply] │  ← footer: commit controls, complex menus only (see below)
  └────────────────────────────┘
```

- **Search row** — borderless; same horizontal padding as a MenuItem; 20px magnifier icon + placeholder in `body1` at low-emphasis (`text-low-minus`). No field outline, no pill.
- **Divider** — full-width hairline (`border-general`) directly under the search row.
- **Select all / Clear** (multi-select only) — sits between the divider and the list, not in the footer. Minimal text buttons in `headline6` / `primary`. These bulk-toggle the checkboxes.
- **Items** — standard `MenuItem` rows; the multi-select variant adds a 20px leading `Checkbox` (see [checkbox.md](checkbox.md)).
- **Footer (Cancel / Apply)** — optional, shown only for **complex/committal menus** where selections shouldn't take effect until confirmed (e.g. a multi-select checkbox list). A 40px-tall row holding two right-aligned S-size buttons at a 4px gap: **Cancel** (secondary) then **Apply** (primary). A simple single-select menu commits on click and has no footer. Don't confuse it with the Select all / Clear row — that bulk-toggles the boxes; the footer commits or discards the whole selection.

Reference: Figma node [`8224:1373`](https://www.figma.com/design/x9GdKHqL7vU3NkTRmP1G5N/ML-CrossX-DRAFT-in-preparation?node-id=8224-1373) (multi-select searchable menu; the footer is an optional layer in that node). Panel surface, border, radius-8, and Shadow M are the shared popover values — see [Component Style Tokens](#component-style-tokens).

---

## Component Style Tokens

```yaml
# DS2  (MenuItem shares one styled-components core; DS3 only widens the vertical padding)
menu-item:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"        # text-high
  height: 36px                           # min-height; grows with content (two-line item = 56px)
  padding: 8px 16px
menu-item-hover:
  backgroundColor: "{overlays.stateOverlay/hover}"   # stateOverlay/hover overlay (full-palette state token)
menu-item-pressed:
  backgroundColor: "{overlays.stateOverlay/pressed}" # stateOverlay/pressed overlay (full-palette state token)
menu-item-selected:
  textColor: "{colors.primary}"          # primary/blue text only — no background fill, no check icon
menu-item-subtext:
  textColor: "{colors.text-low}"         # text-low
  typography: "{typography.body2}"
```
```yaml
# DS3
menu-item:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"        # text-high
  height: 36px                           # min-height; grows with content (two-line item = 56px)
  padding: 10px 16px                     # py override (py-spacing-10)
menu-item-hover:
  backgroundColor: "{overlays.stateOverlay/hover}"   # stateOverlay/hover overlay (full-palette state token)
menu-item-pressed:
  backgroundColor: "{overlays.stateOverlay/pressed}" # stateOverlay/pressed overlay (full-palette state token)
menu-item-selected:
  textColor: "{colors.primary}"          # primary/blue text only — no background fill, no check icon
menu-item-subtext:
  textColor: "{colors.text-low}"         # text-low
  typography: "{typography.body2}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md). The panel's surface (`surface-popover`), popover border (`border-popover`), radius (`radius-8`, hardcoded), and Shadow M are the Menu panel's own values — not inherited from the parent select/filter.
