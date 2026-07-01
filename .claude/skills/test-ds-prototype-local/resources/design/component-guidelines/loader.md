# Loader Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Loader`, `InfiniteLoadingSpinner`, `InfiniteLoadingDots`, `LoadingTooltip`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=7604-45135)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-65), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=7604-45135))  
**Storybook:** [LoadingSpinner](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-loadingspinner-infiniteloadingdots--docs)

---

## Overview

Loading indicators communicate that the system is working. `InfiniteLoadingSpinner` is a rotating arc for indeterminate wait states; `InfiniteLoadingDots` provides three bouncing dots for compact or inline contexts. `Loader` is a fixed full-screen indicator pairing its own four-square looping animation with a title and subtitle for full-page blocking states. `LoadingTooltip` combines a spinner with a required title and optional description for labeled inline loading states.

Use `Skeleton` instead when the content layout is predictable (tables, cards, list items) and the shape of what will load is known in advance.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `InfiniteLoadingSpinner` | Indeterminate wait — fetching data, form submission, any async operation of unknown duration |
| `InfiniteLoadingDots` | Compact or inline indeterminate wait; three animated dots for narrow or space-constrained contexts |
| `Loader` | Full-screen blocking state that needs an explanatory title; uses its own four-square looping animation, not the spinner |
| `LoadingTooltip` | Labeled loading state within a contained area; spinner + required title + optional description |

---

## Variants

### InfiniteLoadingSpinner sizes

| `size` | Diameter (container / ring) | Typical use |
|---|---|---|
| small | 16px / 12px | Inline with text, inside a button, table cell |
| normal (default) | 20px / 16px | Card loading state, section-level wait |
| large | 24px / 20px | Page-level or full-section loading |

Override the arc color for dark or primary-colored backgrounds; otherwise it uses the default blue.

### InfiniteLoadingDots

The dot diameter is adjustable (default 2px), as is the dot color (default `semantic-blue`).

| Variant | Diameter | Color |
|---|---|---|
| Default | 2px | default blue |
| Larger | 16px | default blue |
| Black (low-contrast) | 2px | `content/low` |

---

## States

| Component | State | Visual |
|---|---|---|
| `InfiniteLoadingSpinner` | Spinning | Ring rotates 360°, 0.8s linear, clockwise; comet-tail fade (no fixed gap), 3px stroke |
| `InfiniteLoadingSpinner` | Custom color | Arc uses a specified color instead of default blue |
| `InfiniteLoadingDots` | Animating | Three dots bounce in sequence; default 2px, `semantic-blue` |
| `Loader` | Visible | Centered four-square looping animation (64px container, 32px artwork) with a title and optional subtitle below |
| `LoadingTooltip` | Visible | Spinner beside a required title; optional description below |

---

## Do's and Don'ts

**Do**
- Use `InfiniteLoadingSpinner` for any operation where duration is unknown
- Use `Loader` when the entire page or major section is blocked — give the title a description of the active operation ("Generating report…"), not generic placeholder text
- Use `LoadingTooltip` when the loading state needs a label within a contained area; its required title also serves as the accessible label for screen readers
- Use `InfiniteLoadingDots` inside table cells, small badges, or other space-constrained contexts where a full spinner would be visually heavy
- Replace any spinner immediately with content or an error state as soon as the operation resolves
- Use the small size when embedding `InfiniteLoadingSpinner` inside a `Button`; it must not exceed the button's label height
- Give `InfiniteLoadingSpinner` a custom color when placing it on a dark or primary-colored surface

**Don't**
- Never leave any spinner visible after a failed request — swap it with an error message or empty state immediately
- Never render `InfiniteLoadingSpinner` or `InfiniteLoadingDots` without an accessible label nearby
- Avoid using `Loader` for spinner-only states — provide a meaningful title; the component is designed for states that warrant explanation
- Avoid an indeterminate spinner when a real completion percentage is available — use a determinate `Progress bar` so users can see how far the operation has progressed

---

## Anatomy

