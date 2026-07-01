# Filters Usage Guidelines

**Last updated:** 2026-06-30

**Components:** `BaseFilter`, `SingleSelectFilter`, `MultiSelectFilter`, `AddFilter`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=7730-50791)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-60), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=7730-50791))  
**Storybook:** [Filter](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-filter-singleselectfilter--docs)

---

## Overview

Filter chips narrow datasets by criteria, rendered above a table or list. Choose: `SingleSelectFilter` (one value, with optional drill-down), `MultiSelectFilter` (zero-or-more, staged Apply), `BaseFilter` (custom popover content). `AddFilter` controls chip visibility but never holds a value.

---

## Components at a Glance

| Component | Selection | When to use |
|---|---|---|
| `SingleSelectFilter` | Exactly one value | Mutually exclusive options; optional drill-down hierarchies |
| `MultiSelectFilter` | Zero or more values | Checkbox lists; benefits from inline search and Apply/Cancel |
| `BaseFilter` | Custom (caller owns the popover) | Non-standard content: date range, numeric range, custom UI |
| `AddFilter` | N/A — controls visibility | Letting users add new filter chips to the bar dynamically |

---

## States

| State | Visual |
|---|---|
| Default (no value) | Solid `UI/border/general` border, default placeholder text, no clear icon |
| Default (value set) | Solid `UI/border/general` border, value text, × clear icon |
| Hover | Background `stateOverlay/hover` |
| Focused / Open | `primary` border, 2px outline at 2px offset — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled | Dimmed; no pointer interaction |
| Popover open | Chip held in focused state while the popover is visible |

---

## Do's and Don'ts

**Do**
- Place `Search` to the left of all filter chips — it scopes the full dataset before filters narrow further; see [Placement patterns](../DESIGN-DS3.md#placement-patterns)
- Always give `MultiSelectFilter` an Apply/Cancel footer so changes are staged and the table refreshes once on Apply
- Enable inline search inside `MultiSelectFilter` when the option list has 8 or more items
- Always provide a default placeholder (e.g. "All", "Any") so an unset filter chip is still readable
- Keep the chip label to the dimension noun alone ("Status", "Ad format") and let the selection carry the value — the chip already reads as Label: Value
- Use `AddFilter` to keep the initial filter bar short — show only the most commonly used filters by default
- When the user clears an optional filter with ×, both reset its value and remove its chip from the bar
- Disable `AddFilter` once every available filter is already active
- Use `SingleSelectFilter` with drill-down for hierarchical option sets instead of a flat long list
- Keep fixed and optional filters separate so fixed chips can never be removed
- Keep all chips on one row with a consistent gap so the bar reads as a single group of controls — see [Placement patterns](../DESIGN-DS3.md#placement-patterns)
- Let a filter holding a value read differently from an unset one — the value text and × clear icon must clearly mark which filters are narrowing the data

**Don't**
- Avoid `BaseFilter` when `SingleSelectFilter` or `MultiSelectFilter` fits — the presets handle the popover, focus management, and keyboard navigation
- Never use `SingleSelectFilter` when zero-or-more selection is needed — use `MultiSelectFilter`
- Avoid showing more than 5–6 filter chips in the initial view without using `AddFilter` to hide the rest
- Avoid placing filter chips below the table or inside table column headers
- Never disable a chip to communicate "no data for this filter" — show an empty-state explanation in the popover instead
- Never nest `AddFilter` inside a form — it controls bar layout, not form values
- Avoid spacing chips unevenly or wrapping them into a loose block — an inconsistent gap stops the bar from reading as one group; keep a uniform chip-to-chip gap (see [Placement patterns](../DESIGN-DS3.md#placement-patterns))
- Never leave an active filter looking the same as an unset one — users must be able to see which filters are currently applied without opening each chip
- Never render a filter chip with a small or partial corner radius — the chip is a full pill (`radius-full` / 9999px) in DS3, not a `radius-8`-style rounded rectangle

---

## Anatomy

### Filter chip (BaseFilter)

```
  ┌──────────────────────────┐   ← fully rounded pill (`radius-full`) — see Shapes / Component heights
  │ [icon]  Label: Value  ×  │   ← icon (optional) · label+value · clear icon when value set
  └──────────────────────────┘
```

Chip height, radius, typography, popover shadow, clear-icon size, and chip-to-chip gap are defined centrally — see DESIGN-DS3 [Component heights](../DESIGN-DS3.md#component-heights) · [Shapes](../DESIGN-DS3.md#shapes) · [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) · [Placement patterns](../DESIGN-DS3.md#placement-patterns) · [Typography](../DESIGN-DS3.md#typography) (DS2 values in [DESIGN-DS2.md](../DESIGN-DS2.md)).

### AddFilter button

```
  ┌──────────────┐
  │ + Add filter │   ← solid border, secondary visual style
  └──────────────┘
```

---

## Patterns

### Filter bar with search and table

Place `Search` left-aligned, followed by a horizontal row of filter chips, all above the table. Search scopes the full dataset; the chips narrow it further. Keep the bar to a single line, and use `AddFilter` at the end of the row to surface less-common filters on demand.

### Dynamic filters with AddFilter

Keep fixed filters (always visible) separate from optional ones the user adds through `AddFilter`. Clearing an optional filter's × both resets its value and removes its chip from the bar, while fixed chips can never be removed.

### Drill-down filter

Use `SingleSelectFilter` with drill-down for geographic or categorical hierarchies. Each level opens as a submenu with a back arrow to step up. Limit to two drill levels; deeper hierarchies belong in a modal or a dedicated page.

---

## Component Style Tokens

```yaml
# DS2  (from DESIGN-DS2.md → components)
# Filter chip — pill chip; solid border
filter:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"
  border: "1px solid {colors.border-general}"
  rounded: "20px"
  height: 32px
  padding: "6px 8px 6px 16px"
  typography: "{typography.body1}"
filter-focused:
  border: "1px solid {colors.primary}"   # focused / popover open: + 2px outline at 2px offset
```
```yaml
# DS3  (from DESIGN-DS3.md → components)
# Filter chip — full pill, 40px (v3: rounded-radius-full, h-spacing-40); solid border
filter:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"
  border: "1px solid {colors.border-general}"
  rounded: "9999px"
  height: 40px
  padding: "8px 12px 8px 16px"
  typography: "{typography.body1}"
filter-focused:
  border: "1px solid {colors.primary}"   # focused / popover open: + 2px outline at 2px offset
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md). The filter components (`BaseFilter`, `SingleSelectFilter`, `MultiSelectFilter`, `AddFilter`) behave the same in DS2 and DS3.
