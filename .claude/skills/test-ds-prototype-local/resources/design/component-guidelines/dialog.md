# Dialog Usage Guidelines

**Last updated:** 2026-06-30

**Components:** `Dialog`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63503-181036)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-59), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=8490-95678))  
**Storybook:** [Dialog](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-dialog--docs)  
**Writing style:** [Appier UX Writing Style Guide — Dialogue](https://docs.google.com/spreadsheets/d/1Xy-CrfQ7ik_hFMdIhlSIM_xb3xkYtT_Ok5L1PsQl02U/edit?gid=0#gid=0)

---

## Overview

`Dialog` blocks all page interaction until the user responds, presenting a modal overlay. Use for confirmations, alerts, and required form inputs that must be completed before anything else can proceed.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `Dialog` | Confirmations, alerts, and short required forms that must block the page until resolved |

---

## When to Use

- Asking the user to confirm a destructive or irreversible action
- Capturing a required form input before continuing — only when the form is short (≤ 4 fields), single-purpose, and completing it is a prerequisite for the next action (e.g. rename, create). For longer or multi-section forms, use `Drawer` instead.
- Displaying a critical alert that demands acknowledgement
- Presenting settings — unless the settings require drilldown navigation, in which case use inline expand or an overlay UI instead.

---

## Footer Labels

The confirm button label should name the specific action, not just acknowledge the dialog.

| Scenario | Confirm label | Cancel label |
|---|---|---|
| Destructive action | "Delete" / "Remove" / "Revoke" | "Cancel" |
| Form submit | "Save" / "Create" / "Rename" | "Cancel" |
| Alert acknowledgement | "Got it" | — (single button) |

> Match the confirm label to the verb in the dialog title: a "Delete campaign" dialog gets a "Delete" button, not "Confirm". Avoid "OK", "Yes", and "Submit" — they tell users nothing about what they are agreeing to.

---

## States

| State | Visual |
|---|---|
| Open | Full backdrop `surface/mask`; dialog **centered in the viewport on both axes** (never top-anchored); focus trapped inside |
| Scrolling content | The body scrolls inside a fixed `max-height` (`calc(100vh - 120px)`); header and footer remain fixed. The header-bottom and footer-top dividers are **scroll shadows** — shown only while the body is scrollable, and absent when all content fits |
| Loading (footer) | Footer buttons disabled; confirm button shows a loading spinner |
| Error | Inline error message in content area — dialog stays open |

---

## Do's and Don'ts

**Do**
- Trap focus inside `Dialog` — users must be able to navigate all interactive elements by keyboard before dismissing
- Place a close button (×) in the header only when the dialog has no footer
- Set a fixed height when content can grow — the content area scrolls; never let the dialog overflow the viewport
- Title dialogs with a verb phrase that names the action ("Delete campaign", "Rename audience") — not "Confirm" or "Are you sure?"
- Warn before discarding unsaved form changes — prompt a secondary confirmation when the user cancels or closes
- Pick the narrowest width that fits the content without crowding
- Give the confirm button the Danger variant when the action is destructive, so the emphasis matches the consequence
- Lead a confirmation/alert with a severity icon when it helps — render it **32×32 with no tinted background/circle** (just the glyph, top-aligned with the first body line), using the **Solid** variant at that severity's own **semantic color**: warning = orange (`semantic-orange`), error/danger = red (`semantic-red`), caution = yellow. The glyph and its color must share one semantic — never tint a warning glyph red. The confirm *button* keeps its own semantic (Danger = red) regardless of the icon
- Keep exactly one primary action in the footer, placed rightmost after Cancel, so action hierarchy reads the same across every dialog
- Place related settings near each other — adjacent in reading order, and on a shared row or inset sub-section when they are short peers (e.g. Status + Type, Start + End date) — rather than one rigid column with equal spacing. Keep a clear top-to-bottom reading path: the primary identifier first and full-width, long/multi-line fields full-width, no more than two fields per row

**Don't**
- Avoid using `Dialog` for forms longer than 4 fields or with multiple sections — use `Drawer` instead
- Avoid using "Confirm" as a dialog title — it tells users nothing about what they are confirming
- Avoid nesting a `Dialog` inside a `Drawer` unless unavoidable (e.g. a confirmation before a destructive action)
- Never give two footer buttons the primary variant — promote one action and set the other to secondary
- Avoid spreading form fields down one rigid column with equal spacing, or pairing unrelated fields on a row — group by relatedness and keep a clear top-to-bottom reading path
- Never anchor the dialog to the top of the viewport, and never tint a severity glyph with another severity's color (e.g. a warning glyph in red)

---

## Anatomy

```
┌────────────────────────────────┐  ← backdrop rgba(0,10,58,0.30)
│                                │
│  ┌──────────────────────────┐  │
│  │  Title              [×]  │  │  ← header: 48px, title + close icon
│  ├──────────────────────────┤  │
│  │                          │  │
│  │  Content area            │  │  ← scrollable, 24px padding
│  │                          │  │
│  ├──────────────────────────┤  │
│  │         [Cancel] [Save]  │  │  ← footer: 56px, buttons right-aligned
│  └──────────────────────────┘  │
│                                │
└────────────────────────────────┘
```

| Zone | Height | Notes |
|---|---|---|
| Header | 48px | Title (`headline` level) + close icon (20px) |
| Content | Variable | Scrollable; 24px padding on all sides |
| Footer | 56px | Secondary M (Cancel) + Primary M (Confirm) — see [Placement patterns → Action buttons](../DESIGN-DS3.md#placement-patterns) |

**Width:** one of the fixed sizes — 400, 600, 800, 1000, 1200 px — or full width.

---

## Component Style Tokens

```yaml
# DS2  (from DESIGN-DS2.md → components)
dialog:
  backgroundColor: "{colors.surface-primary}"
  rounded: "{rounded.md}"
  padding: 24px
```
```yaml
# DS3  (from DESIGN-DS3.md → components) — 16px radius
dialog:
  backgroundColor: "{colors.surface-primary}"
  rounded: "16px"
  padding: 24px
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).
