# Search Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Search`, `ScopedSearch`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=7599-47558)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-70), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=7599-47558))  
**Storybook:** [Search](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-search--docs)

---

## Overview

Search lets users filter or locate items by keyword. Use it in place of a plain text input wherever the intent is querying — tables, lists, navigation, or command palettes. `ScopedSearch` narrows the search to a specific category when the dataset spans multiple content types.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `Search` | Filter a table, list, or set of items by text match |
| `ScopedSearch` | Search where the domain can be narrowed (e.g. search within Campaigns, Audiences, Ads) |

Use `ScopedSearch` only when scope selection is genuinely required.

---

## Placement Patterns

Search/filter toolbar placement and widths follow the central [Placement patterns](../DESIGN-DS3.md#placement-patterns) and [Layout](../DESIGN-DS3.md#layout). Search-specific contexts:

| Context | Spec |
|---|---|
| Table control bar | Left-aligned; paired with filter buttons |
| Page-level global search | Centered or top-right; larger width |
| Filter panel | Full-width inside panel, at top of option list |
| Dropdown menu | Use the built-in search inside `TextSelect` or `MultiSelectFilter` — not a standalone `Search` |

---

## States

| State | Visual |
|---|---|
| Default (empty) | Search icon visible; placeholder text |
| Active / filled | Search icon; typed value; × clear button appears |
| Focused | `primary` outline, 2px offset — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled | Dimmed; not interactive |

---

## Do's and Don'ts

**Do**
- Use `Search` instead of a plain text field for all filter/search fields — it provides the correct icon, clear button, and placeholder treatment automatically
- Set a descriptive placeholder that tells the user what they are searching (e.g. "Search by campaign name"). If the full phrase doesn't fit the control width, shorten to just "Search" or the object name alone (e.g. "Campaigns")
- Show a clear button while the field holds a value, and reset the field when it is pressed
- Auto-focus the search field when it is the primary action on a page or dialog
- Show a result count or "No results for '[query]'" message after every search — never a silent empty state
- Clear the search field when the user navigates away from the view — stale queries cause confusion on return
- Match the `Search` height to the adjacent filter buttons and keep a uniform gap so the toolbar reads as one row — see [Placement patterns](../DESIGN-DS3.md#placement-patterns)

**Don't**
- Never use `Search` inside a dropdown menu list — use the built-in search in `TextSelect` or `MultiSelectFilter` instead
- Avoid `ScopedSearch` unless scope selection is genuinely required — `Search` alone covers most cases in both DS2 and DS3
- Avoid `ScopedSearch` in DS3 products without a DS3-native reason — prefer composing `TextSelect` + `Search` for new DS3 work
- Never add a label to search fields in control bars — the icon and placeholder provide sufficient context
- Never make the field lag while typing — keep it responsive and delay only the downstream query
- Avoid floating `Search` off the alignment of the filter controls it sits beside — align it to the same edge so the control bar reads as a single cluster
- Never split `Search` into a two-segment capsule — a left label/scope segment paired with a separate input segment is not a DS pattern. `Search` is a single pill with a leading icon and a trailing clear button. When scope selection is genuinely required, use `ScopedSearch`, or compose a separate `TextSelect` and `Search` as two distinct controls

---

## Anatomy

```
  ┌─────────────────────────────────┐  ← pill field — see Shapes / Component heights
  │  🔍  Search placeholder...  ×  │  ← search icon (left) + clear button (right)
  └─────────────────────────────────┘
```

Height, radius, icon size, typography, and placeholder color are defined centrally — see DESIGN-DS3 [Component heights](../DESIGN-DS3.md#component-heights) · [Shapes](../DESIGN-DS3.md#shapes) · [Typography](../DESIGN-DS3.md#typography) · [Colors](../DESIGN-DS3.md#colors) (DS2 values in [DESIGN-DS2.md](../DESIGN-DS2.md)). Note: the `Search` field keeps its pill radius in both DS2 and DS3.

---

## Component Style Tokens

```yaml
# DS2  (from DESIGN-DS2.md → components)
# Search field — pill radius (SearchWrapper, 20px on a 32px field; not overridden in v3)
search:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"
  border: "1px solid {colors.border-general}"
  rounded: "20px"
  height: 32px
  padding: "0 12px"
  typography: "{typography.body1}"
search-placeholder:
  textColor: "{colors.text-low-minus}"
```
```yaml
# DS3  (from DESIGN-DS3.md → components)
# Search field — keeps its 20px pill radius from v2 (SearchWrapper not overridden); 40px field
search:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"
  border: "1px solid {colors.border-general}"
  rounded: "20px"
  height: 40px
  padding: "0 16px"
  typography: "{typography.body1}"
search-placeholder:
  textColor: "{colors.text-low-minus}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

The `Search` field keeps its pill radius in both DS2 and DS3. `ScopedSearch` has no DS3 variant — compose `TextSelect` + `Search` as the DS3-native alternative. Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
