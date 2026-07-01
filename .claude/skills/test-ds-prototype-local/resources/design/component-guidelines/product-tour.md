# ProductTour Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `ProductTour`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=53098-16339)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=12915-11709), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=53098-16339))  
**Storybook:** [ProductTour](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-producttour--docs)

---

## Overview

`ProductTour` introduces users to a UI feature by pointing directly at it. It floats above the page as an overlay anchored to a reference element — suited for multi-step guided walkthroughs or single-feature callouts on first visit. The overlay holds a title, optional body content, and an optional footer for action buttons.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `ProductTour` | Introduce a feature to first-time users, advance a multi-step walkthrough, or highlight newly released functionality in context |

---

## Variants

Two visual styles:

| Type | Appearance | When to use |
|---|---|---|
| Regular (default) | White panel, blue accent indicator | Neutral contextual guidance |
| Blue | Blue panel | High-emphasis callout — use sparingly, one per screen at most |

---

## Placement

The panel floats beside the element it explains. Set a preferred side, and provide ordered fallback sides for when the primary position would clip the viewport. The panel can also shift along its axis to stay visible near viewport edges, and the pointer arrow can be repositioned (e.g. moved toward the right edge of the panel for off-center anchors).

- **Preferred side** — defaults to the top of the reference element.
- **Fallback sides** — tried in order (top, right, left, bottom); lock the placement by allowing no fallbacks.

---

## States

| State | Visual |
|---|---|
| Visible | Floating panel rendered, indicator arrow pointing at the reference element |
| Hidden | Panel not rendered; reference element unaffected |
| Closable (default) | × icon in the top-right corner of the panel |
| Unclosable | No × icon; dismissal is driven entirely by external state |

---

## Step Composition

Each step should read in one glance — what the feature is, then what to do next.

- **Lead with the title.** The title is set in a semibold emphasis style so it carries the step's point; keep the body to a short supporting line so the eye lands on the title first.
- **Anchor tightly to the target.** Position the panel beside the reference element with the indicator arrow touching it, so the pairing reads as one unit rather than a floating note.
- **Keep the target the focal point.** Place the step against a dimmed page so the highlighted element stands out; never let the panel cover the element it explains.
- **One advance action.** Make the step's forward action ("Next", "Got it") the single primary `Button`; render Skip and opt-out controls as minimal so the primary leads.

---

## Do's and Don'ts

**Do**
- Point `ProductTour` at the actual UI element being explained — anchor it to the real interactive element, not a placeholder
- Drive visibility from application state; advance it when the user completes the action the step describes
- Always handle the close action and reflect it in the panel's visibility so the × actually dismisses the tour
- Provide fallback placements to keep the panel on screen at all viewport sizes
- Limit the footer to two actions — one primary CTA and one skip/dismiss
- Use the blue style only for the single most important callout on a screen
- For tours longer than one step, include a step counter or "Next" button in the footer so users know how much remains
- Keep footer button labels short and consistent across steps — use the same advance label ("Next") and dismiss label ("Skip") on every step rather than varying the wording

**Don't**
- Never leave `ProductTour` visible as a persistent annotation — it should appear once and be dismissible
- Never render multiple `ProductTour` instances at the same time; sequence them one at a time
- Never omit a working close action when the panel is closable — users expect the × to dismiss the panel
- Never use `ProductTour` for errors, warnings, or status messages — use `Toast` or `Hint` instead
- Avoid using the blue style on every step of a multi-step tour; reserve it for the most important single step
- Avoid giving the step two primary footer buttons — keep one primary advance action and render Skip or opt-out as minimal
- Avoid positioning the panel so it overlaps the reference element — anchor it to a free side so the highlighted target stays visible

---

## Anatomy

```
  ┌──────────────────────────────────┐  ← Shadow M, surface-primary / semanticBg-azure, border-popover, radius-8
  │  Title                        ×  │  ← semibold title, × icon (when closable)
  ├──────────────────────────────────┤
  │  content                         │  ← optional body content
  ├──────────────────────────────────┤
  │  [footer item 1]  [footer item 2]│  ← optional footer actions, right-aligned by default
  └──────────┬───────────────────────┘
             ▼                            ← indicator arrow pointing to the reference element
         [reference element]
```

Indicator default position: centered on the panel edge nearest the reference element. It can be repositioned toward either edge for off-center anchors.

---

## Patterns

### Multi-step tour

Show one step at a time, each anchored to its own target. Advance to the next step when the user picks "Next" and dismiss the whole tour on "Skip" or after the final step. Number the steps in the title (e.g. "Step 1 of 3 — Campaigns") so users know how much remains.

### "Do not show again" footer

For first-visit callouts, place a "Don't show this again" checkbox at the left of the footer alongside the primary action, so a user can opt out permanently while dismissing the step.

---

## Component Style Tokens

`ProductTour` is DS2-only — there is no `v3/` implementation; the blocks below are identical except for the radius scale form.

```yaml
# DS2  (from src/components/ProductTour/ProductTour.tsx)
product-tour:
  backgroundColor: "{colors.surface-primary}"   # regular variant
  border: "1px solid {colors.border-popover}"
  rounded: "{rounded.md}"                        # rounded-radius-8
  width: 240px                                  # min-w-[240px]
  padding: 8px 12px                              # py-spacing-8 px-spacing-12
  # title uses a semibold emphasis style (not a headline token); body inherits
  # plus Shadow M elevation; title icon uses {colors.semantic-azure}
product-tour-blue:
  backgroundColor: "{colors.semantic-bg-azure}"   # blue variant (tint token)
```
```yaml
# DS3  (same source — no v3 file)
product-tour:
  backgroundColor: "{colors.surface-primary}"
  border: "1px solid {colors.border-popover}"
  rounded: "radius-8"
  width: 240px
  padding: 8px 12px
  # title uses a semibold emphasis style (not a headline token); body inherits
  # plus Shadow M elevation; title icon uses {colors.semantic-azure}
product-tour-blue:
  backgroundColor: "{colors.semantic-bg-azure}"   # tint token
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

`ProductTour` is DS2 only — there is no DS3 equivalent component. Continue using the DS2 component for onboarding flows until a DS3 equivalent is released. Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
