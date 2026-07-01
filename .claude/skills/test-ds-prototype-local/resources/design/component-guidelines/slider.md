# Slider Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Slider`
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=7582-46440)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-74), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=7582-46440))  
**Storybook:** [Slider](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-slider--docs)

## Overview

`Slider` lets users select a value within a bounded range by dragging a handle or clicking the track. Use it when relative position is more intuitive than typing a precise number — threshold adjustments, budget caps, duration settings — or when selecting from a small set of **ordered levels** (Low / Medium / High, Slow / Normal / Fast) where the track conveys the progression between options. When users need to enter an exact value, use `Input` instead — or pair `Slider` with an `Input` when both approximate dragging and precise entry are useful.

## Components at a Glance

| Component | When to use |
|---|---|
| `Slider` | Selecting an approximate value or ordered level within a bounded range |

## States

| State | Visual |
|---|---|
| Default | Filled track `semantic-blue` from min to handle; unfilled track `compBg-blueHeavy` from handle to max |
| Hover | Handle expands slightly |
| Focused | Translucent ring on handle (`stateOverlay` blue) — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled | Track and handle at `opacity: 0.5`, no interaction — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |

## Do's and Don'ts

**Do**
- Always show the current value or level label next to the slider — the handle position alone is not precise enough for users to know what they've selected
- Set a meaningful minimum, maximum, and step. A budget slider with no step produces fractional values; a 3-level slider should step by 1 across three stops (0 to 2).
- For ordered-level sliders, show tick marks and labels at each stop (Low / Medium / High) so users understand the available options
- Keep the slider's value synced to application state in forms and settings so it always reflects the current setting

**Don't**
- Use `Slider` for unordered or equally-weighted options — use `Select` or `SegmentedControl` instead. The slider is appropriate only when the options have a clear low-to-high progression.
- Use `Slider` for more than ~7 labeled levels — beyond that the stops become too close to click accurately; use `Select` instead
- Set the step so small that it creates more than ~20 stops on the track — fine-grained sliders are hard to target and lose the affordance of approximate selection
- Use `Slider` for binary choices — use `Switch` or `Checkbox`

## Anatomy

```
  ┌────────────────────────────────────────────────────────────┐
  │  ████████████████████──────────────────────────────────── │
  │                     ●                                      │
  └────────────────────────────────────────────────────────────┘
     ↑ filled track (min → value)   ↑ handle   ↑ unfilled track (value → max)
```

| Property | DS3 value |
|---|---|
| Track height | 4px |
| Handle diameter | 16px |
| Handle shape | Circle |
| Typography | Inter |

## Component Style Tokens

Slider shares one implementation across versions; DS3 only adds a `border-general` outline on the handle. Track/handle sizes are identical.

```yaml
# DS2
slider-track:
  backgroundColor: "{overlays.compBg-blueHeavy}"   # unfilled track (handle → max)
  height: 4px                        # h-spacing-4
  width: 200px
  rounded: "radius-full"             # rounded-radius-full
slider-track-filled:
  backgroundColor: "{colors.semantic-blue}"       # filled track (min → handle)
slider-handle:
  backgroundColor: "{colors.text-white-hold}"
  rounded: "radius-full"
  height: 16px                       # w/h-spacing-16
  width: 16px
slider-handle-hover:
  border: "6px solid {overlays.stateOverlay-hoverBlue}"   # outline ring
slider-handle-focused:
  border: "6px solid {overlays.stateOverlay-pressedBlue}" # outline ring
```
```yaml
# DS3
slider-track:
  backgroundColor: "{overlays.compBg-blueHeavy}"
  height: 4px
  width: 200px
  rounded: "radius-full"
slider-track-filled:
  backgroundColor: "{colors.semantic-blue}"
slider-handle:
  backgroundColor: "{colors.text-white-hold}"
  border: "1px solid {colors.border-general}"     # DS3 adds a handle outline
  rounded: "radius-full"
  height: 16px
  width: 16px
slider-handle-hover:
  border: "6px solid {overlays.stateOverlay-hoverBlue}"
slider-handle-focused:
  border: "6px solid {overlays.stateOverlay-pressedBlue}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
