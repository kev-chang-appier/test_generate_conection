# Tooltip Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Tooltip`, `IconTooltip`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63849-52743)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-83), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=16467-128067))  
**Storybook:** [Tooltip](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-tooltip-tooltip--docs)

---

## Overview

A tooltip shows users supplementary, non-critical information when they hover an element. It appears as a floating label anchored to its trigger. `IconTooltip` is a pre-packaged variant that pairs an info icon with a tooltip — use it instead of manually wrapping `Tooltip` around an icon.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `Tooltip` | Contextual help attached to any interactive element |
| `IconTooltip` | Standalone info/help icon that carries its own tooltip |

---

## States

| State | Visual |
|---|---|
| Hidden (default) | No panel rendered |
| Visible | Floating panel, Shadow M, `border-popover`, rounded panel |

---

## Do's and Don'ts

**Do**
- Use `Tooltip` for supplementary help that the user can safely ignore
- Use `IconTooltip` instead of manually wrapping an icon in `Tooltip`
- Add a short open delay (300–500 ms) to avoid flashing on quick mouse-overs
- Allow tooltips to reflow to an alternate side so they don't clip at viewport edges
- Drive tooltip visibility from app state when it must stay in sync with other UI

**Don't**
- Never use `Tooltip` for content the user must read to complete the task — use `Hint` instead
- Never use `Tooltip` on mobile-only interfaces — hover is unavailable on touch devices
- Never put interactive elements inside a tooltip — they are not keyboard-reachable

---

## Anatomy

```
  ┌──────────────────────┐  ← Shadow M, border-popover, rounded panel
  │  Title               │  ← optional, headline6
  │  Body content text   │  ← body2
  └──────────┬───────────┘
             ▼                ← arrow pointing to trigger element
         [Trigger]
```

---

## Tooltip

Defaults to appearing below its trigger, reflowing to an alternate side so it doesn't clip at a viewport edge. Add a short open delay (300–500 ms) to avoid flashing on quick mouse-overs, and drive visibility from app state when it must stay in sync with other UI.

---

## IconTooltip

A pre-packaged info/help icon with tooltip. Prefer over manually wrapping an icon in `Tooltip`. It carries the same behavior as `Tooltip` but appears above its trigger by default. Match its size to the surrounding icon scale (e.g. 20px); the icon color defaults to `text-low` for decorative context.

---

## Component Style Tokens

```yaml
# DS2  (Tooltip shares one component; DS3 only enlarges radius and padding)
tooltip:
  backgroundColor: "{colors.surface-popover}"
  textColor: "{colors.text-high}"            # text-high
  border: "1px solid {colors.border-popover}"
  rounded: "{rounded.sm}"                     # rounded-radius-4
  padding: 4px 8px
tooltip-title:
  typography: "{typography.headline6}"
tooltip-body:
  typography: "{typography.body2}"
```
```yaml
# DS3
tooltip:
  backgroundColor: "{colors.surface-popover}"
  textColor: "{colors.text-high}"            # text-high
  border: "1px solid {colors.border-popover}"
  rounded: "radius-8"                         # rounded-radius-8
  padding: 12px                               # 8px left when withInfoIcon
tooltip-title:
  typography: "{typography.headline6}"
tooltip-body:
  typography: "{typography.body2}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md). API and props are unchanged between versions.
