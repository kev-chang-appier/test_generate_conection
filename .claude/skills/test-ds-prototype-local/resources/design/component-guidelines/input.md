# Input Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `TextInput`, `Textarea`, `AffixInput`, `QuantityInput`, `StepperInput`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=72852-4467)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-62), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=2804-102149))  
**Storybook:** [Input](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-input-textinput--docs)

---

## Overview

The input family lets users enter free-form text and numeric values. Choose a variant based on the content type and constraints expected — not by visual preference. All variants share the same height, border, radius, and state tokens.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `TextInput` | Single-line text: names, email, URL, search, short values |
| `Textarea` | Multi-line text: comments, descriptions, messages |
| `AffixInput` | Text with a static prefix or suffix label (e.g. $, https://, .com) |
| `QuantityInput` | Numeric entry with up/down arrow (caret) controls and an optional unit |
| `StepperInput` | Numeric entry with minus/plus operator-button controls; minimal variant of `QuantityInput` |

---

## Label & Required Fields

- Every input must have an accessible name — use a visible label by default.
- Omit the visible label only when surrounding context makes it redundant (e.g. a single input inside a dialog whose title already names the field). In that case, link the input to the heading so screen readers still get the name.
- Mark required fields with a `*` after the label — `semantic-red` in DS2, `text-high` in DS3.
- Use helper text below the field for format hints or character limits.
- Show error text only after the user has interacted with the field (on blur or submit).

---

## Trailing content

The field can host trailing content inside its wrapper — typically a character counter, emoji picker, or AI suggestion button. These elements must not steal focus from the input.

---

## States

All input variants share the same state system:

| State | Visual |
|---|---|
| Default | 1px `border-general` border, `surface-primary` background |
| Focused | `primary` focus outline — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Hover | Subtle border darkening |
| Filled | `text-high` value color |
| Disabled | Field dimmed; label remains at full opacity |
| Error | Error string shown below in `semantic-red`; border may highlight red |
| Summary | Read-only display on `TextInput` in the summary state |

> Placeholder text uses `text-low-minus` — do not use placeholder as a substitute for the label.

---

## Form Layout

How fields are arranged across a form is as important as how each field is configured. Form structure — single-column layout, label–field gap, control spacing, grouping, and the single-primary-action rule — is defined centrally: see DESIGN-DS3 [Layout](../DESIGN-DS3.md#layout) and [Placement patterns](../DESIGN-DS3.md#placement-patterns). Input-specific guidance:

- **Reserve side-by-side fields for values read as a unit** (e.g. start / end date, city / postal code); otherwise keep one field per row.
- **Order by task flow.** Sequence fields the way the user thinks through the task, not by data-model order; put the most important or identifying field first.

---

## Do's and Don'ts

**Do**
- Use `TextInput` for single-line values and `Textarea` for multi-line — never swap them for a field type
- Always give an input an accessible name — use a visible label by default; rely on surrounding context (e.g. a dialog title) only when it already names the field
- Use helper text for format or constraint guidance; show errors only after interaction
- Use `AffixInput` for units with static context (currency, URL parts, physical units)
- Use `QuantityInput` when the user needs to increment/decrement a bounded numeric value
- Set a minimum and maximum number of rows on `Textarea` to give users an expectation of size
- Use the one-line layout on `Textarea` for compact form areas where vertical space matters
- Write error messages that tell users how to fix the problem ("Must include @ and a domain", not "Invalid email")
- Validate progressively — show format and required-field errors on blur; always re-validate on submit
- Order fields by task flow; for overall form structure see [Layout](../DESIGN-DS3.md#layout) and [Placement patterns](../DESIGN-DS3.md#placement-patterns)

**Don't**
- Never use placeholder text as a replacement for a label
- Never place a multi-column field grid where fields are unrelated — the eye loses the single scan path; reserve side-by-side fields for values read as a unit
- Avoid spacing fields uniformly so groups blur together — tighten spacing within a group and widen it between groups
- Avoid scattering form actions between fields — collect them into one action row at the end or in the page header bar
- Never put interactive elements (buttons, links) inside `AffixInput` affixes — use a trailing icon on `TextInput` instead
- Never apply the disabled state to both label and field — the label should remain at full opacity
- Avoid showing the error state before the user has attempted to fill the field
- Never use `StepperInput` for non-numeric or free-text entry
- Avoid writing error messages that blame the user or repeat what the label already says — describe the fix, not the fault
- Avoid using the summary state on `TextInput` where users expect to edit — it reads as static text and hides the field affordance; reserve it for confirmed read-only displays
- Avoid placeholders phrased as instructions ("Type your campaign name here") — use a short example or noun prompt ("Q4 retargeting") with no interaction words

---

## Anatomy

### Stacked (with label) — most common

```
  Campaign name *                ← label (headline5)
  ┌──────────────────────────┐   ← label–field gap
  │ [icon]  Placeholder...   │   ← field
  └──────────────────────────┘
  Hint text                      ← hint (body2)
```

### Inline (no label) — dialogs, table cells

```
  ┌──────────────────────────┐
  │  Placeholder...          │   ← field
  └──────────────────────────┘
```

Zone roles, top to bottom: label (`headline5`), label–field gap, field (`body1` value, `border-general` border), hint/error (`body2`, error in `semantic-red`). Field height, gap, padding, and radius are defined centrally — see DESIGN-DS3 [Component heights](../DESIGN-DS3.md#component-heights) · [Shapes](../DESIGN-DS3.md#shapes).

---

## TextInput

Single-line free-text entry. The default input for most form fields. Use the small padding option only in dense areas where field height matters.

---

## Textarea

Multi-line text entry. Auto-expands between a minimum and maximum number of rows; the one-line layout collapses it to one row when empty and expands on focus for compact form areas.

---

## AffixInput

Text input with a static prefix and/or suffix label. Use for values that always have a unit or format context. Affixes are **display-only** — do not put interactive controls inside an affix; place them as a trailing icon on `TextInput` instead.

---

## QuantityInput

Numeric entry with built-in up/down arrow (caret) controls and an optional unit label.

---

## StepperInput

Minimal numeric input with `－`/`＋` operator buttons (minus left, plus right). Use when a compact ± control fits better than QuantityInput's arrow carets.

---

## Component Style Tokens

```yaml
# DS2  (from DESIGN-DS2.md → components)
input:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"
  rounded: "{rounded.sm}"
  height: 32px
  height-tall: 56px
  padding: 6px 12px                              # field inset (incl. 1px border); CSS padding is 1px less per side
  typography: "{typography.body1}"
input-placeholder:
  textColor: "{colors.text-low-minus}"
```
```yaml
# DS3  (from DESIGN-DS3.md → components) — 40px inline / 68px stacked
input:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"
  rounded: "8px"
  height: 40px
  height-tall: 68px
  padding: "10px 16px"                           # field inset (incl. 1px border); CSS padding is 1px less per side
  typography: "{typography.body1}"
input-placeholder:
  textColor: "{colors.text-low-minus}"
input-height-default: 40px
input-height-stacked: 68px
input-radius:         radius-8
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).
