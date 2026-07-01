# Select Usage Guidelines

**Last updated:** 2026-06-30

**Components:** `TextSelect`, `TagSelect`, `SingleSelectFilter`, `MultiSelectFilter`, `SelectableTag`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=72873-2711)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-72), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=8351-94640))  
**Storybook:** [Select](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-select-textselect--docs)

---

## Overview

Select components let users choose a value from a predefined list. Use them when the valid options are known and freeform text entry would be an error. Each variant targets a specific context — form fields, filter toolbars, or inline chips — and mixing them causes inconsistent UX.

---

## Components at a Glance

| Component | Selection | When to use |
|---|---|---|
| `TextSelect` | Single or multi | Form field that opens a dropdown menu — the default choice for most selects |
| `TagSelect` | Multi only | Form field where selections are displayed as inline tag chips |
| `SingleSelectFilter` | Single | Filter control above a table or list; closes on selection |
| `MultiSelectFilter` | Multi | Filter control with checkbox list and Apply/Cancel confirmation |
| `SelectableTag` | Multi (visual) | Visible chip row where users toggle tags directly — no dropdown |

---

## States

All select variants share these states:

| State | Visual |
|---|---|
| Default | 1px `border-general` border, `surface-primary` background |
| Focused | `primary` focus outline — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Hover | `stateOverlay/hover` overlay on field |
| Open | Field border activates; dropdown appears with menu shadow — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled | Field dimmed; label stays full opacity |
| Error | Error string shown below in `semantic-red` |
| Selected item | Label shown in **primary/blue text** (normal weight); **no** background fill and **no** check icon. Hover still uses a neutral row background (a separate state). |

---

## Do's and Don'ts

**Do**
- Use `TextSelect` for form fields (single or multi); use `TagSelect` when selected items need to be individually visible as chips
- Use `SingleSelectFilter` / `MultiSelectFilter` on filter toolbars — not in forms
- Turn on inline search when the option list has more than 10 items
- Use a virtualized list for 100+ options
- Always pair a select with a label — required for accessibility
- Keep the Apply/Cancel footer on `MultiSelectFilter` so users can confirm or cancel
- Limit `SelectableTag` rows to 6–8 visible chips; use `TagSelect` beyond that
- Write option labels in parallel grammatical form within a single Select — all nouns, or all verb phrases, not a mix
- Use a descriptive placeholder that names what is being selected ("Select audience", not "—" or "Select")
- Keep menu options in a single left-aligned column at the standard item height so the list scans top-down without the eye tracking sideways
- Mark the selected menu item by rendering its label in `primary`/blue text (normal weight) — no background fill and no check icon; the open field already shows the chosen value

**Don't**
- Never mix multi-select `TextSelect` and `TagSelect` in the same form — pick one pattern
- Never use a select for a binary yes/no choice — use `Checkbox` or `Switch` instead
- Avoid `TextSelect` for 2–3 mutually exclusive options that can be shown at once — prefer `ToggleButtonGroup` or `RadioGroup` instead
- Avoid placing a `SelectableTag` row next to static display tags without a clear visual or heading separation — the toggleable chips otherwise read as read-only labels
- Avoid a placeholder that restates the label ("Audience" / "Select audience") verbatim — keep the placeholder an action-framed prompt distinct from the label noun
- Never add a `compBg/blueLite` background fill or a check icon to the selected menu item — the selected item is signaled by `primary`/blue label text only (the blue-lite tint is reserved for `SelectableTag`/`TagSelect` chips, not menu items)

---

## Anatomy

### TextSelect (closed)

```
  Label *                        ← label (headline5)
  ┌──────────────────────────┐   ← label–field gap
  │ [icon]  Placeholder   ▾  │   ← field
  └──────────────────────────┘
  Hint text                      ← hint (body2)
```

### TextSelect (open)

```
  ┌──────────────────────────┐
  │ [icon]  Selected value ▴ │
  └──────────────────────────┘
  ┌──────────────────────────┐  ← menu: border-popover, menu shadow
  │  Option 1                │  ← one item per row
  │  Option 2                │  ← selected item: primary/blue label text only (no bg, no check)
  │  Option 3                │
  └──────────────────────────┘
```

Zone roles: label (`headline5`), field (`border-general` border, `▾` toggle), popover menu (`border-popover`, menu shadow) with single-column items (selected item = `primary`/blue label text only — no background fill, no check icon). Field/menu heights, padding, radius, and shadow are defined centrally — see DESIGN-DS3 [Component heights](../DESIGN-DS3.md#component-heights) · [Shapes](../DESIGN-DS3.md#shapes) · [Elevation & Depth](../DESIGN-DS3.md#elevation--depth).

---

## TextSelect

The standard dropdown select for form fields. Supports single and multi-select modes. In multi-select, selected values display as inline pills inside the field; turn on inline search to let users type to filter as they select. Available in a default and a small size.

---

## TagSelect

Multi-select where each chosen option renders as a dismissible tag chip inside the field. Use this instead of multi-select `TextSelect` when the selected items need to be visually distinct and individually removable. Chips are large by default in v3 (medium in v2).

---

## SingleSelectFilter

A trigger button that opens a single-select dropdown menu. Designed for filter toolbars above tables and lists — not for form fields. The trigger shows the selected value and the menu closes automatically after a selection. For hierarchical option trees, use the titled drill-down mode.

---

## MultiSelectFilter

A trigger button that opens a popover with a checkbox list. Requires explicit Apply / Cancel confirmation — the selection is not committed until Apply is clicked. Keep the Apply/Cancel footer so users can confirm or cancel.

---

## SelectableTag

A standalone chip that toggles selected/unselected on click. Use when the options are few enough to display all at once (no dropdown needed). Limit to 6–8 tags per row; for larger option sets, use `TagSelect` instead.

---

## Component Style Tokens

```yaml
# DS2  (no select entry in DESIGN-DS2.md → components; mirrors `input`, verified from source)
select:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"
  border: "1px solid {colors.border-general}"
  rounded: "{rounded.sm}"
  height: 32px
  padding: 6px 12px                              # field inset (incl. 1px border); + right gutter for the dropdown arrow
  typography: "{typography.body1}"
select-menu:
  border: "1px solid {colors.border-popover}"   # menu border lighter than field's border-general
select-item-selected:
  textColor: "{colors.primary}"   # primary/blue label text only — no background fill, no check icon
```
```yaml
# DS3  (from DESIGN-DS3.md → components)
select:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"
  border: "1px solid {colors.border-general}"
  rounded: "8px"
  height: 40px
  padding: "10px 16px"                           # field inset (incl. 1px border); + right gutter for the dropdown arrow
  typography: "{typography.body1}"
select-height-default: 40px
select-radius:         radius-8
select-menu:
  border: "1px solid {colors.border-popover}"   # menu border lighter than field's border-general
select-item-selected:
  textColor: "{colors.primary}"   # primary/blue label text only — no background fill, no check icon
```

`TagSelect` / `SelectableTag` chips: the unselected chip uses a neutral gray tint (`compBg/grayLite`) with `text-high` text; the selected chip uses a light blue tint (`compBg/blueLite`) with `text-high` text and a `blue-40` border. Never render the selected chip as a solid `primary` fill with white text — that treatment is reserved for primary buttons, not selected tags. See [tag.md](tag.md) for the authoritative chip tokens.

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).
