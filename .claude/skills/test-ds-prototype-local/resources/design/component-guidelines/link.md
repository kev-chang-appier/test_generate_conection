# Link Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Link`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=7502-45731)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-64), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=7502-45731))  
**Storybook:** [Link](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-link--docs)

## Overview

`Link` takes users to a URL or in-app route, with standardized typographic sizing and color. When the intended action changes state (submit, delete, open a dialog), use `Button` instead — links are for going somewhere, not doing something.

## Components at a Glance

| Style | Size | When to use |
|---|---|---|
| Small | 12px | Inline within dense UI — table cells, hint text, footnotes |
| Medium | 14px | Standard body context — form helpers, card footers, supporting copy |
| Large | 14px (`headline-5`, 600 weight) | Prominent standalone links, section-level navigation |

## States

| State | Visual |
|---|---|
| Default | `primary` text, no underline |
| Hover | `primary-pressed` text, underline appears |
| Active | `primary-hover` text, underline |
| Disabled | `primary` text dimmed to 50% opacity, no underline on hover, no interaction |

## Do's and Don'ts

**Do**
- Use `Link` for navigation to a URL, route, or anchor
- Open external URLs in a new tab for safety
- Match the link size to the surrounding text size — a small link in a medium-density layout looks undersized
- Write link text that names the destination: "View report", "Go to settings" — avoid "click here" or "learn more" without context

**Don't**
- Never use `Link` to trigger an action — use a minimal `Button` instead
- Avoid disabling a link that should not be visible — prefer hiding it; a disabled link with no explanation is confusing
- Avoid wrapping a full paragraph in `Link` — keep linked text short and specific
- Never nest `Link` inside another interactive element (button, clickable card) — overlapping interaction targets break keyboard and screen-reader behavior
- Never override `primary` to match surrounding body text — color is the only resting cue that a `Link` is interactive, since the underline appears on hover only

## Anatomy

```
  View documentation          ← link text (medium size)
  ──────────────────          ← underline on hover
```

## Component Style Tokens

```yaml
# DS2  (Link shares one component across versions; DS3 only thickens the hover underline)
link:
  textColor: "{colors.primary}"            # text-blue-normal; no underline at rest
  typography: "{typography.body2}"         # linkStyle small (default)
link-medium:
  typography: "{typography.body1}"         # linkStyle medium
link-large:
  typography: "{typography.headline5}"     # linkStyle large
link-hover:
  textColor: "{colors.primary-pressed}"    # text-blue-pressed + underline appears
link-active:
  textColor: "{colors.primary-hover}"      # text-blue-hover + underline
link-disabled:
  textColor: "{colors.primary}"            # resting color held; dimmed to 50% opacity, no interaction
```
```yaml
# DS3
link:
  textColor: "{colors.primary}"            # text-blue-normal; no underline at rest
  typography: "{typography.body2}"         # linkStyle small (default)
link-medium:
  typography: "{typography.body1}"         # linkStyle medium
link-large:
  typography: "{typography.headline5}"     # linkStyle large
link-hover:
  textColor: "{colors.primary-pressed}"    # text-blue-pressed + 1.2px underline
link-active:
  textColor: "{colors.primary-hover}"      # text-blue-hover + underline
link-disabled:
  textColor: "{colors.primary}"            # resting color held; dimmed to 50% opacity, no interaction
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).