```
InfiniteLoadingSpinner:

    ◌◕   ← rotating ring, comet-tail fade, clockwise
         ← single ring; the faded trail is the same color ramping to transparent (no separate gray track)
         ← ring color: default semantic-blue, or a custom color

  small:  16px container / 12px ring
  normal: 20px container / 16px ring   (default)
  large:  24px container / 20px ring
  ring stroke: 3px (all sizes)


InfiniteLoadingDots:

  ●  ●  ●   ← three circular dots, bounce animation, default 2px diameter


Loader:

  ┌────────────────────────────────┐
  │                                │
  │           ◰◳◱◲                 │   ← four-square looping animation, centered (64px container / 32px artwork)
  │       Title text here          │   ← title (headline4, content-medium)
  │     Subtitle text here         │   ← subtitle (body1, content-low)
  │                                │
  └────────────────────────────────┘


LoadingTooltip:

  ◌◕  Title text here              ← spinner + title (required)
      Optional description         ← description
```

---

## Patterns

**Button loading state** — Place a small `InfiniteLoadingSpinner` inside a `Button` during submission, disable the button while loading, and use the white arc color on primary blue buttons.

**Section-level loading** — Center a normal-size `InfiniteLoadingSpinner` in a card or panel while its data loads; swap the spinner for content all at once rather than showing partial content alongside it.

**Full-page loading** — Use `Loader` for page-level blocking states with a title that names the operation; add a subtitle only for waits of more than a few seconds, and rotate guidance text for very long operations (5s+).

**Inline or compact loading** — Use `InfiniteLoadingDots` inside table cells, small badges, or anywhere a spinner would be visually heavy, with an accessible label so screen readers can announce the state.

---

## Component Style Tokens

These components share one recipe across versions, so the DS2 and DS3 token sets are identical. Spinner and dot color default to `semantic-blue`, switching to the white-on-dark `text-white-hold` on dark or primary surfaces. `Loader` and `LoadingTooltip` color and typography come from the shared theme tokens.

```yaml
# DS2  (Loader family shares one component across versions)
infinite-loading-spinner:
  textColor: "{colors.semantic-blue}"   # conic-gradient ring; colorTokenKey override → {colors.text-white-hold} on dark/primary
  rounded: "radius-full"                 # 50% mask; sizes 16/20/24px, ring stroke 3px
infinite-loading-dots:
  backgroundColor: "{colors.semantic-blue}"  # dot fill; colorTokenKey override (e.g. {colors.text-low})
  rounded: "radius-full"                      # 50%; default 2px diameter
loader:
  textColor: "{colors.text-med}"         # title (text-med)
  typography: "{typography.headline4}"   # title; subTitle → body1 in {colors.text-low}
loading-tooltip:
  backgroundColor: "{colors.surface-popover}"
  border: "1px solid {colors.border-popover}"
  textColor: "{colors.text-med}"         # description (text-med); title is default text color
  rounded: "{rounded.sm}"                # 4px
  padding: 12px 16px
  typography: "{typography.headline5}"   # title; description → body1
```
```yaml
# DS3
infinite-loading-spinner:
  textColor: "{colors.semantic-blue}"   # conic-gradient ring; colorTokenKey override → {colors.text-white-hold} on dark/primary
  rounded: "radius-full"                 # 50% mask; sizes 16/20/24px, ring stroke 3px
infinite-loading-dots:
  backgroundColor: "{colors.semantic-blue}"  # dot fill; colorTokenKey override (e.g. {colors.text-low})
  rounded: "radius-full"                      # 50%; default 2px diameter
loader:
  textColor: "{colors.text-med}"         # title (text-med)
  typography: "{typography.headline4}"   # title; subTitle → body1 in {colors.text-low}
loading-tooltip:
  backgroundColor: "{colors.surface-popover}"
  border: "1px solid {colors.border-popover}"
  textColor: "{colors.text-med}"         # description (text-med); title is default text color
  rounded: "radius-4"                    # 4px
  padding: "12px 16px"
  typography: "{typography.headline5}"   # title; description → body1
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).

Component availability (DS2-only / Figma-only counterparts):

- **`InfiniteLoadingSpinner`** — in the DS2 library with Storybook published; no dedicated DS3 file, so use the DS2 component and apply the white arc color on dark surfaces.
- **`InfiniteLoadingDots`** — DS2 v2.1.0 with Storybook published; not confirmed in DS3 (verify with the DS team).
- **`Loader`** — same title + subtitle; DS3 adds `Loading Animate_Light/Dark` (Figma only) for animated full-screen overlays.
- **`LoadingTooltip`** — required title + optional description; DS3 `Loading status` (Figma only) is the design counterpart.
- **DS3-only pattern** — `Loading tips` (Figma; rotating guidance for 5s+ operations).
