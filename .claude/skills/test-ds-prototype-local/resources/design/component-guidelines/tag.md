# Tag Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Tag`, `SelectableTag`, `TagInput`, `TagSelect`, `AddTag`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63657-17493)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-81), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=7495-42877))  
**Storybook:** [Tag](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-tag-tag--docs)

---

## Overview

Tags label and categorize content as compact chips. Use them to annotate items, let users select from predefined values, enter free-form tokens, or pick from a dropdown list. Each component targets a distinct interaction model — pick by what the user is doing, not by visual preference.

---

## Components at a Glance

| Component | Interaction | When to use |
|---|---|---|
| `Tag` | Display, optional click/remove/edit | Label or category chip on data rows, cards, or filter summaries |
| `SelectableTag` | Toggle selected/unselected | Visible chip row where users toggle options directly — no dropdown |
| `TagInput` | Type to create tags | Free-form multi-value entry: email lists, keyword lists |
| `TagSelect` | Pick from a dropdown | Multi-select when options are predefined (audiences, categories) |
| `AddTag` | Search existing or create new | Inline tag-addition control paired with `TagInput` or a tag list |

---

## Sizes

| Size | Font | When to use |
|---|---|---|
| Small | `headline6` | Dense tables, compact lists |
| Normal | `headline6` | Standard UI — most common |
| Large | `headline5` | Prominent display, form inputs |

