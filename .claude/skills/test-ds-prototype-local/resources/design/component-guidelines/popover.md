# Popover Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Popover`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63520-22894)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-67), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=47853-25439))  
**Storybook:** [Popover](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-popover--docs)

---

## Overview

`Popover` shows users rich contextual content that supplements the current view without requiring a response, in a floating panel anchored to a trigger element. Non-modal — dismisses when the user clicks outside.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `Popover` | Rich supplementary content anchored to a trigger — custom dropdown panels, date pickers, color pickers, inline filters; auto-dismisses on outside click |

---

## States

| State | Visual |
|---|---|
| Closed | Not shown |
| Open | Panel anchored to the trigger, offset 4px; the panel itself sets only `text-high`, while `surface/popover` fill, `border-popover` border, and Shadow M are supplied by the consumer |
| Dismissing | Closes on outside click or Escape |

---

## Do's and Don'ts

**Do**
- Use `border-popover` for Popover borders — it is slightly lighter than `border-general`
- Use Shadow M to distinguish the Popover from page content
- Allow Popovers to auto-flip position when near viewport edges
- Anchor the panel to the trigger element so outside clicks and Escape reliably dismiss it
- Give the trigger a clearly interactive treatment (button, chevron, or hover affordance) — a Popover anchored to plain text or a bare icon reads as static
- When the panel ends in an action row, keep one primary action placed rightmost — see [Placement patterns → Action buttons](../DESIGN-DS3.md#placement-patterns)

**Don't**
- Never anchor a Popover to an element that looks like body text or static UI — the user has no cue the panel can be opened
- Avoid opening a Popover on hover when it contains buttons or inputs — hover-opened content the user must act on is easily dismissed by accident; open it on click instead
- Never use Popover for critical confirmations — use `Dialog`
- Never use Popover for short text hints — use `Tooltip`
- Never apply the modal backdrop (`surface/mask`) to Popovers
- Avoid giving a Popover's action row two primary buttons — promote one action and downgrade the rest so the panel has a single clear commit

---

## Anatomy

```
          ┌──────────────────┐
  Trigger │  Popover content │  ← Shadow M, border-popover, rounded panel
  button  │                  │
          │  [actions]       │
          └──────────────────┘
```

---

## Component Style Tokens

```yaml
# DS2  (single shared Popover component — no dedicated DS3 variant)
popover:
  textColor: "{colors.text-high}"               # text-high — the only style the panel itself sets
  offset: 4px                                   # gap between trigger and panel
  # The panel surface, border, radius, and Shadow M are supplied by the consumer.
  # The optional anchor arrow is a 4px rotated square, rounded 1px, with
  # surface/popover fill and a 1px border-popover border:
popover-arrow:
  backgroundColor: "{colors.surface-popover}"   # surface/popover
  border: "1px solid {colors.border-popover}"   # slightly lighter than border-general
  rounded: 1px
  size: 4px                                      # rotated 45° → diagonal ~5.7px
```
```yaml
# DS3  (same component as DS2; no dedicated DS3 Popover variant)
popover:
  textColor: "{colors.text-high}"               # text-high — the only style the panel itself sets
  offset: 4px                                   # gap between trigger and panel
  # The panel surface, border, radius, and Shadow M are supplied by the consumer.
  # The optional anchor arrow is a 4px rotated square, rounded 1px, with
  # surface/popover fill and a 1px border-popover border:
popover-arrow:
  backgroundColor: "{colors.surface-popover}"   # surface/popover
  border: "1px solid {colors.border-popover}"   # slightly lighter than border-general
  rounded: 1px
  size: 4px                                      # rotated 45° → diagonal ~5.7px
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md). There is no dedicated DS3 `Popover` variant — use the v2 component or a custom anchored-panel implementation.
