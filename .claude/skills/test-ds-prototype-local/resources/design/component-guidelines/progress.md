# Progress Bar Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Progress bar`, `Progress bar_budget goal`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=7885-88323)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-65), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=7885-88323))  
**Storybook:** None — Figma-only components with no code counterpart in the library

---

## Overview

`Progress bar` communicates measurable, percentage-based progress. `Progress bar_budget goal` extends the base bar with a 1px vertical goal-marker rule for budget and quota contexts. Both are Figma design components without a direct code counterpart.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `Progress bar` | Determinate progress — file upload, batch processing, any task with a reliable completion percentage |
| `Progress bar_budget goal` | Budget or quota consumption with a target-goal marker — campaign spend, seat usage |

---

## Variants

### Colors

| Color | Meaning |
|---|---|
| Primary blue | Active / in-progress |
| `semantic-green` | Complete |
| `semantic-red` | Failed / error |

---

## States

| Component | State | Visual |
|---|---|---|
| `Progress bar` | Active | Track `compBg/grayHeavy`; fill `primary`; animates toward current % |
| `Progress bar` | Indeterminate | Shimmer sweeps across track when no percentage is available |
| `Progress bar` | Complete | Fill `semantic-green`; reaches 100% width |
| `Progress bar` | Error | Fill `semantic-red`; halted at failure percentage |
| `Progress bar_budget goal` | Under goal | Fill blue; goal marker visible ahead of fill |
| `Progress bar_budget goal` | Over goal | Fill extends past goal marker; marker remains at goal position |

---

## Do's and Don'ts

**Do**
- Use `Progress bar` only when the percentage is derived from real completion data — a stalling bar at 99% erodes trust more than a spinner
- Display a label with the current percentage; on completion, briefly show the success (green) state before removing or collapsing the bar
- Keep the label and percentage tight to their own bar when several bars stack, so each value reads as belonging to the track beneath it
- On error, switch to the error (red) state and display an actionable error message

**Don't**
- Never show both a spinner and a `Progress bar` for the same operation
- Never use `Progress bar_budget goal` outside of budget or quota contexts — the goal-marker implies a threshold that misleads users in generic upload flows; use `Progress bar` instead
- Never repurpose the green or red fill for anything but complete and error — reusing the completion or failure color for an in-progress bar makes the state ambiguous; keep in-progress blue
- Avoid using `Progress bar` for indeterminate waits with no real percentage — use `InfiniteLoadingSpinner` instead

---

## Anatomy

```
Progress bar:

  Label (optional)                  N%   ← right-aligned, text-med
  ┌──────────────────────────────────┐   ← track: 4px height, radius-full
  │█████████████░░░░░░░░░░░░░░░░░░░░│   ← fill: primary blue, radius-full ends
  └──────────────────────────────────┘
  Width: fills container (100% by default)


Progress bar_budget goal:

  Label (optional)        N% · Goal: M%
  ┌──────────────────────────────────┐
  │████████████████████░░░│░░░░░░░░░│   ← vertical goal marker at goal%
  └──────────────────────────────────┘
                          ↑ 1px vertical rule, text-med color
```

---

## Progress bar

> `Progress bar` is a Figma design component. Confirm the details with the DS team before implementing.

### Key design properties

A 4px-high track at `radius-full`, with a fill colored by state. Track uses `compBg/grayHeavy`; fill uses `primary` (active), `semantic-green` (complete), or `semantic-red` (error). An optional percentage label is right-aligned above the track in `text-med`. Token values are defined centrally — see DESIGN-DS3 [Colors](../DESIGN-DS3.md#colors) · [Shapes](../DESIGN-DS3.md#shapes).

---

## Progress bar_budget goal

> `Progress bar_budget goal` is a Figma design component. Confirm the details with the DS team before implementing.

Extends `Progress bar` with a 1px vertical goal-marker rule at the specified goal percentage. Use only for budget or quota contexts — the marker implies a threshold the fill can exceed, which is specific to that use case.

---

## Component Style Tokens

Both `Progress bar` and `Progress bar_budget goal` are Figma-only design components with no code counterpart, so the recipe is derived from the Figma spec and is identical across versions except for radius-scale naming. The fill color encodes state (active → complete → error); the track and label colors stay fixed.

```yaml
# DS2  (Figma-only component; recipe from spec)
progress-bar:
  backgroundColor: "{overlays.compBg-grayHeavy}"  # track; Figma compBg/* family fill
  textColor: "{colors.text-med}"                # percentage label + goal-marker rule
  rounded: "9999px"                             # radius-full end caps
  height: 4px
progress-bar-complete:
  backgroundColor: "{colors.semantic-green}"    # fill at 100%
progress-bar-error:
  backgroundColor: "{colors.semantic-red}"      # fill halted at failure %
progress-bar-active:
  backgroundColor: "{colors.primary}"           # in-progress fill (default)
```
```yaml
# DS3
progress-bar:
  backgroundColor: "{overlays.compBg-grayHeavy}"  # track; Figma compBg/* family fill
  textColor: "{colors.text-med}"                # percentage label + goal-marker rule
  rounded: "radius-full"                        # end caps
  height: 4px
progress-bar-complete:
  backgroundColor: "{colors.semantic-green}"    # fill at 100%
progress-bar-error:
  backgroundColor: "{colors.semantic-red}"      # fill halted at failure %
progress-bar-active:
  backgroundColor: "{colors.primary}"           # in-progress fill (default)
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Both `Progress bar` and `Progress bar_budget goal` remain Figma-only design components in DS2 and DS3 with no code counterpart. DS3 adds an `Uploading` Figma pattern (upload-specific progress state).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
