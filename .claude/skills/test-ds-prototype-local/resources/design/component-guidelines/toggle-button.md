# ToggleButton Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `ToggleButtonGroup`, `ToggleButton`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=65843-29731)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-50), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=10988-71192))  
**Storybook:** [ToggleButton](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-button-togglebutton--docs)

---

## Overview

`ToggleButtonGroup` lets users switch a persistent setting (view mode, theme, platform) outside of toolbar contexts. It is a standalone single-select control, and selection is immediate with no confirm step. For compact mode toggles inside a toolbar or control bar, use `SegmentedControl`.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `ToggleButtonGroup` | Container that manages selection state across its `ToggleButton` children |
| `ToggleButton` | Individual option inside a `ToggleButtonGroup` |

---

## States

| State | Visual |
|---|---|
| Inactive | Transparent fill, `UI/content/med` text, `UI/border/general` border |
| Hover | `stateOverlay/hover` overlay, text unchanged |
| Active / selected | `stateOverlay/hoverBlue` fill, `blue-normal` text |
| Focused | `primary` focus ring, 2px offset — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled | `opacity: 0.5` — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) Disabled rule |

---

## Do's and Don'ts

**Do**
- Use `ToggleButtonGroup` for standalone mode or view toggles on a page (e.g. list/grid switcher)
- Keep options to 2–4 items
- Pair an icon with the label when visual reinforcement helps scanning speed
- Disable individual `ToggleButton` items when a specific option is unavailable in context
- Order `ToggleButton` items by a natural progression or frequency of use so the row is predictable to scan

**Don't**
- Avoid using `ToggleButtonGroup` for more than 4 options — use `Tabs` instead
- Never use `ToggleButtonGroup` for multi-select — use a Checkbox group instead
- Never omit the label in favor of icon-only buttons without adding a Tooltip
- Never use `ToggleButtonGroup` for choices that need a confirm step — selection applies immediately
- Never leave `ToggleButtonGroup` with no option selected on first display — one `ToggleButton` must always read as active; an all-inactive group hides the current mode
- Avoid giving some `ToggleButton` items an icon and others none within one group — the inconsistent treatment breaks the single-set reading
- Avoid dropping an unrelated control into the toggle row — keep the group as one cluster and place other actions in their own region

---

## Anatomy

```
┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│  [icon] List│ │[icon] Grid ✓│ │[icon] Compact│  ← selected: `stateOverlay/hoverBlue` bg, `blue-normal` text
└─────────────┘ └─────────────┘ └─────────────┘
    ↑ radius `radius-8`, height driven by vertical padding, border `border-general`
```

---

## Component Style Tokens

```yaml
# DS2
toggle-button-group:                 # container holding the ToggleButton row
  backgroundColor: "{colors.surface-primary}"
  border: "1px solid {colors.border-general}"
  rounded: "{rounded.sm}"            # rounded-radius-4
  height: 32px                       # h-spacing-32
toggle-button:                       # resting segment
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-med}"
  border: "1px solid {colors.border-general}"   # right divider between segments
  padding: 5px 11px
  typography: "{typography.headline5}"
toggle-button-hover:
  backgroundColor: "{overlays.stateOverlay-hover}"
toggle-button-selected:
  backgroundColor: "{overlays.stateOverlay-hoverBlue}"
  textColor: "{colors.blue-normal}"  # full-palette ramp token
```
```yaml
# DS3
toggle-button-group:
  backgroundColor: "{colors.surface-primary}"
  border: "1px solid {colors.border-general}"
  rounded: "radius-8"                # rounded-radius-8
  height: auto                       # h-auto, driven by 10px vertical padding
toggle-button:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-med}"
  border: "1px solid {colors.border-general}"
  padding: 10px 16px                 # px-spacing-16 py-[10px]
  typography: "{typography.headline5}"
toggle-button-hover:
  backgroundColor: "{overlays.stateOverlay-hover}"
toggle-button-selected:
  backgroundColor: "{overlays.stateOverlay-hoverBlue}"
  textColor: "{colors.blue-normal}"  # full-palette ramp token
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).
