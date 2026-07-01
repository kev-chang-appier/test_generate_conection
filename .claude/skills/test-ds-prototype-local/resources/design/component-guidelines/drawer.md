# Drawer Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Drawer`, `AbsoluteDrawerContainer`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=70517-247)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=23893-28913))  
**Storybook:** [Drawer](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-drawer--docs)

---

## Overview

`Drawer` lets users work on a detail or form while keeping the underlying page visible, sliding in as a side panel from the screen edge. Use when the user needs page context while working — a longer-lived workspace compared to a modal Dialog.

---

## Components at a Glance

| Variant | Backdrop | When to use |
|---|---|---|
| Modal (default) | Yes | The user must complete the panel task before returning to the page |
| Non-modal | No | The user can interact with both the panel and the page simultaneously |

---

## Drawer vs Dialog

- Use `Drawer` when the content is too long for a `Dialog`, or when the user needs to see the page beneath while working in the panel (e.g. editing campaign details while seeing the campaign list).
- Use `Dialog` when the action is modal by nature — a decision the user must make before anything else.

---

## States

| State | Visual |
|---|---|
| Open (modal) | Panel visible, backdrop `surface/mask`, page interaction blocked |
| Open (non-modal) | Panel visible, no backdrop, page remains interactive |
| Scrolling content | Header remains fixed; only the content area scrolls |

---

## Do's and Don'ts

**Do**
- Always include a close button (×) in the Drawer header
- Use a non-modal Drawer when the user needs to reference the page while working in the panel
- Keep one primary button in the footer, placed rightmost — see [Placement patterns → Action buttons](../DESIGN-DS3.md#placement-patterns)
- Write the title as a concise noun phrase naming the workspace ("Audience details", "Campaign settings") — not a verb phrase or a restated page heading
- Divide a long panel form into named sections so the eye groups related fields, rather than presenting one uniform stack from header to footer
- Keep the footer visually distinct from scrolling content so the commit action stays anchored as the user scrolls

**Don't**
- Never nest a Drawer inside a `Dialog`; stack a `Dialog` over a Drawer only for an unavoidable confirmation (e.g. before a destructive action)
- Avoid spacing every field in the panel equally so sections blur together — tighten spacing within a section and widen it between sections
- Never apply the modal backdrop (`surface/mask`) to non-modal Drawers
- Avoid disabling the close button without an explicit product reason
- Avoid using a Drawer when a modal decision is required — use `Dialog` instead
- Never give two footer buttons the primary emphasis — promote the commit action and make the other secondary

---

## Anatomy

```
┌────────┬──────────────────────┐
│        │  Panel title    [×]  │  ← panel header (48px)
│  Page  │                      │
│        │  Panel content       │  ← full viewport height minus header
│        │  (scrollable)        │
│        │                      │
└────────┴──────────────────────┘
```

**Width:** Fixed: SMALL 400px · MEDIUM 800px (default) · LARGE 1000px. Dynamic: 25% · 40% · 55% of the viewport. Full viewport height. Min 375px, max 1000px. *(DS2 used different fixed widths — see [DS3-vs-DS2.md](../DS3-vs-DS2.md).)*

---

## Component Style Tokens

```yaml
# DS2  (from DESIGN-DS2.md → components)
# Drawer — flush-edge side panel (no radius), full viewport height, Shadow M; MEDIUM 720px default
# (SMALL 348 / LARGE 1000, via the `size` prop). 48px header, 16px content padding.
drawer:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"
  rounded: "0px"
  width: 720px
  padding: 16px
```
```yaml
# DS3  (from DESIGN-DS3.md → components)
# Drawer — flush-edge side panel (no radius), full viewport height, Shadow S; MEDIUM 800px default
# (SMALL 400 / LARGE 1000, or dynamic 25% / 40% / 55%, via the `width` prop). 48px header, 24px content padding.
drawer:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"
  rounded: "0px"
  width: 800px
  padding: 24px
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md). The non-modal Drawer that keeps the page interactive is new in DS3 and is not available in DS2.
