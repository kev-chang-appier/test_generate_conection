# Switch Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Switch`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=7396-83275)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-78), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=7396-83275))  
**Storybook:** [Switch](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-switch-switch--docs)

---

## Overview

`Switch` lets users turn a single setting on or off, applying the moment they act — no form submit required. "Immediate" covers any visible change without submitting: activating a feature, making a back-end call, or showing and hiding a UI section. When the toggle has no visible effect until form submission, use `Checkbox` instead.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `Switch` | Binary on/off setting that applies the moment the user toggles it |

---

## States

| State | Visual |
|---|---|
| Off (default) | Track `compBg/grayHeavy`, thumb `text-white-hold` |
| On | Track `surface-blue`, thumb `text-white-hold` |
| Hover | `stateOverlay/hover` background overlay |
| On + hover | `stateOverlay/hoverBlue` blue tint overlay |
| Focused | `primary` outline, 2px offset — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled (off) | Control at `opacity: 0.5`; label at full opacity — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled (on) | `primary` track at `opacity: 0.5`; label at full opacity |

---

## Do's and Don'ts

**Do**
- Use `Switch` when the change takes effect immediately without a Save button
- Use `Switch` inside a Save-button form only when all controls are consistently pending and Save is always visible — mixing immediate and pending controls confuses users, and a hidden Save removes the only signal that they're in draft mode
- Label the switch so both the on and off states are unambiguous from the label alone
- Apply the change the moment the switch is toggled — not on a surrounding form submit
- Show a tooltip when the switch controls a non-obvious or high-impact setting

**Don't**
- Never use `Switch` when it looks immediate — no surrounding form, no visible Save — but silently defers the change; use `Checkbox` instead
- Never use `Switch` for more than two options — it is binary only
- Never dim the label when disabled — only the control itself should dim
- Never rewrite the switch label to describe its current position ("On" / "Off", "Enabled" / "Disabled") — name the setting once so the label stays fixed while the track shows the state
- Avoid spacing a list of switches the same as the gap between unrelated setting groups — tighten spacing within a group and widen it between groups so related toggles cluster

---

## Anatomy

```
  ●────  Off     ← track: `compBg/grayHeavy`, thumb: `text-white-hold` circle
  ────●  On      ← track: `surface-blue`, thumb: `text-white-hold` circle
```

| Element | Value |
|---|---|
| Track | 36 × 18px (DS2) · 38 × 18px (DS3) |
| Thumb | 14px circle |
| Track radius | 10px — renders as a pill at 18px track height |
| Switch-to-label gap | 8px |
| Label typography | `body1` 14px / 400 |

---

## Behavior Notes

- The switch reflects its on/off state and applies the change the moment it is toggled.
- The label names the setting; a hover tooltip and an optional badge can sit beside it. When disabled, only the control dims — the label stays at full opacity.

---

## Component Style Tokens

```yaml
# DS2  (Switch shares one component; v3 only widens the track)
switch-track-off:
  backgroundColor: "{overlays.compBg/grayHeavy}"   # full-palette overlay token
  rounded: "10px"                                 # pill at 18px track height
  width: 36px
  height: 18px
switch-track-on:
  backgroundColor: "{colors.surface-blue}"        # = primary
switch-thumb:
  backgroundColor: "{colors.text-white-hold}"     # 14px circle
  rounded: "9999px"
switch-hover:
  backgroundColor: "{overlays.stateOverlay/hover}"
switch-on-hover:
  backgroundColor: "{overlays.stateOverlay/hoverBlue}"
switch-label:
  textColor: "{colors.text-high}"
  typography: "{typography.body1}"                # 8px switch-to-label gap
```
```yaml
# DS3  (v3 widens the track to 38px; colors, radius, thumb unchanged)
switch-track-off:
  backgroundColor: "{overlays.compBg/grayHeavy}"   # full-palette overlay token
  rounded: "10px"
  width: 38px
  height: 18px
switch-track-on:
  backgroundColor: "{colors.surface-blue}"        # = primary
switch-thumb:
  backgroundColor: "{colors.text-white-hold}"     # 14px circle
  rounded: "radius-full"
switch-hover:
  backgroundColor: "{overlays.stateOverlay/hover}"
switch-on-hover:
  backgroundColor: "{overlays.stateOverlay/hoverBlue}"
switch-label:
  textColor: "{colors.text-high}"
  typography: "{typography.body1}"                # 8px switch-to-label gap
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md). Behavior is unchanged between DS2 and DS3.