Heights, padding, and typography metrics are defined centrally — see DESIGN-DS3 [Component heights](../DESIGN-DS3.md#component-heights) · [Typography](../DESIGN-DS3.md#typography).

---

## Color Variants

| Color | Background | Text | Use when |
|---|---|---|---|
| Gray | `compBg/grayLite` | `text-med` | Neutral categorization (status, labels) |
| Blue | `compBg/blueLite` | `text-med` | Active, selected, or interactive state |

`SelectableTag` differs: its label uses `text-high`, and the selected chip switches to a `compBg/blueLite` background with a `blue-40` border. Color values are defined centrally — see DESIGN-DS3 [Colors](../DESIGN-DS3.md#colors).

---

## States

| State | Visual |
|---|---|
| Default | Flat chip, `compBg/grayLite` background (gray) |
| Hover (clickable) | `compBg/grayHeavy` background (blue → `compBg/blueHeavy`) |
| Pressed / focused (clickable) | `primary` border, `stateOverlay/pressed` background |
| Selected (`SelectableTag`) | `compBg/blueLite` background, `blue-40` border |
| Focused | `primary` outline — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled | Reduced opacity (0.5) |
| Error | `semantic-bg-red` tint, `semantic-red` text and border (when clickable) |

---

## Do's and Don'ts

**Do**
- Use `Tag` for read-only labels; make a tag clickable or removable only when interaction is intentional
- Use `TagInput` for free-form entry; use `TagSelect` when options are predefined — never swap them
- Keep tag text short (under 20 characters); show a tooltip whenever a label may be truncated by its container
- Surface per-tag errors (duplicates, invalid format) as the user types
- Give `TagSelect` an in-dropdown search when the option list has more than 10 items
- Have `AddTag` exclude already-selected items from its suggestions
- Use the blue color only for active, selected, or currently-applied states — not for visual emphasis or decoration

**Don't**
- Avoid using `SelectableTag` for more than 6–8 visible options — use `TagSelect` instead
- Never use `TagInput` when values must come from a fixed set — use `TagSelect` instead
- Never leave a tag field without a height limit — it will grow indefinitely
- Never use `AddTag` as a standalone form field without a backing tag list
- Avoid making tags editable without a visible hint that double-click activates editing — it is not discoverable by default
- Avoid using `Tag` for read-only system statuses, counts, or AI markers — use `Badge` instead
- Never set gray-tag label text to `text-high` (full-strength navy) — gray tags use `text-med`, which keeps the chip quiet against its `compBg/grayLite` fill. The over-dark, high-contrast label is a common rendering mistake

---

## Anatomy

```
  ┌──────────────────────┐   ← radius `radius-4`
  │  Label            ×  │   ← removable close icon, right-aligned
  └──────────────────────┘
```

Radius (`radius-4`, unchanged across versions) and typography are defined centrally — see DESIGN-DS3 [Shapes](../DESIGN-DS3.md#shapes) · [Typography](../DESIGN-DS3.md#typography) (DS2 in [DESIGN-DS2.md](../DESIGN-DS2.md)).

---

## Behavior Notes

- **`Tag`** — display chip, optionally clickable, removable (shows the × close icon), or editable (inline text edit on double-click; provide a visible hint as it is not discoverable). Shows a tooltip for truncated labels.
- **`TagInput`** — tags are created on Enter, comma, Space, or Tab. The field expands vertically as tags accumulate. Default tag size is large in v3 (was medium).
- **`TagSelect`** — selected options render as chips inside the field; same default tag-size change in v3 as `TagInput`.
- **`AddTag`** — the dropdown shows two sections: matching existing tags to add, and a create-new option at the bottom; already-selected tags are excluded.

---

## Component Style Tokens

```yaml
# DS2  (Tag/AddTag use styled-components theme tokens; SelectableTag uses Tailwind)
tag:
  backgroundColor: "{overlays.compBg/grayLite}"   # full-palette overlay token; BLUE color → {overlays.compBg/blueLite}
  textColor: "{colors.text-med}"
  rounded: "{rounded.sm}"                        # 4px
  height: 24px                                   # SMALL 20px / NORMAL 24px / LARGE 28px
  padding: 4px 8px                               # SMALL 2px 8px
  typography: "{typography.headline6}"           # LARGE uses {typography.headline5}
tag-hover:                                        # clickable / removable
  backgroundColor: "{overlays.compBg/grayHeavy}"   # BLUE → {overlays.compBg/blueHeavy}
tag-clickable:
  border: "1px solid {colors.border-emphasis}"     # hover: border → {colors.border-highlight} (BLUE → {colors.border-blueHeavy})
tag-focused:
  border: "1px solid {colors.primary}"
  backgroundColor: "{overlays.stateOverlay/pressed}"
tag-error:
  backgroundColor: "{colors.semantic-bg-red}"
  textColor: "{colors.semantic-red}"
  border: "1px solid {colors.semantic-red}"      # when clickable
tag-selectable:
  backgroundColor: "{overlays.compBg/grayLite}"
  textColor: "{colors.text-high}"
  border: "1px solid {colors.border-general}"
  rounded: "{rounded.sm}"                        # radius-4
  height: 24px
  padding: 4px 8px
  typography: "{typography.body2}"
tag-selectable-selected:
  backgroundColor: "{overlays.compBg/blueLite}"
  border: "1px solid {colors.blue-40}"           # full-palette ramp token
tag-selectable-focused:
  border: "1px solid {colors.primary}"
tag-add:
  textColor: "{colors.text-med}"
  border: "1px dashed {colors.border-emphasis}"
  rounded: "{rounded.sm}"                        # 4px
  typography: "{typography.headline6}"
tag-add-hover:
  border: "1px dashed {colors.border-highlight}"   # hover: border only; text stays {colors.text-med}
tag-add-editing:
  textColor: "{colors.primary}"                     # active/editing: blue text, icon, and border
  border: "1px dashed {colors.primary}"
```
```yaml
# DS3  (v3 only adjusts SMALL tag padding; geometry/colors otherwise shared with DS2)
tag:
  backgroundColor: "{overlays.compBg/grayLite}"   # full-palette overlay token; BLUE color → {overlays.compBg/blueLite}
  textColor: "{colors.text-med}"
  rounded: "radius-4"
  height: 24px                                   # SMALL 20px / NORMAL 24px / LARGE 28px
  padding: 4px 8px                               # SMALL 2px 6px (v3 override)
  typography: "{typography.headline6}"           # LARGE uses {typography.headline5}
tag-hover:                                        # clickable / removable
  backgroundColor: "{overlays.compBg/grayHeavy}"   # BLUE → {overlays.compBg/blueHeavy}
tag-clickable:
  border: "1px solid {colors.border-emphasis}"     # hover: border → {colors.border-highlight} (BLUE → {colors.border-blueHeavy})
tag-focused:
  border: "1px solid {colors.primary}"
  backgroundColor: "{overlays.stateOverlay/pressed}"
tag-error:
  backgroundColor: "{colors.semantic-bg-red}"
  textColor: "{colors.semantic-red}"
  border: "1px solid {colors.semantic-red}"      # when clickable
tag-selectable:
  backgroundColor: "{overlays.compBg/grayLite}"
  textColor: "{colors.text-high}"
  border: "1px solid {colors.border-general}"
  rounded: "radius-4"
  height: 24px
  padding: 4px 8px
  typography: "{typography.body2}"
tag-selectable-selected:
  backgroundColor: "{overlays.compBg/blueLite}"
  border: "1px solid {colors.blue-40}"           # full-palette ramp token
tag-selectable-focused:
  border: "1px solid {colors.primary}"
tag-add:
  textColor: "{colors.text-med}"
  border: "1px dashed {colors.border-emphasis}"
  rounded: "radius-4"
  typography: "{typography.headline6}"
tag-add-hover:
  border: "1px dashed {colors.border-highlight}"   # hover: border only; text stays {colors.text-med}
tag-add-editing:
  textColor: "{colors.primary}"                     # active/editing: blue text, icon, and border
  border: "1px dashed {colors.primary}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

---

Cross-version differences (including the `TagInput` / `TagSelect` default tag-size change from medium to large): see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
