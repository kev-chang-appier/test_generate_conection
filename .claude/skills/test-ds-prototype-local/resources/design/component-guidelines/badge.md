# Badge Usage Guidelines

**Last updated:** 2026-06-30

**Components:** `Badge`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63709-16517)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-48), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=7576-43310))  
**Storybook:** [Badge](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-badge--docs)

---

## Overview

`Badge` is a compact inline label for statuses, categories, and counts. Three variants cover distinct jobs: text for labels and statuses, number for counts and notifications, and AI for AI-powered features. Control emphasis with the color style — the default subtle tint stays in the background; the solid style demands attention.

---

## Components at a Glance

| Component | Variant | When to use |
|---|---|---|
| `Badge` | text | Status labels, category tags, feature flags |
| `Badge` | number | Unread counts, notification dots, quantity indicators |
| `Badge` | AI | Mark a feature or result as AI-generated |

---

## States

| State | Visual |
|---|---|
| Default | Tinted background + colored text |
| Solid | Full-color background + white text |
| AI (light) | Gradient fill (brand purple/blue) |
| AI (dark) | Adjusted gradient for dark theme |

---

## Do's and Don'ts

**Do**
- Match color to semantic meaning — success for live/active, error for failed/blocked, warning for degraded/pending, info for neutral status
- Use small size inside table cells or dense lists to avoid disrupting row height
- Use the AI variant exclusively for AI-generated content — don't repurpose it as a decorative color
- Add a leading label when the badge alone doesn't carry enough context (e.g. "Status" beside "Active")
- Keep one status term across the app — pick "Active" or "Live" and reuse it with the same color everywhere, so a status reads the same on every surface

**Don't**
- Avoid using the solid style for every badge on a page — reserve it for one or two critical statuses that need to stand out
- Never use `Badge` as a substitute for `Tag` when the user needs to interact with or remove the item; `Tag` has a remove action, `Badge` does not
- Avoid putting long sentences in a badge — badges are for short labels (1–3 words) or numbers. Wrap longer text in a `Tooltip` instead.
- Never use the AI variant in dark mode without the dark theme — the gradient will not adapt correctly

---

## Anatomy

```
  ┌───────────────────┐
  │  ● content text   │   ← pill shape; background = semantic color tint (default) or solid
  └───────────────────┘
      ↑ border radius: text/AI badge = `radius-4` (DS3) / `rounded.xs` 2px (DS2); number variant = `radius-full`
  
  With label:
  Label text  ┌─────────┐
              │ content │   ← label renders to the left of the pill
              └─────────┘
```

Badge geometry — heights (small / medium / large), horizontal padding, radius (text/AI = `radius-4` in DS3 / `rounded.xs` 2px in DS2, number = `radius-full`), and typography — is defined centrally. See DESIGN-DS3 [Shapes](../DESIGN-DS3.md#shapes) · [Typography](../DESIGN-DS3.md#typography) (DS2 values in [DESIGN-DS2.md](../DESIGN-DS2.md)). Note: DS3 adds a `large` size; DS2 has `small` / `medium` only.

---

## Component Style Tokens

```yaml
# DS2
# Badge (text variant) — tinted semantic background + matching AA-safe semantic-text-* foreground;
# radius-2 (number variant uses a full pill). Pair each tint with its same-hue text token. These pull
# the foundational semantic-bg-* / semantic-text-* pairs directly (DS2 has no named status-badge group).
# NOTE: a record's *status* in DS2 is the Status component (semantic dot + text-high label, NO tint) —
# see status.md. This tinted Badge is for general labels/categories, not the DS2 status indicator.
badge:
  rounded: "{rounded.xs}"
badge-success:
  backgroundColor: "{colors.semantic-bg-green}"
  textColor: "{colors.semantic-text-green}"
badge-error:
  backgroundColor: "{colors.semantic-bg-red}"
  textColor: "{colors.semantic-text-red}"
badge-warning:
  backgroundColor: "{colors.semantic-bg-orange}"
  textColor: "{colors.semantic-text-orange}"
badge-info:
  backgroundColor: "{colors.semantic-bg-azure}"
  textColor: "{colors.semantic-text-azure}"
```
```yaml
# DS3  (from DESIGN-DS3.md → components)
# Status badge — tinted semantic background + matching AA-safe semantic-text-* foreground;
# radius-4 text badge (number variant uses a full pill). Pair each tint with its same-hue text token.
status-badge:
  rounded: "4px"
status-badge-success:
  backgroundColor: "{colors.semantic-bg-green}"
  textColor: "{colors.semantic-text-green}"
status-badge-error:
  backgroundColor: "{colors.semantic-bg-red}"
  textColor: "{colors.semantic-text-red}"
status-badge-warning:
  backgroundColor: "{colors.semantic-bg-orange}"
  textColor: "{colors.semantic-text-orange}"
status-badge-info:
  backgroundColor: "{colors.semantic-bg-azure}"
  textColor: "{colors.semantic-text-azure}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Always pair each semantic foreground with its matching background tint. The `number` variant uses a full pill (`radius-full`); text/AI badges use the radius above. DS3 adds a `large` size; DS2 has `small` / `medium` only. Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
