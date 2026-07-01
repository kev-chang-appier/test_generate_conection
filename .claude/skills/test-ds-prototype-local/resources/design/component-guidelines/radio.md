# Radio Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Radio`, `RadioGroup`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63646-84388)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-68), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=211-6574))  
**Storybook:** [Radio](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-radio-radio--docs)

---

## Overview

Radio buttons enforce exactly one selection from a set of mutually exclusive options. Selecting a new option automatically deselects the previous one. The selection applies on form submit. If zero is a valid selection state, use `Checkbox` instead.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `RadioGroup` | Container that manages single-selection state across its `Radio` children |
| `Radio` | Individual option inside a `RadioGroup` |

---

## States

| State | Visual |
|---|---|
| Default unchecked | Hollow circle, 2px `border-emphasis` |
| Checked | `primary` filled circle |
| Hover | `stateOverlay/hover` background overlay |
| Pressed | `stateOverlay/pressed` overlay |
| Checked + hover | `stateOverlay/hoverBlue` blue tint overlay |
| Focused | `primary` outline — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled | Control at reduced opacity; label at full opacity |

---

## Do's and Don'ts

**Do**
- Use `Radio` / `RadioGroup` for mutually exclusive options where exactly one must be chosen
- Give each `Radio` a distinct value within its group
- Lay the group out vertically for 4+ options or labels longer than 2–3 words
- Preselect a default when there is a clear recommended or most common option
- Add a tooltip to individual options that need extra explanation
- Write each radio label as a parallel noun phrase ("Cost per click", "Cost per impression"), not a mix of forms or full sentences

**Don't**
- Use `Radio` when zero selections is a valid state — use `Checkbox` instead
- Mix `Radio` and `Checkbox` in the same option group
- Nest `RadioGroup` inside another `RadioGroup`
- Use `RadioGroup` for more than 6 options — use `Select` instead
- Lay the group out horizontally for more than 3 options or long labels
- Avoid leaving a `RadioGroup` with nothing preselected when one option is clearly the safe default — an all-empty group reads as unanswered rather than as a deliberate choice

---

## Anatomy

```
  ( )  Label text     ← unchecked: hollow circle, 2px `border-emphasis`
  (●)  Label text     ← checked: `primary` filled circle
```

Circle size (16px DS2 / 18px DS3), circle-to-label gap (8px), label typography, and vertical item gap are defined centrally — see DESIGN-DS3 [Component heights](../DESIGN-DS3.md#component-heights) · [Layout](../DESIGN-DS3.md#layout) · [Typography](../DESIGN-DS3.md#typography). The radio control is a full circle (50% radius).

---

## Behavior Notes

- **`RadioGroup`** — manages single-selection state and sets the selected option; lays the group out vertically (default) or horizontally.
- **`Radio`** — each option needs a distinct value within the group. An optional badge can sit beside the label (e.g. "Recommended", "Beta"); a hover tooltip can add extra explanation; when disabled, only this option's control dims — the label stays at full opacity.

---

## Component Style Tokens

```yaml
# DS2  (Radio shares one component; v3 only enlarges the circle)
radio:
  backgroundColor: "{colors.surface-primary}"
  border: "2px solid {colors.border-emphasis}"
  rounded: "9999px"                       # full circle
  size: 16px
  typography: "{typography.body1}"        # label, {colors.text-high}; 8px control-to-label gap
radio-checked:
  backgroundColor: "{colors.text-white-hold}"   # white center dot
  border: "4px solid {colors.surface-blue}"     # = primary ring
radio-hover:
  backgroundColor: "{overlays.stateOverlay/hover}"     # 28px overlay halo around the circle
radio-checked-hover:
  backgroundColor: "{overlays.stateOverlay/hoverBlue}"
radio-focused:
  border: "1px solid {colors.primary}"
```
```yaml
# DS3
radio:
  backgroundColor: "{colors.surface-primary}"
  border: "2px solid {colors.border-emphasis}"
  rounded: "radius-full"                  # full circle
  size: 18px                              # v3 enlarges from 16px
  typography: "{typography.body1}"        # label, {colors.text-high}; 8px control-to-label gap
radio-checked:
  backgroundColor: "{colors.text-white-hold}"   # white center dot
  border: "4px solid {colors.surface-blue}"     # = primary ring
radio-hover:
  backgroundColor: "{overlays.stateOverlay/hover}"     # 26px overlay halo around the circle (v3)
radio-checked-hover:
  backgroundColor: "{overlays.stateOverlay/hoverBlue}"
radio-focused:
  border: "1px solid {colors.primary}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
