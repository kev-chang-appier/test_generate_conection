# Skeleton Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Skeleton`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=17210-202658)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-77), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=17210-202658))  
**Storybook:** [Skeleton](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-skeleton--docs)

---

## Overview

`Skeleton` is a loading placeholder that mimics the shape and size of the content it will replace. It reduces perceived load time by giving users a preview of the layout before data arrives. Use it in place of spinners whenever the target layout is predictable — tables, cards, lists, and form fields. Use a spinner or `Loader` instead when the output shape is unknown or the entire page is blocked.

---

## Components at a Glance

| Component | Shape / Variant | When to use |
|---|---|---|
| `Skeleton` | Rectangle | Text lines, image thumbnails, card containers, input fields |
| `Skeleton` | Circle | Avatar placeholders, icon placeholders |
| `Skeleton - Light` / `Skeleton - Dark` | — | Figma-only named variants; choose based on the surface theme. The single `Skeleton` component handles both via design tokens. |
| `table-cell/skeleton` | — | Pre-built skeleton for a table cell — use when mocking table loading states in Figma. |
| `table-column/skeleton` | — | Pre-built skeleton column — covers an entire column's cells at once. |
| `Widget template / Loading skeleton` | — | Pre-built widget-card skeleton layout for dashboard/widget loading states. |

---

## States

| State | Visual |
|---|---|
| Loading | A lighter highlight sweeps left→right across the gradient base |
| No dimensions set | Zero-size — invisible; always set width and height |

---

## Do's and Don'ts

**Do**
- Match skeleton dimensions and shape to the real content — undersized skeletons cause a layout shift on load
- Use the circle shape for avatar skeletons rather than a rectangle rounded to a full radius
- Show 3–10 skeleton rows for list/table loading states; fewer looks sparse, more looks like an infinite spinner
- Size skeletons with the design system's spacing tokens to stay consistent with the surrounding layout

**Don't**
- Never animate content in and out of skeletons — replace the skeleton with content when data resolves
- Avoid `Skeleton` for unknown-length content like paragraphs — use `Loader` when you can't predict the layout
- Never leave skeletons on screen after the data request has failed — replace with an empty state or error message
- Never mix skeletons and real data in the same list; wait until all items are ready before replacing all skeletons at once

---

## Anatomy

```
  Rectangle (default):
  ┌──────────────────────────────────┐   ← highlight sweeps left → right
  │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│   ← surface-tertiary base, surface-primary highlight
  └──────────────────────────────────┘
     ↑ height and width are set explicitly; no intrinsic size

  Circle:
     ◯   ← 1:1 aspect ratio; width controls diameter
```

`Skeleton` has **no intrinsic size** — with no dimensions it collapses to a one-line-tall, full-width space. Always give it an explicit width and height.

---

## Patterns

**Matching layout structure** — Build skeleton groups that mirror the real component's visual hierarchy, reusing the same gaps and column structure (e.g. a circle plus two text bars for a table row) so the transition is seamless when content loads.

**Conditional replacement** — While loading, show the skeleton in place of the real control; once data resolves, swap it out completely so skeleton and real content never appear at once.

---

## Component Style Tokens

`Skeleton` shares one recipe across versions. The animated gradient base sweeps a `surface-primary` highlight left→right across a `surface-tertiary` base; dark mode resolves automatically via the same tokens. The rectangle (the default shape) carries **no built-in radius** — only the circle sets one.

```yaml
# DS2  (Skeleton shares one component across versions)
skeleton:
  backgroundColor: "{colors.surface-tertiary}"   # gradient base (from/to)
  textColor: "{colors.surface-primary}"          # gradient highlight (via) sweeping left→right
  rounded: "0px"                                  # RECT default has no radius
skeleton-circle:
  rounded: "radius-full"                          # CIRCLE: aspect-square + rounded-radius-full
```
```yaml
# DS3
skeleton:
  backgroundColor: "{colors.surface-tertiary}"   # gradient base (from/to)
  textColor: "{colors.surface-primary}"          # gradient highlight (via) sweeping left→right
  rounded: "radius-0"                             # RECT default has no radius
skeleton-circle:
  rounded: "radius-full"                          # CIRCLE: aspect-square + rounded-radius-full
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Behavior is unchanged between DS2 and DS3; the component is not yet published as a v3 Storybook story — use the DS2 component in DS3 contexts. Figma variants are renamed with a `*` prefix in DS3 (`*Skeleton - Light`, `*Skeleton - Dark`, `Table-cell/Skeleton`, `Widget template / Loading skeleton`). The rectangle has no built-in radius in either version — apply an 8px radius to match DS3 form controls.

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
