# Button Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Button`, `SplitButton`, `IconButton`, `TextButton`, `TriggerButton`  
**See also:** [`toggle-button.md`](toggle-button.md) — `ToggleButton` / `ToggleButtonGroup`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63384-456820)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-50), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=937-30444))  
**Storybook:** [Button](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-button-button--docs)  
**Writing style:** [Appier UX Writing Style Guide — Buttons](https://docs.google.com/spreadsheets/d/1Xy-CrfQ7ik_hFMdIhlSIM_xb3xkYtT_Ok5L1PsQl02U/edit?gid=0#gid=0)

---

## Overview

Buttons trigger actions. `Button` is the primary component and can render icon-only — this is separate from the dedicated `IconButton` component. Most button components exist in both versions and are simply re-skinned in DS3 (Figma prefixes the DS3 variants with `*`): `Button`, `IconButton`, `SplitButton`, `ToggleButton` / `ToggleButtonGroup`, and `TriggerButton` (AI/Copilot surfaces only). The exception is `TextButton` — it has no DS3 component; use `Button` with the Minimal variant instead.

---

## Components at a Glance

| Component | When to use | DS2 Figma | DS3 Figma |
|---|---|---|---|
| `Button` | All standard actions — the default choice | `Button` | `*Button` |
| `IconButton` | Icon-only button in tight spaces (header, table rows) | `Icon button` | `*Icon button` |
| `TextButton` | Low-emphasis inline action (e.g. "Add row") | `Text Button` | No DS3 component — use `*Button` (Minimal) |
| `TriggerButton` | AI/Copilot surfaces only — do not use elsewhere | `Trigger Button` (AI Copilot library) | `AI CopilotUI/Trigger Button` |
| `SplitButton` | Primary action + dropdown alternative (e.g. Save / Save as draft) | `Split button` | `*SplitButton` |
| `ToggleButton` / `ToggleButtonGroup` | Mutually exclusive mode switches (e.g. List / Grid / Compact view) | `Toggle Button` | `*ToggleButtonGroup` |

---

## Variants

Choose the variant by the action's emphasis level and consequence.

| Variant | When to use |
|---|---|
| **Primary** | The single most important action on a surface (e.g. Create, Save, Confirm) |
| **Secondary** | Supporting actions alongside a Primary (e.g. Cancel, Back, Export) |
| **Minimal** | Low-emphasis inline actions (e.g. "Add row", "Clear filters") — no background or border |
| **Emphasis** | Alternative primary-level action when blue-fill would clash with the surface; blue border + blue text |
| **Danger** | Destructive actions (e.g. Remove, Unlink, Delete, Revoke access) — pair with a confirmation dialog for irreversible actions |
| **AI Exclusive** | Actions within AI-powered surfaces only — gradient treatment reserved for AI contexts |

> Use at most one Primary button per surface area. When multiple actions exist, pair Primary + Secondary; demote others to Minimal or put them in a menu.

---

## Sizes

| Size | Height | Use when |
|---|---|---|
| M (default) | 40px (v3) / 32px (v2) | Standard UI — most buttons |
| S | 32px (v3) / 24px (v2) | Dense areas: filter panels, table controls, inline form actions |

Use consistent sizes within a group of buttons. Do not mix M and S buttons side-by-side unless one is clearly subordinate (e.g. a compact tertiary action next to a standard primary).

---

## Icon Configurations

| Configuration | When to use |
|---|---|
| Label only | Most common; clear text label is sufficient |
| Start icon + label | Reinforce meaning (e.g. a plus icon + "Create") |
| Label + end icon | Indicate direction or expansion (e.g. "More" + a chevron-down icon) |
| Start + end icon | Use sparingly — only when both icons add distinct meaning |
| Icon only | Tight spaces (toolbar, table row actions) where a label would not fit; always pair with a `Tooltip` for accessibility |

---

## Labels

| Rule | Example |
|---|---|
| Start with a verb for actions | "Delete campaign", "Export report", "Save changes" |
| Use a noun phrase for menu-opening triggers | `SplitButton` label "Export options" — not "Export now" when it opens choices |
| Describe the action, not the object | "Delete campaign" — not "Campaign deletion" |
| Be specific; avoid generic verbs | "Create campaign" — not "Submit" or "OK" |
| Never include interaction words | "Save changes" — not "Click to save" or "Press to save" |
| Sentence case only | "Save as draft" — not "Save As Draft" |
| 2–4 words; trim where possible | "Delete" when context is already clear |

> Icon-only buttons have no visible label — the `Tooltip` text serves as the label. Apply the same rules: verb-first, 2–4 words ("Delete campaign", not "Trash icon").

---

## Placement Patterns

Cross-component button placement — page-level actions, dialog/footer, filter panel, and the action-group gap (12px DS3 / 8px DS2) — is defined centrally: see [Placement patterns → Action buttons](../DESIGN-DS3.md#placement-patterns). Button-specific notes:

| Context | Button spec |
|---|---|
| Inline "add" inside a card | `Button` Minimal variant (DS3) — `TextButton` has no DS3 component |
| Multiple header actions | Overflow into icon-only Secondary M with tooltip |
| Toggle / view switcher | `ToggleButtonGroup` wrapping `ToggleButton` items |

---

## States

| State | Visual |
|---|---|
| Default | Variant fill at rest |
| Hover | `stateOverlay/hover` overlay |
| Pressed | `stateOverlay/pressed` overlay |
| Focused | `primary` focus ring, 2px offset (10px radius in DS3) — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled | `opacity: 0.5` |
| Loading | Spinner overlay; blocks double-submission |

> In Figma, loading is a separate `*Loading button` component. In the design system it is a loading state on the same `Button` — do not create a separate component for loading.

---

## Do's and Don'ts

**Do**
- Use a single Primary button per surface — it marks the recommended or most common action
- Keep buttons visually distinct from plain text and disabled controls so they read as clickable at a glance
- Apply variants and sizes consistently so the emphasis hierarchy reads the same across surfaces
- For irreversible Danger actions, require a confirmation `Dialog` — the button triggers the dialog, not the action directly
- Always add a `Tooltip` to icon-only buttons so the action is discoverable
- Show the loading state to prevent double-submission on async actions
- Use `ToggleButtonGroup` for mutually exclusive view switches instead of individual Buttons
- Keep a consistent action order across surfaces — Secondary (Cancel / Back) on the left, Primary on the right — so users build one muscle memory
- Align a button group to one shared edge with a uniform 8px gap so the cluster reads as a single action region
- Add a `Tooltip` to disabled buttons when there is a recoverable reason — tell users what is needed to enable it
- After a failed async action, clear the loading state and surface an error — never leave a stuck spinner

**Don't**
- Never place two Primary buttons side by side — promote one and demote the other
- Avoid styling a non-interactive label to look like a button, or a real button to look like plain text — it breaks what reads as clickable
- Avoid using Minimal buttons as primary actions — they do not draw enough attention
- Never use AI Exclusive variant outside of AI-powered surfaces
- Never use `TriggerButton` outside of AI/Copilot surfaces — it is exclusively reserved for those contexts
- Never create a separate loading component — use the built-in loading state
- Avoid mixing button sizes within the same horizontal button group unless one is visually subordinate
- Avoid scattering a surface's actions across separate corners — collect them into one aligned group so the eye finds them in a single place

---

## Anatomy

```
┌─────────────────────┐
│  [icon]  Label  [icon]  │
└─────────────────────┘
   ↑ start icon   ↑ end icon
```

Geometry — height (M/S), padding, radius, icon size, icon-to-label gap, focus ring, typography — is defined centrally: see DESIGN-DS3 [Component heights](../DESIGN-DS3.md#component-heights) · [Shapes](../DESIGN-DS3.md#shapes) · [`components.button-*`](../DESIGN-DS3.md) (DS2 in [DESIGN-DS2.md](../DESIGN-DS2.md); cross-version deltas in [DS3-vs-DS2.md](../DS3-vs-DS2.md)).

---

## Component Style Tokens

```yaml
# DS2  (from DESIGN-DS2.md → components)
button-primary:
  backgroundColor: "{colors.primary}"
  textColor: "{colors.text-white-hold}"
  rounded: "{rounded.sm}"
  height: 32px
  padding: 6px 12px
  typography: "{typography.headline5}"
button-primary-hover:
  backgroundColor: "{colors.primary-hover}"
button-primary-pressed:
  backgroundColor: "{colors.primary-pressed}"
button-secondary:
  backgroundColor: "{colors.surface-primary}"
  border: "1px solid {colors.border-general}"
  textColor: "{colors.text-med}"   # content/med (80%)
  rounded: "{rounded.sm}"
  height: 32px
  padding: 6px 12px
  typography: "{typography.headline5}"
button-secondary-hover:
  backgroundColor: "{colors.surface-tertiary}"
button-secondary-pressed:
  backgroundColor: "{colors.state-pressed-primary}"
button-emphasis:
  backgroundColor: "{colors.surface-primary}"
  border: "1px solid {colors.primary}"
  textColor: "{colors.primary}"
  rounded: "{rounded.sm}"
  height: 32px
  padding: 6px 12px
  typography: "{typography.headline5}"
button-emphasis-hover:
  backgroundColor: "{colors.surface-tertiary}"
  border: "1px solid {colors.primary-hover}"
button-emphasis-pressed:
  backgroundColor: "{colors.state-pressed-primary}"
  border: "1px solid {colors.primary-hover}"
button-danger:
  backgroundColor: "{colors.red-70}"
  textColor: "{colors.text-white-hold}"
  rounded: "{rounded.sm}"
  height: 32px
  padding: 6px 12px
  typography: "{typography.headline5}"
button-danger-hover:
  backgroundColor: "{colors.red-60}"
button-danger-pressed:
  backgroundColor: "{colors.red-50}"
button-small:
  height: 24px
```
```yaml
# DS3  (from DESIGN-DS3.md → components) — M (default): 40px height, 8px radius, 8px/16px padding
button-primary:
  backgroundColor: "{colors.primary}"
  textColor: "{colors.text-white-hold}"
  rounded: "8px"
  height: 40px
  padding: "8px 16px"
  typography: "{typography.headline5}"
button-primary-hover:
  backgroundColor: "{colors.primary-hover}"
button-primary-pressed:
  backgroundColor: "{colors.primary-pressed}"
button-secondary:
  backgroundColor: "{colors.surface-primary}"
  border: "1px solid {colors.border-general}"
  textColor: "{colors.text-med}"
  rounded: "8px"
  height: 40px
  padding: "8px 16px"
  typography: "{typography.headline5}"
button-secondary-hover:
  backgroundColor: "{colors.surface-tertiary}"
button-secondary-pressed:
  backgroundColor: "{colors.state-pressed-primary}"
button-emphasis:
  backgroundColor: "{colors.surface-primary}"
  border: "1px solid {colors.primary}"
  textColor: "{colors.primary}"
  rounded: "8px"
  height: 40px
  padding: "8px 16px"
  typography: "{typography.headline5}"
button-emphasis-hover:
  backgroundColor: "{colors.surface-tertiary}"
  border: "1px solid {colors.primary-hover}"
button-emphasis-pressed:
  backgroundColor: "{colors.state-pressed-primary}"
  border: "1px solid {colors.primary-hover}"
button-danger:
  backgroundColor: "{colors.red-70}"
  textColor: "{colors.text-white-hold}"
  rounded: "8px"
  height: 40px
  padding: "8px 16px"
  typography: "{typography.headline5}"
button-danger-hover:
  backgroundColor: "{colors.red-80}"
button-danger-pressed:
  backgroundColor: "{colors.red-90}"
button-small:                          # S (small): 32px height
  height: 32px
  padding: "6px 12px"
  rounded: "8px"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).
