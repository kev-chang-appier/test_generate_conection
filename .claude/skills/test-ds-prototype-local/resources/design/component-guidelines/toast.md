# Toast Usage Guidelines

**Last updated:** 2026-06-30

**Components:** `Toast`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=30333-371278)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-82), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=30333-371278))  
**Storybook:** [Toast](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-toast--docs)

---

## Overview

Toast is an ephemeral UI element that floats on the screen to display a brief message or provide feedback on the user's interaction with the application. It auto-dismisses after a default duration (~6s), overridable per toast. Use it to acknowledge async operations after they complete. For persistent in-page guidance, use `Hint`. For decisions requiring user input, use `Dialog`.

---

## Components at a Glance

| Approach | When to use |
|---|---|
| Triggered on demand | The common case — toasts stack and dismiss automatically |
| Caller-controlled visibility | When the surrounding flow must decide when the toast shows and hides |

---

## States

| State | Visual |
|---|---|
| Visible | Floating panel at the chosen placement (default bottom), Shadow M, rounded panel |
| Auto-dismissing | Exits after a default duration (~6s), overridable via `autoHideDuration` |
| Persistent | Stays until manually closed |
| Stacked | Multiple toasts queue vertically |

---

## Do's and Don'ts

**Do**
- Acknowledge every significant background action with a toast, including failures
- Write titles as brief outcome statements ("Campaign deleted", not "The campaign deletion was successful")
- Keep error toasts persistent — users must not miss failures
- Include an action button for reversible operations (e.g. delete, archive) so users can undo immediately
- Label the action button with a single verb-first phrase naming the outcome ("Undo", "Retry", "View report")
- Keep a single placement across the app so toasts always surface in the same spot and users learn where to look
- Carry one action button per toast so the eye lands on it immediately; route additional follow-ups to the relevant page instead

**Don't**
- Never use `Toast` for validation errors — show them inline next to the field
- Never use `Toast` for decisions that require user input — use `Dialog`
- Avoid stacking many toasts at once — they compete for attention; queue or collapse related messages
- Never map severity inconsistently — a failed operation must read as error and a caution as warning, so the icon and color read the same across every surface
- Avoid mixing top and bottom placement within one product area — inconsistent positioning forces users to hunt for the message
- Avoid crowding a toast with more than one action button — competing buttons leave no clear next step; keep one and drop the rest
- Avoid interaction words in the action label ("Click to undo") — name the action directly ("Undo")

---

## Anatomy

```
  ┌──────────────────────────────────────┐  ← Shadow M, rounded panel, top/bottom of viewport
  │  [icon]  Title                  [×]  │  ← headline5
  │          Description                 │  ← body1
  │                          [Action]   │  ← optional quick-action button
  └──────────────────────────────────────┘
```

---

## Component Style Tokens

```yaml
# DS2  (from DESIGN-DS2.md → components)
# Toast — floating notification panel, Shadow M. Severity tints the WHOLE panel
# (background + icon), using the same semantic recipe as Hint — not the icon alone.
# Title + message stay text-high; the icon takes the semantic foreground color.
toast:
  textColor: "{colors.text-high}"                 # title + message
  rounded: "{rounded.md}"                          # 8px
  width: 400px
  padding: 12px
  typography: "{typography.headline5}"
toast-success:
  backgroundColor: "{colors.semantic-bg-green}"
  iconColor: "{colors.semantic-green}"
toast-info:
  backgroundColor: "{colors.semantic-bg-azure}"
  iconColor: "{colors.semantic-azure}"
toast-warning:
  backgroundColor: "{colors.semantic-bg-orange}"
  iconColor: "{colors.semantic-orange}"
toast-error:
  backgroundColor: "{colors.semantic-bg-red}"
  iconColor: "{colors.semantic-red}"
```
```yaml
# DS3  (from DESIGN-DS3.md → components)
# Toast — floating notification panel, Shadow M. Severity tints the WHOLE panel
# (background + icon), using the same semantic recipe as Hint — not the icon alone.
# Title text stays text-high; the icon takes the semantic foreground color.
toast:
  textColor: "{colors.text-high}"                 # title + description
  rounded: "8px"
  width: 400px
  padding: 16px
  typography: "{typography.headline5}"
toast-success:
  backgroundColor: "{colors.semantic-bg-green}"
  iconColor: "{colors.semantic-green}"
toast-info:
  backgroundColor: "{colors.semantic-bg-azure}"
  iconColor: "{colors.semantic-azure}"
toast-warning:
  backgroundColor: "{colors.semantic-bg-orange}"
  iconColor: "{colors.semantic-orange}"
toast-error:
  backgroundColor: "{colors.semantic-bg-red}"
  iconColor: "{colors.semantic-red}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

The severity tints the **whole panel** — background and leading icon together — using the same per-severity tokens as [`Hint`](hint.md): `semantic-bg-green` / `semantic-green` (success), `semantic-bg-azure` / `semantic-azure` (info), `semantic-bg-orange` / `semantic-orange` (warning), `semantic-bg-red` / `semantic-red` (error). The title uses `headline5`, the description `body1`; both stay `text-high`. Do not render the panel on a neutral `surface-popover` background with only the icon colored — match the Hint palette. **This is identical in DS2 and DS3** (the panel padding differs — 12px DS2 / 16px DS3 — but the tint recipe is shared).
