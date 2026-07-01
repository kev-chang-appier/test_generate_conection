# Breadcrumb Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Breadcrumb`, `BreadcrumbItem`
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=14434-115790)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-49), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=14434-115790))  
**Storybook:** [Breadcrumb](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-breadcrumb--docs)

## Overview

`Breadcrumb` shows users where they are within a page hierarchy and lets them navigate back to ancestor pages. It lives in the left slot of the 48px header bar. Each ancestor crumb is a clickable link; the current page is plain non-interactive text. Make the last crumb editable when the page name is user-defined and should be changeable in place.

## Components at a Glance

| Component | When to use |
|---|---|
| `Breadcrumb` | Wraps all crumbs; controls size and separator |
| `BreadcrumbItem` | A single crumb — ancestor link, current page, or editable label |

## Placement Patterns

Breadcrumb sits exclusively in the left slot of the 48px header bar. Two contexts determine how many crumbs to show:

| Context | Pattern |
|---|---|
| Function page (no parent) | Current page label only — no ancestors, no separator |
| Drilldown page | Full path — ancestors as clickable links, current page as plain text |

## States

| State | Visual |
|---|---|
| Ancestor link (default) | `headline5`, `text-low`; shifts to `text-med` on hover |
| Current page | `headline5`, `text-high`, no interaction |
| Disabled crumb | `headline5`, `text-low`, no interaction |
| Editable crumb (view) | Inline label; click to enter edit mode |
| Editable crumb (active) | Inline text input; commits on blur or Enter |
| Separator | 20px directional-right icon, `text-low` |

## Do's and Don'ts

**Do**
- Make the final crumb non-interactive — it represents the current page
- Make only the last crumb editable; ancestors must always be links
- Provide a fallback name so the editable crumb recovers a meaningful label when the user clears it
- Keep crumb labels short; long paths truncate automatically

**Don't**
- Never place `Breadcrumb` outside the header bar — it is a header-specific navigation element
- Never skip levels in the hierarchy; the path must mirror the actual navigation structure
- Never use `Breadcrumb` for filtering or view switching — use `Filters` or `SegmentedControl` instead
- Never use `Breadcrumb` to indicate progress through a multi-step form — use `Stepper` instead
- Never leave an ancestor crumb without a destination when it should navigate — without one the crumb is not clickable even though it still reads as an ancestor (`text-low`) and shows a pointer cursor

## Anatomy

```
  ┌──────────────────────────────────────────────────────┐  48px header bar
  │  Settings  ▶  Campaigns  ▶  AIQUA Push               │
  └──────────────────────────────────────────────────────┘
       ↑             ↑               ↑
    ancestor      separator       current page
    link (text-low) (text-low)  (text-high, no link)
```

| Property | Value |
|---|---|
| Item gap | 8px |
| Separator icon size | 20px |
| Font style | `headline5` |
| Ancestor link color | `text-low` (`text-med` on hover) |
| Current page color | `text-high` |
| Separator color | `text-low` |

## Behavior Notes

- Crumb height follows the normal size by default, matching the 48px header bar; the separator icon can be overridden, though this is rarely needed.
- An ancestor crumb reads as a link only when given a destination; the current/last crumb is plain text.
- Make the last crumb non-interactive for the current page, or editable to turn its label into an inline input. Provide a fallback name to restore when the user clears it; the rename commits on blur or Enter, and the label can be validated live as the user types.
- Paths longer than 4 crumbs truncate automatically (middle crumbs collapse to `…`).

## Component Style Tokens

```yaml
# DS2  (Breadcrumb is DS2-only — there is no v3 implementation)
breadcrumb-ancestor:
  textColor: "{colors.text-low}"
  typography: "{typography.headline5}"           # SMALL headline6 / LARGE headline4
breadcrumb-ancestor-hover:
  textColor: "{colors.text-med}"
breadcrumb-ancestor-pressed:
  textColor: "{colors.text-high}"
breadcrumb-current:
  textColor: "{colors.text-high}"
  typography: "{typography.headline5}"
breadcrumb-separator:
  textColor: "{colors.text-low}"                 # 20px directional-right icon, 8px side margin
```
```yaml
# DS3  (no v3 implementation — values mirror DS2; compose from Link if a DS3 crumb is needed)
breadcrumb-ancestor:
  textColor: "{colors.text-low}"
  typography: "{typography.headline5}"           # SMALL headline6 / LARGE headline4
breadcrumb-ancestor-hover:
  textColor: "{colors.text-med}"
breadcrumb-ancestor-pressed:
  textColor: "{colors.text-high}"
breadcrumb-current:
  textColor: "{colors.text-high}"
  typography: "{typography.headline5}"
breadcrumb-separator:
  textColor: "{colors.text-low}"                 # 20px directional-right icon, 8px side margin
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

`Breadcrumb` and `BreadcrumbItem` are DS2-only — there is no DS3 Storybook equivalent; if a v3 breadcrumb is needed, compose it from `Link` components. Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
