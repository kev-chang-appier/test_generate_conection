# ColorPicker Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `ColorPicker`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=65044-22607)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-53), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=34699-461769))  
**Storybook:** [ColorPicker](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-colorpicker--docs)

---

## Overview

`ColorPicker` lets users select a color through a saturation/brightness gradient, hue and alpha sliders, and direct Hex/RGBA numeric input. It accepts either a hex or an rgba color and reports the selection on every change. An optional preset swatch row lets users save and recall frequently used colors, and an eyedropper can be offered alongside the panel where the browser supports it.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `ColorPicker` | Inline color selection panel — brand colors, chart series colors, text or background customization |

---

## Color Format

Accepts a hex or an rgba color as input (a hex value is treated as fully opaque), and reports the selection as hex, rgb, and alpha on change. Conversion helpers and exact formats are documented in Storybook.

---

## Preset Colors

Users can save colors to the preset swatch row with the add button. To remove a preset, hover the swatch for one second until a delete menu appears. The preset row can be hidden entirely in contexts where preset management is unnecessary.

---

## States

| State | Visual |
|---|---|
| Default | Panel visible; gradient area, hue and alpha sliders, Hex/RGB inputs, presets row all shown |
| Dragging (gradient) | Circular handle follows pointer; the color updates continuously |
| Dragging (slider) | Slider thumb follows pointer; hue or alpha updates live |
| Input focused | Standard 2px `UI/primary` focus ring on the active numeric input |
| Preset hover | Swatch scales up slightly; delete affordance appears after 1 s hold |
| Eyedropper active | Browser eyedropper cursor active; resolves to the sampled color |

---

## Do's and Don'ts

**Do**
- Keep the selected color synced to application state when it must be persisted or reflected in other UI elements
- Seed the preset row with brand palette swatches so users have a consistent starting point
- Hide the preset row in constrained contexts (e.g. a quick-access popover) where preset management would be cluttering
- Pair the picker with a visible trigger (a color swatch button) rather than placing it inline in a form — it is a large panel
- Offer the eyedropper only where the browser supports it; hide it otherwise

**Don't**
- Avoid passing a malformed color — the picker expects a `#rrggbb` hex or an `rgba(…)` value
- Avoid using `ColorPicker` for selecting from a fixed brand palette — a `Select` with color swatches in the options is clearer and prevents off-brand values
- Never place the picker inline inside a table cell or tight sidebar — it needs at least ~260px width
- Avoid a trigger swatch that ignores alpha — show the current color over a checkerboard so a semi-transparent selection is distinguishable from an opaque one
- Never label the swatch delete action as a bare noun ("Color", "Preset") — use a verb-first action ("Remove")

---

## Anatomy

```
  ┌────────────────────────────────┐
  │                                │  ← saturation/brightness gradient
  │                           ●    │  ← drag handle (x = saturation, y = brightness)
  │                                │
  ├────────────────────────────────┤
  │  [━━━━━━━━━━━━━━━━━━━━━━━]  ●  │  ← hue slider
  │  [░░░░░░░░░░░░░░░░░░░░░░]  ●  │  ← alpha slider (checkerboard bg)
  ├────────────────────────────────┤
  │  [ #ff0000 ]  [255][  0][  0][100%] │  ← Hex input · R · G · B · A
  ├────────────────────────────────┤
  │  ■ ■ ■ ■ ■ ■   [+]   [eye]   │  ← preset swatches · add · eyedropper
  └────────────────────────────────┘
```

Component-specific dimensions:

| Zone | DS2 | DS3 |
|---|---|---|
| Panel border radius | 8px | 16px |
| Panel width | 288px | 300px |
| Numeric input height | 28px | 32px |
| Preset / color swatch size | 20px (3px inner fill) | 20px (3px inner fill) |

Typography follows the central scale — see [Typography](../DESIGN-DS3.md#typography).

---

## Patterns

### Eyedropper integration

The eyedropper is not part of the panel itself. Offer it as a small icon button next to the `ColorPicker` panel, shown only where the browser supports sampling a screen color; picking a color applies it to the current selection.

### Popover trigger

Place the picker inside a `Popover` anchored to a color swatch button so it opens on demand and does not occupy permanent form space; the swatch reflects the current color and the preset row can be hidden in this compact context.

---

## Component Style Tokens

The numeric Hex/RGB/A fields are standard Inputs; refer to the Input guideline for their tokens. Panel-level styling is shown below.

```yaml
# DS2
color-picker-panel:
  backgroundColor: "{colors.surface-popover}"
  border: "1px solid {colors.border-popover}"
  rounded: "{rounded.md}"            # border-radius: 8px
  width: 288px
  padding: 12px
color-picker-swatch:                 # color area + preset swatches
  border: "1px solid {colors.border-general}"
  rounded: "{rounded.sm}"            # 4px (inner fill 3px)
  height: 20px
  width: 20px
color-picker-slider-pointer:         # hue / alpha thumbs
  backgroundColor: "{colors.surface-primary}"
  border: "6px solid {colors.surface-primary}"
  height: 16px
  width: 16px
color-picker-preset-menu:            # delete-on-hover floating menu
  backgroundColor: "{colors.surface-primary}"
  rounded: "{rounded.md}"            # border-radius: 8px
```
```yaml
# DS3
color-picker-panel:
  backgroundColor: "{colors.surface-popover}"
  border: "1px solid {colors.border-popover}"
  rounded: "radius-16"               # rounded-radius-16
  width: 300px
  padding: 16px
color-picker-swatch:
  border: "1px solid {colors.border-general}"
  rounded: "radius-4"                # 4px (inner fill 3px); swatch size unchanged from DS2
  height: 20px
  width: 20px
color-picker-slider-pointer:
  backgroundColor: "{colors.surface-primary}"
  border: "6px solid {colors.surface-primary}"
  height: 16px
  width: 16px
color-picker-preset-menu:
  backgroundColor: "{colors.surface-primary}"
  rounded: "radius-8"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md). Behavior is unchanged across versions. The alpha slider uses a checkerboard background to indicate transparency, and the panel sits in a popover with Shadow M elevation.
