# SegmentedControl Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `SegmentedControl`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=73098-171)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-71), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=1588-801))  
**Storybook:** [SegmentedControl](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-segmentedcontrol--docs)

---

## Overview

`SegmentedControl` lets users switch between 2–4 modes or filter presets without swapping a large content area. It is a compact single-select control suited to toolbar and control-bar contexts. For standalone mode toggles outside a toolbar, use `ToggleButtonGroup`.

---

## Components at a Glance

| Variant | When to use |
|---|---|
| Text | Short text labels — day/week/month, size presets, layout names |
| Icon | Icon-only options when meaning is unambiguous — always pair with a Tooltip |

---

## States

| State | Visual |
|---|---|
| Track (container) | Light-gray fill (`surface-quaternary`, #EDEEF1); `UI/border/general` border; holds all segments |
| Inactive | Transparent segment (track shows through); `UI/content/med` text |
| Hover | `stateOverlay/hover` background overlay |
| Active / selected | `UI/surface/primary` background (raised pill); `blue-normal` text, and a `blue-normal` outline on the pill in DS3 |
| Focused | `primary` focus ring — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |

---

## Do's and Don'ts

**Do**
- Use `SegmentedControl` inside toolbars and control bars for 2–4 compact mode or filter options
- Use the text variant for short labels; use the icon variant only when meaning is self-evident
- Add a `Tooltip` to each segment in the icon variant for accessibility
- Keep labels short and parallel — all nouns or all verb phrases
- Size all segments equally so the control reads as one unit; let the longest label set the shared segment width rather than letting each segment size to its own text
- Order segments by a natural progression (Day / Week / Month, smallest to largest) so users can predict where each option sits

**Don't**
- Use `SegmentedControl` for more than 4 options — use `Tabs` instead
- Use `SegmentedControl` for multi-select — use a Checkbox group instead
- Use the icon variant without tooltips on touch-first interfaces
- Mix icon and text labels within the same control
- Never place a `SegmentedControl` on a tinted surface that washes out the `UI/surface/primary` active pill — the selected segment must stay unmistakable against its background
- Avoid leaving the control with no segment selected on first display — one segment must always read as selected, never a group with no active segment
- Avoid letting segments size to their own labels so widths differ across the row — uneven segments break the single-unit reading; size them to the longest label
- Avoid ordering segments arbitrarily — sequence them by a natural progression or frequency of use so the set is predictable to scan

---

## Anatomy

```
┌────────────┬────────────┬────────────┐   ← light-gray track (`surface-quaternary`), `radius-8`, 4px inset
│  Option 1  │  Option 2  │  Option 3  │   ← active pill `radius-8` behind selected segment
└────────────┴────────────┴────────────┘
              ↑ active: `surface-primary` pill + `blue-normal` text and border
```

| Element | DS3 value |
|---|---|
| Outer container radius | `radius-8` |
| Container inset (gap + inset between segments) | 4px |
| Segment horizontal padding | 16px |
| Segment vertical padding | 10px |
| Active-pill radius | `radius-8` |
| Typography | `body2-highlight` — text-xs / 600 |
| Icon segment width | 52px (icon variant) |

---

## Component Style Tokens

```yaml
# DS2  (outer container; segments sit inside)
segmented-control:
  backgroundColor: "{colors.surface-quaternary}"
  border: "1px solid {colors.border-general}"
  rounded: "{rounded.sm}"            # outer container, rounded-radius-4
  padding: 4px                       # gap + inset between segments
segmented-control-segment:
  textColor: "{colors.text-low}"
  padding: 4px 8px                   # TEXT variant (px-2 py-1); ICON variant height 24px
  typography: "{typography.body2-highlight}"   # text-xs font-semibold
segmented-control-segment-hover:
  textColor: "{colors.text-med}"
segmented-control-segment-selected:
  textColor: "{colors.blue-normal}"  # full-palette ramp token
segmented-control-indicator:         # raised pill behind the selected segment
  backgroundColor: "{colors.surface-primary}"
  rounded: "{rounded.xs}"            # rounded-radius-2
```
```yaml
# DS3
segmented-control:
  backgroundColor: "{colors.surface-quaternary}"
  border: "1px solid {colors.border-general}"
  rounded: "radius-8"                # outer container, rounded-radius-8
  padding: 4px
segmented-control-segment:
  textColor: "{colors.text-low}"
  padding: 10px 16px                 # TEXT variant (px-spacing-16 py-spacing-10)
  typography: "{typography.body2-highlight}"
segmented-control-segment-hover:
  textColor: "{colors.text-med}"
segmented-control-segment-selected:
  textColor: "{colors.blue-normal}"  # full-palette ramp token
segmented-control-indicator:
  backgroundColor: "{colors.surface-primary}"
  border: "1px solid {colors.blue-normal}"   # full-palette ramp token; DS3 adds an outline on the pill
  rounded: "radius-8"                # rounded-radius-8
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).
