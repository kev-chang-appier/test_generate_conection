# Hint Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Hint`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63849-42211)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-61), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=10150-88695))  
**Storybook:** [Hint](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-hint--docs)

---

## Overview

A hint gives users guidance, status, or warnings they need to see before or during a task. It renders as a persistent inline alert in the document flow and stays visible until dismissed. Unlike `Toast`, which delivers post-action transient feedback, it does not disappear on its own — use `Toast` for that.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `Hint` | Inline contextual guidance, status, or warnings that persist on the page |

---

## Severity Levels

Each severity pairs a foreground token with its matching background token — see [Colors](../DESIGN-DS3.md#colors).

| Severity | Icon | Foreground / background | Use when |
|---|---|---|---|
| Success | Check | `semantic-green` / `semantic-bg-green` | Operation completed in-context |
| Info | Info | `semantic-azure` / `semantic-bg-azure` | Neutral informational note |
| Warning | Triangle | `semantic-orange` / `semantic-bg-orange` | Potential issue the user should address |
| Error | Cross | `semantic-red` / `semantic-bg-red` | Something failed or is invalid |
| Info (secondary) | Info | `semantic-gray` / `surface-card` | Low-emphasis contextual note |

---

## States

| State | Visual |
|---|---|
| Visible | Full-width panel with semantic icon, primary text, optional secondary text, optional action button, optional × |
| Dismissed | Component removed from layout |

---

## Do's and Don'ts

**Do**
- Use `Hint` for guidance the user needs before or during a task
- Use the warning or error severity for conditions the user must resolve, including form-level validation errors after submission
- When the hint carries an action button, ensure it directly resolves the condition described in the primary text
- Label the action verb-first and specific to the fix ("Increase budget", "Retry upload") — not "OK" or "Got it"
- Make a hint non-dismissable only when dismissing it would cause the user to miss a blocking condition

**Don't**
- Avoid using `Hint` for transient success or completion feedback — use `Toast` instead
- Never use `Hint` for decisions that require user input — use `Dialog`
- Avoid making a purely informational hint non-closable
- Avoid stacking hints of the same purpose — if multiple hints address the same condition, consolidate into one. Two hints with distinct purposes (e.g. a proactive form warning alongside a submission error) may coexist.

---

## Anatomy

```
  ┌─────────────────────────────────────────────────────┐
  │  [icon]  Primary text (bold)              [Action]  │  ← uniform padding
  │          Secondary text (regular)            [×]   │  ← optional close
  └─────────────────────────────────────────────────────┘
```

---

## Component Style Tokens

Hint shares one implementation across versions; only the inset padding grows in DS3. Each severity swaps the border, background, and leading-icon color as a unit (see Severity Levels). Base plus the warning delta are shown as a representative recipe.

```yaml
# DS2
hint:
  border: "0.5px solid transparent"   # per-type border color applied below
  rounded: "{rounded.md}"            # rounded-radius-8
  padding: 12px                      # p-spacing-12
hint-primary-text:
  textColor: "{colors.text-high}"
  typography: "{typography.headline5}"
hint-secondary-text:
  textColor: "{colors.text-high}"
  typography: "{typography.body1}"
hint-warning:                        # per-type delta (icon shares the border color)
  border: "0.5px solid {colors.semantic-orange}"
  backgroundColor: "{colors.semantic-bg-orange}"
  textColor: "{colors.semantic-orange}"   # leading icon
```
```yaml
# DS3
hint:
  border: "0.5px solid transparent"
  rounded: "radius-8"                # rounded-radius-8
  padding: 16px                      # p-spacing-16
hint-primary-text:
  textColor: "{colors.text-high}"
  typography: "{typography.headline5}"
hint-secondary-text:
  textColor: "{colors.text-high}"
  typography: "{typography.body1}"
hint-warning:
  border: "0.5px solid {colors.semantic-orange}"
  backgroundColor: "{colors.semantic-bg-orange}"
  textColor: "{colors.semantic-orange}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md). API and props are unchanged between DS2 and DS3.
