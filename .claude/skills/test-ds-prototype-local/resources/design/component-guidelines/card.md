# Card Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Card`, `StackedCard`
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63487-19307)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-51), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=28258-407349))  
**Storybook:** [Card](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-card--docs)

## Overview

Cards group related content and actions into a bounded surface for browsing and selection. Use them when users need to scan a collection of items, compare options, or pick a configuration. A card is a container — what goes inside (title, content, action) determines its purpose.

Vertical cards stack title and content top-to-bottom and suit grids. Horizontal cards place a fixed content zone on the left and a dynamic zone on the right, useful when item identity (an icon, image, or label) is constant while right-column metadata varies per record. Cards can also be made selectable, with single- or multi-select behavior.

## Components at a Glance

| Component | When to use |
|---|---|
| `Card` (vertical) | Grid layouts, option pickers, dashboard widgets — content is taller than it is wide |
| `Card` (horizontal) | Record lists where a stable left column anchors variable right-column metadata |
| `StackedCard` | Vertical card with a separate bottom title/subtitle/action zone (e.g. catalog or template items) |
| `ConnectorCard` | DS2 platform integration tiles — see [connectorcard.md](connectorcard.md) |
| `WidgetCard` | DS2/DS3 dashboard panels — see [widget-card.md](widget-card.md) |

## Variants

**Direction**

Vertical (default) for grids. Horizontal for records with a fixed identity column. Only horizontal cards support a subtitle and a dynamic right-hand content zone.

**Clickable and selectable**

Make the card clickable when the entire card surface is an interaction target, and show a selected state to mark the choice. For single-option pickers, use the single-select mode — it shows a radio indicator instead of a checkbox.

**Status**

The error and warning states add a colored border to signal that the card needs attention. Use them for validation feedback, not general categorization.

**Background context**

The background-context setting describes the surface the card sits on, not the card's own background. Choose gray when the parent panel is gray and white when it is white. This adjusts shadow and border so the card lifts off the correct background.

## States

| State | Visual |
|---|---|
| Default | `surface-card` surface, `UI/border/general` border |
| Hover (clickable) | Slightly elevated shadow, border intensifies — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Selected (multi) | `primary` border, checkbox indicator |
| Selected (single) | `primary` border, radio indicator |
| Error | `semantic-red` border |
| Warning | `semantic-orange` border |
| Disabled | Reduced opacity, no interaction |

## Card Collections

Cards almost always appear as a set — a grid of options, a list of records, a row of dashboard widgets. The set reads as one group only when every card shares the same treatment, so the eye scans content rather than catching on layout differences. Grid gutter and content-area spacing follow the central scale — see [Layout](../DESIGN-DS3.md#layout) and [Placement patterns](../DESIGN-DS3.md#placement-patterns).

- **Uniform size and treatment.** Give every card in a grid the same width, padding, border, and radius. One card with a different padding or border breaks the set apart.
- **Equal-height rows.** Cards in the same row should share a height; clamp the title to a fixed number of lines and fix the content zone so variable-length text does not stagger the row. Ragged card heights make the grid look unfinished.
- **Consistent gutters.** Keep the same horizontal and vertical gap between every card. Uneven gutters read as accidental grouping the layout does not intend.
- **One card width per breakpoint.** Pick a column count per breakpoint and hold it; do not mix wide and narrow cards in the same grid unless the width itself carries meaning.
- **Group under section headings.** When a collection spans distinct categories (e.g. "Templates" and "Drafts"), put each category in its own labeled group rather than one undivided grid — the heading tells users where one set ends and the next begins.

Within a single card, keep the title the most prominent text, the subtitle and content secondary, and the action slot subordinate so the card's identity reads before its controls.

## Do's and Don'ts

**Do**
- Make the card clickable whenever it triggers navigation or selection — it adds a hover state and pointer cursor
- Give every card in a grid the same width, padding, and border so the collection reads as one set
- Hold a consistent gutter between cards and keep cards in a row equal in height — clamp variable titles so they don't stagger the row
- Split a collection that spans distinct categories into groups under section headings instead of one undivided grid
- Clamp variable-length titles to a fixed number of lines to keep grid alignment; truncated titles show in a tooltip automatically
- Match the background-context setting to the parent surface, not the card's own background
- Combine clickable, selected, and single-select for single-option pickers (e.g. plan selection, template choice)
- Keep the action slot for a single control (icon button, overflow menu) — multiple actions there compete for attention

**Don't**
- Never use the `Card` component as a section wrapper for settings or data — use the section grouping container pattern in [layout-patterns.md](../Design-Patterns/layout-patterns.md) instead. `Card` carries interactive behavior (clickable, selectable, status) that does not belong on a passive layout surface.
- Never place a button inside the content zone and also make the card clickable — two overlapping click targets conflict
- Never use the error or warning state for neutral status labels — use `Badge` or `Tag` instead
- Never use a horizontal card without providing its right-hand content zone — the layout will be unbalanced
- Avoid mixing clickable and non-clickable cards in one grid or list — if any card in the set is selectable, make all of them clickable so interactivity reads consistently across the group
- Avoid overriding the default padding without a layout-specific reason; the default padding (12px in DS2, 16px in DS3) fits most contexts
- Never vary card width, padding, or border within one grid — a single different card splits the set apart instead of reading as one group
- Avoid letting cards in a row settle at different heights — clamp titles and fix the content zone so the row stays even

## Anatomy

**Vertical card**

```
  ┌────────────────────────────────────────┐
  │  Card title                  [action]  │   ← title (headline6) + optional action slot
  │                                        │
  │  content                               │   ← any content; fills remaining height
  │                                        │
  └────────────────────────────────────────┘
```

**Horizontal card**

```
  ┌──────────────────────────────────────────────────────────────┐
  │  content              │  dynamic content           [action]  │
  │  subtitle             │                                      │
  └──────────────────────────────────────────────────────────────┘
     ↑ fixed left zone       ↑ dynamic right zone
```

Geometry — radius (`radius-12`), default padding, surface (`surface-card`), and typography — is defined centrally: see DESIGN-DS3 [Shapes](../DESIGN-DS3.md#shapes) · [Colors](../DESIGN-DS3.md#colors) · [Typography](../DESIGN-DS3.md#typography) (DS2 in [DESIGN-DS2.md](../DESIGN-DS2.md); cross-version deltas in [DS3-vs-DS2.md](../DS3-vs-DS2.md)).

## StackedCard

Vertical-only variant with an extra bottom zone (title, subtitle, and action) below the content. Shares `Card`'s selection, status, and padding behavior; has no direction, clickable, or background-context options. It wraps the DS2 component in DS3 and is not restyled to the `Card` radius.

## Component Style Tokens

```yaml
# DS2  (from DESIGN-DS2.md → components)
content-card:
  backgroundColor: "{colors.surface-card}"
  rounded: "{rounded.md}"
  padding: 12px
```
```yaml
# DS3  (from DESIGN-DS3.md → components) — border only (no shadow); 12px radius
content-card:
  backgroundColor: "{colors.surface-card}"
  border: "1px solid {colors.border-general}"
  rounded: "12px"
  padding: 16px
card-elevation: border
card-radius:    radius-12
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).
