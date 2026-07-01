# Stepper Usage Guidelines

**Last updated:** 2026-06-30

**Components:** `Stepper`
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=21673-390045)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-76), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=21673-390045))  
**Storybook:** [Stepper](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-stepper--docs)

---

## Overview

`Stepper` shows progress through a defined sequence of steps — campaign setup, onboarding flows, multi-page forms. Each step node carries a status that reflects whether the user has completed it, encountered an issue, or has yet to reach it. Completed steps can be made clickable to let users revisit earlier stages.

> Looking for a numeric input with +/− controls? That's `StepperInput`, documented in [input.md](input.md).

---

## Components at a Glance

| Component | When to use |
|---|---|
| `Stepper` | Top-of-page progress indicator for any linear multi-step flow |

---

## Step Statuses

Each step carries a status. Set it to reflect the real state of that step — don't mark a step Success speculatively before the user has submitted it.

| Status | When to use |
|---|---|
| Current | The step the user is actively working on |
| Success | A step the user has completed without issues |
| Warning | A step that was completed but has a non-blocking issue |
| Error | A step with a blocking error that must be resolved |
| Pending | A step the user has not yet reached |

---

## Icon Configurations

| Configuration | When to use |
|---|---|
| With label (default) | Always include labels unless horizontal space is critically constrained |
| Icon-only (no label) | Compact flows with ≤4 steps where step meaning is clear from context |
| Custom icon | When a pictogram communicates the step content better than the default status badge |

---

## States

| State | Visual |
|---|---|
| Current | Filled circle, `surface-blue` fill and outline, white step number |
| Success | Filled circle, `semantic-green`, white step number (no check icon) |
| Warning | Standalone 24px warning icon, `semantic-orange` (no circle) |
| Error | Standalone 24px error icon, `semantic-red` (no circle) |
| Pending | Outlined circle, `border-general` outline, `text-low` step number |
| Clickable | Pointer cursor; `stateOverlay/hover` highlight on the node wrapper |

---

## Do's and Don'ts

**Do**
- Always set exactly one step to Current — it anchors the user's position in the flow
- Make only completed (Success, Warning) steps clickable to signal they can be revisited
- Add a tooltip on Error and Warning steps to explain what went wrong and what to do next
- Keep labels to 1–3 words — they render beside the node (to its right) and truncate in tight widths
- Order steps in the sequence users move through, left to right, so progress reads forward
- Size custom icons to fit the 24px node footprint (default status icons are 24px), keeping every node the same 24px diameter

**Don't**
- Never use `Stepper` for non-linear flows — it implies sequence; use `Tabs` for independent sections
- Never set all steps to Success before the flow is complete — users rely on the current-step indicator for orientation
- Never make an Error step clickable — a step with a blocking error should not be navigable until fixed
- Avoid omitting labels in flows with more than 4 steps — icon-only steppers lose legibility at scale
- Avoid placing `Stepper` inside a `Dialog` or `Drawer` — it belongs at the top of the main content area
- Never color the connector line by progress — it is always `border-general` (gray). Completed segments do not turn blue, green, or any status color; only the step nodes carry status, never the lines between them

---

## Anatomy

```
  ● Label 1 ─────── ⚠ Label 2 ─────── ✖ Label 3 ─────── ④ Label 4 ─────── ○ Label 5
   Success           Warning            Error            Current           Pending

●  filled circle node (Success / Current), with the label inline to its right; Warning and Error
   render a standalone 24px status icon (no circle) in place of the node
○  outlined circle node (Pending), `border-general` outline
── connector line: `border-general` between steps
```

Each step lays out horizontally as `[node] [label]`, with the connector line running between steps. Node diameter 24px; connector is a 1px `border-general` divider between nodes. The step number renders in `headline6`; the node sits inside an 8px-radius clickable wrapper that shows a `stateOverlay/hover` highlight only when the step is clickable. Label typography (`body1`) and color tokens are defined centrally — see DESIGN-DS3 [Colors](../DESIGN-DS3.md#colors) · [Typography](../DESIGN-DS3.md#typography).

---

## Component Style Tokens

```yaml
# DS2  (Stepper is a styled-components implementation; DS3 ships a separate v3 implementation)
stepper:
  textColor: "{colors.text-high}"             # container text-high
stepper-node:
  textColor: "{colors.text-white-hold}"       # step number on filled node
  typography: "{typography.headline6}"        # step number text
  rounded: "radius-full"                       # circle (border-radius 50%)
  size: 24px                                   # min-width 24px node diameter
stepper-node-wrapper:
  rounded: "{rounded.md}"                      # 8px clickable wrapper, 2px padding
stepper-node-current:
  backgroundColor: "{colors.surface-blue}"
  border: "1px solid {colors.surface-blue}"
stepper-node-success:
  backgroundColor: "{colors.semantic-green}"
stepper-node-warning:
  backgroundColor: "{colors.semantic-orange}"  # standalone 24px warning icon (no circle)
stepper-node-error:
  backgroundColor: "{colors.semantic-red}"     # standalone 24px error icon (no circle)
stepper-node-pending:
  backgroundColor: "transparent"
  border: "1px solid {colors.border-general}"  # outlined circle
  textColor: "{colors.text-low}"               # text-low number
stepper-connector:
  border: "1px solid {colors.border-general}"  # 1px divider between nodes, 4px horizontal margin
stepper-label:
  typography: "{typography.body1}"
stepper-node-hover:
  backgroundColor: "{overlays.stateOverlay/hover}"   # only when onClick set (full-palette state token)
```
```yaml
# DS3  (separate v3 implementation; same API, but visual styling differs — e.g. connector margin)
stepper:
  textColor: "{colors.text-high}"             # container text-high
stepper-node:
  textColor: "{colors.text-white-hold}"       # step number on filled node
  typography: "{typography.headline6}"        # step number text
  rounded: "radius-full"                       # circle (border-radius 50%)
  size: 24px                                   # min-width 24px node diameter
stepper-node-wrapper:
  rounded: "radius-8"                          # 8px clickable wrapper, 2px padding
stepper-node-current:
  backgroundColor: "{colors.surface-blue}"
  border: "1px solid {colors.surface-blue}"
stepper-node-success:
  backgroundColor: "{colors.semantic-green}"
stepper-node-warning:
  backgroundColor: "{colors.semantic-orange}"  # standalone 24px warning icon (no circle)
stepper-node-error:
  backgroundColor: "{colors.semantic-red}"     # standalone 24px error icon (no circle)
stepper-node-pending:
  backgroundColor: "transparent"
  border: "1px solid {colors.border-general}"  # outlined circle
  textColor: "{colors.text-low}"               # text-low number
stepper-connector:
  border: "1px solid {colors.border-general}"  # 1px divider between nodes, 12px horizontal margin
stepper-label:
  typography: "{typography.body1}"
stepper-node-hover:
  backgroundColor: "{overlays.stateOverlay/hover}"   # only when onClick set (full-palette state token)
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md). The API is unchanged between DS2 and DS3, but the visual styling differs — notably the connector's horizontal margin (4px in DS2, 12px in DS3).
