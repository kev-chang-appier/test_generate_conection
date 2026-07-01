# ContentAssistant Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `ContentAssistant`  
**Figma:** DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec)) — no dedicated spec page; ContentAssistant is code-only  
**Storybook:** [ContentAssistant](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-contentassistant--docs)

---

## Overview

`ContentAssistant` is a floating, collapsible panel that houses an AI assistant alongside the main workspace. In its collapsed state it shows only a trigger button; expanding it reveals a structured header, scrollable content area, and a footer action row. Use it when an AI capability needs to persist in context — available on demand but out of the way when not needed.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `ContentAssistant` | Render the floating panel with composed header, content, and footer areas |

---

## Composition

`ContentAssistant` is a layout shell — it owns the floating surface, collapse animation, and slot structure. All visible content is provided by the consuming page. Collapse state can also be driven from outside the panel — e.g. toggled from a toolbar button.

| Slot | Notes |
|---|---|
| Trigger button | Content inside the always-visible primary AI button that opens the panel (the collapsed floating node is a separate built-in round AI button) |
| Panel header | Shown when expanded; use for assistant name, status, and close/minimize controls |
| Panel body | Main assistant UI — conversation thread, generation form, etc. |
| Panel footer | Action row at the panel base; holds one or more action buttons |

---

## States

| State | Visual |
|---|---|
| Collapsed | Only the trigger button is visible; panel is hidden |
| Expanded | Full panel shown — header, content area, footer |
| Content loading | Managed within the panel body; the shell itself has no built-in loading state |

---

## Do's and Don'ts

**Do**
- Always include a collapse or close affordance in the panel header so users can dismiss the panel without losing their place in the main content
- Keep the footer to primary actions only (submit, clear, regenerate); secondary controls belong in the header or content area
- Order footer actions following [Placement patterns → Action buttons](../DESIGN-DS3.md#placement-patterns): one emphasized commit action rightmost (e.g. Send), the rest downgraded to secondary (e.g. Clear)
- Render the panel at or near the root of the page layout so it floats above all content at a consistent stacking depth

**Don't**
- Never pass complex interactive forms into the trigger button — it should be a single focusable element that clearly signals AI functionality
- Never use `ContentAssistant` as a generic side panel; use `Drawer` instead when the content is not AI-powered or needs a larger canvas
- Avoid nesting another overlay (Dialog, Popover) launched from inside the panel body without managing its stacking order explicitly
- Never give two footer actions equal primary emphasis — promote one commit action and set the others to secondary

---

## Anatomy

```
  ┌──────────────────────────────┐  ← floating panel (Shadow M)
  │  [Assistant name]       [×]  │  ← panel header
  ├──────────────────────────────┤
  │                              │
  │  panel body                  │  ← scrollable body
  │  (conversation / form)       │
  │                              │
  ├──────────────────────────────┤
  │  [Action]  [Action]          │  ← panel footer
  └──────────────────────────────┘

  [●]  ← built-in round AI button (collapsed floating node)
```

The panel floats fixed above the page. When collapsed, the only visible element is the built-in round AI button; the trigger button's content always renders inside the separate primary trigger button.

---

## Component Style Tokens

`ContentAssistant` is DS2-only — there is no `v3/` implementation; the blocks below are identical. (Values are from source — the panel body uses `surface-primary` and `border-general`, not popover tokens.)

```yaml
# DS2  (from src/components/ContentAssistant/ContentAssistant.tsx)
content-assistant:
  backgroundColor: "{colors.surface-primary}"   # panel container + footer
  rounded: "{rounded.md}"                        # border-radius 8px
  width: 400px
  minHeight: 180px                               # max-height caps at viewport minus 20px margins
  # plus Shadow M elevation
content-assistant-header:
  backgroundColor: "{colors.blue-normal}"        # full-palette ramp token
  textColor: "{colors.text-white-hold}"
  border: "1px solid {colors.border-general}"    # bottom divider
  height: 48px
  padding: 12px 24px
  typography: "{typography.headline4}"
content-assistant-body:
  textColor: "{colors.text-high}"
  padding: 24px 24px 12px
  typography: "{typography.body1}"
content-assistant-footer:
  backgroundColor: "{colors.surface-primary}"
  height: 56px
  padding: 12px 24px                             # action row, right-aligned, 8px gap
content-assistant-trigger:
  backgroundColor: "{colors.blue-normal}"        # collapsed round AI button (full-palette ramp token)
  textColor: "{colors.text-white-hold}"
  rounded: "50px"                               # collapsed round AI button (48px)
  width: 48px
  height: 48px
```
```yaml
# DS3  (same source — no v3 file)
content-assistant:
  backgroundColor: "{colors.surface-primary}"
  rounded: "radius-8"
  width: 400px
  minHeight: 180px                               # max-height caps at viewport minus 20px margins
  # plus Shadow M elevation
content-assistant-header:
  backgroundColor: "{colors.blue-normal}"        # full-palette ramp token
  textColor: "{colors.text-white-hold}"
  border: "1px solid {colors.border-general}"
  height: 48px
  padding: 12px 24px
  typography: "{typography.headline4}"
content-assistant-body:
  textColor: "{colors.text-high}"
  padding: 24px 24px 12px
  typography: "{typography.body1}"
content-assistant-footer:
  backgroundColor: "{colors.surface-primary}"
  height: 56px
  padding: 12px 24px                             # action row, right-aligned, 8px gap
content-assistant-trigger:
  backgroundColor: "{colors.blue-normal}"        # full-palette ramp token
  textColor: "{colors.text-white-hold}"
  rounded: "50px"
  width: 48px
  height: 48px
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

`ContentAssistant` is DS2 only — there is no v3 counterpart. To build an AI assistant panel in a DS3 product, compose a similar layout using an absolutely positioned `Drawer` or a custom floating surface using DS3 tokens. Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
