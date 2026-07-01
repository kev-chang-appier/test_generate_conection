# Checkbox Usage Guidelines

**Last updated:** 2026-06-30

**Components:** `Checkbox`, `CheckboxGroup`, `CheckboxTree`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=28208-404185)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-52), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=28208-404185))  
**Storybook:** [Checkbox](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-checkbox-checkbox--docs)

---

## Overview

Checkbox lets users select zero or more options from a set. The selection typically applies on form submit. Use `CheckboxGroup` to lay out multiple checkboxes, and `CheckboxTree` for hierarchical multi-select with parent–child relationships.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `Checkbox` | Single item — agree/disagree, or one item in a custom list |
| `CheckboxGroup` | Flat list of 2+ checkboxes with consistent spacing |
| `CheckboxTree` | Hierarchical multi-select with parent–child toggling |

---

## States

| State | Visual |
|---|---|
| Default unchecked | Empty box, 2px `border-emphasis` |
| Checked | `primary` fill, centered white `checkOutlined` glyph (16px) — render from the DS check icon, never a hand-drawn CSS tick |
| Indeterminate | `primary` fill, white `minusOutlined` glyph |
| Hover | `stateOverlay/hover` background overlay |
| Pressed | `stateOverlay/pressed` overlay |
| Checked + hover | `stateOverlay/hoverBlue` blue tint overlay |
| Focused | `primary` outline — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled | Control at reduced opacity; label at full opacity |

---

## Do's and Don'ts

**Do**
- Use `Checkbox` when the selection applies on form submit
- Show the indeterminate (dash) state on parent checkboxes in `CheckboxTree` when some (but not all) children are checked
- Lay out 4+ checkboxes vertically by default; use horizontal for 2–3 short labels or when many items wrap across rows (tag-style selection)
- Dim only the control when disabled — the label should remain at full opacity
- Render the checkmark from the DS check glyph (`checkOutlined`) and the indeterminate state from `minusOutlined` — never hand-draw a CSS tick (rotated-border pseudo-element), which reads off-center and thin. When hand-authoring raw HTML/CSS, a native `<input type="checkbox">` with `accent-color: {primary}` is an acceptable rendering — Checkbox/Radio are low-risk controls, so the anti-native-control guardrail (which targets `Select`/`DatePicker`/free-form tags) does not apply here

**Don't**
- Never use `Checkbox` for settings that take effect immediately — use `Switch` instead
- Avoid using `CheckboxTree` beyond 3 nesting levels
- Never mix `Checkbox` and `Radio` in the same option group
- Avoid styling a row of `Checkbox` items to read as a static legend or status list — the box must look toggleable, not like a list bullet
- Never phrase a checkbox label as a question or a command ("Archive this campaign?") — use a flat noun or state phrase ("Include archived campaigns") so the checked meaning is unambiguous

---

## Anatomy

```
  ┌──┐  Label text              ← box, radius `radius-4` (DS3; DS2 is a 2px radius)
  └──┘
  ┌✓─┐  Label text              ← checked: `primary` fill, white `checkOutlined` glyph (not a hand-drawn tick)
  └──┘
  ┌—─┐  Label text              ← indeterminate: `primary` fill, white `minusOutlined` glyph
  └──┘
```

Box size (14px DS2 / 16px DS3), radius (2px DS2 / `radius-4` DS3), box-to-label gap (8px), label typography, and vertical item gap are defined centrally — see DESIGN-DS3 [Component heights](../DESIGN-DS3.md#component-heights) · [Shapes](../DESIGN-DS3.md#shapes) · [Layout](../DESIGN-DS3.md#layout) · [Typography](../DESIGN-DS3.md#typography). Checkbox-specific:

| Element | Value |
|---|---|
| Tree indent | 16px per level |

---

## Behavior Notes

- **`Checkbox`** — the indeterminate state shows a dash without changing the checked value; use it on parent/summary items. A summary checkbox gives parent items in hierarchies an alternate (dimmed, non-interactive) visual. When disabled, only the control dims — the label stays at full opacity.
- **`CheckboxGroup`** — lays out `Checkbox` items with consistent spacing. Use vertical layout (default) for 4+ items. Horizontal layout suits two cases: 2–3 short-label options where a single row fits cleanly, or a large set of items that wraps across rows (tag-style selection).
- **`CheckboxTree`** — each item has a label, a checked value, and optional children. Parent checked state is derived automatically from children (checked / unchecked / indeterminate). Limit nesting to 3 levels; children indent 16px per level.

---

## Component Style Tokens

```yaml
# DS2  (Checkbox shares one component; v3 only enlarges the box and rounds it more)
checkbox:
  backgroundColor: "{colors.surface-primary}"
  border: "2px solid {colors.border-emphasis}"
  rounded: "{rounded.xs}"                 # 2px box
  size: 14px
  typography: "{typography.body1}"        # label, {colors.text-high}; 8px control-to-label gap
checkbox-checked:
  backgroundColor: "{colors.surface-blue}"   # = primary; white checkOutlined glyph, border removed
  border: "0px"
checkbox-indeterminate:
  backgroundColor: "{colors.surface-blue}"   # white minusOutlined glyph ({colors.text-white-hold})
  border: "0px"
checkbox-hover:
  backgroundColor: "{overlays.stateOverlay/hover}"     # 28px overlay halo around the box
checkbox-checked-hover:
  backgroundColor: "{overlays.stateOverlay/hoverBlue}"
checkbox-focused:
  border: "1px solid {colors.primary}"
```
```yaml
# DS3
checkbox:
  backgroundColor: "{colors.surface-primary}"
  border: "2px solid {colors.border-emphasis}"
  rounded: "radius-4"                    # 16px box (v3 enlarges from 14px)
  size: 16px
  typography: "{typography.body1}"        # label, {colors.text-high}; 8px control-to-label gap
checkbox-checked:
  backgroundColor: "{colors.surface-blue}"   # = primary; white checkOutlined glyph, border removed
  border: "0px"
checkbox-indeterminate:
  backgroundColor: "{colors.surface-blue}"   # white minusOutlined glyph ({colors.text-white-hold})
  border: "0px"
checkbox-hover:
  backgroundColor: "{overlays.stateOverlay/hover}"     # 26px overlay halo around the box (v3)
checkbox-checked-hover:
  backgroundColor: "{overlays.stateOverlay/hoverBlue}"
checkbox-focused:
  border: "1px solid {colors.primary}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
