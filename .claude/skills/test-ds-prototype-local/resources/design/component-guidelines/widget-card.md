# WidgetCard Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `WidgetCard`
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=17210-204753)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-84))  
**Storybook:** [WidgetCard](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-widgetcard--docs)

## Overview

`WidgetCard` lets users build dashboard panels with a consistent titled header and an action control (settings, overflow menu, expand) over a free-form body. It provides a fixed header zone — title, optional subtitles, and a top-right action slot — plus built-in drag and active states for rearrangeable layouts. For generic browsing or selection cards without this structure, use `Card` instead.

## Components at a Glance

| Component | When to use |
|---|---|
| `WidgetCard` | Dashboard panels and metric tiles with a title header, optional action, and support for drag-to-rearrange |
| `Card` | General content cards without a fixed header structure or drag behavior |

## Variants

**Standard**

Default widget with a title and body content. Use when the dashboard layout is fixed and widgets are not rearrangeable.

**With drag handle**

Show a drag icon in the top-left only when the dashboard is in an edit/arrange mode — hide the handle when the layout is locked.

**With subtitles**

A left subtitle sits below the title; a right subtitle sits below the action slot. Use them for secondary context (time range, data source, last-updated timestamp) without crowding the title.

## States

| State | Visual |
|---|---|
| Default | `surface-primary` surface, `border-general` border |
| Active | `blue-normal` border; widget is focused or selected in layout-edit mode |
| Dragging | Elevated shadow, surface lifts off the grid; shown while the user is actively repositioning — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled | Reduced opacity, no pointer events |

## Do's and Don'ts

**Do**
- Show the drag handle only when the layout is in an editable/arrange mode; hide it when the layout is locked
- Mark the widget that is currently focused during layout editing as active — only one widget should be active at a time
- Apply both the dragging and active states while a drag is in progress so the visual matches the interaction
- Keep the action slot for a single compact control — an icon button or overflow menu
- Use the left subtitle for metadata that qualifies the title (e.g. "Last 30 days") and the right subtitle for metadata that qualifies the action
- Keep headers consistent across a dashboard — apply the title, subtitles, and action control the same way on every widget so the grid reads as one set
- Snap widgets to a shared grid with even gutters and aligned title rows so panels line up rather than drifting — see [Placement patterns → Collections / grid](../DESIGN-DS3.md#placement-patterns)

**Don't**
- Avoid varying header structure across a dashboard — a widget with no subtitle or no action beside ones that have them makes the grid look misaligned; keep the header zones uniform
- Never use `WidgetCard` for cards that have no header/title — use `Card` instead
- Never put form controls or multi-button groups in the action slot; they collapse the header area
- Avoid passing a long sentence as the title — widget titles are identifiers, not descriptions; keep them to one short label
- Avoid showing a drag handle when only one widget is on screen; dragging has no effect and the handle adds noise
- Avoid leaving a widget disabled without surfacing why it is unavailable — pair it with a tooltip or empty-state message inside the body

## Anatomy

```
  ┌──────────────────────────────────────────┐
  │ [≡]  Title                   [action]    │  ← header: drag handle (optional) + title + action slot
  │      left subtitle    right subtitle     │  ← sub-row (both optional)
  │                                          │
  │  body content                            │  ← free-form body content
  │                                          │
  └──────────────────────────────────────────┘
```

| Zone | Notes |
|---|---|
| Drag handle | Icon in the top-left; hidden by default. |
| Title | Required. Short identifier label for the widget. |
| Action slot | Optional. Top-right. One compact control — icon button or overflow menu. |
| Left subtitle | Optional. Below title. Secondary metadata that qualifies the title. |
| Right subtitle | Optional. Below action. Secondary metadata that qualifies the action. |
| Body | Free-form. Charts, metrics, tables — any content the panel displays. |

## Component Style Tokens

DS3 reuses the DS2 implementation and only enlarges radius and padding (`v3.tsx` wraps the v2 card with `rounded-radius-16 p-spacing-24`).

```yaml
# DS2  (from src/components/WidgetCard/WidgetCard.tsx)
widget-card:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-med}"            # title (headline5)
  border: "1px solid {colors.border-general}"
  rounded: "{rounded.md}"                    # border-radius 8px
  padding: 12px 20px
  typography: "{typography.headline5}"      # title; subtitles use {typography.headline6} / {colors.text-low}
widget-card-active:
  border: "1px solid {colors.blue-normal}"   # full-palette ramp token (primary border highlight)
widget-card-dragging:
  border: "1px solid {colors.blue-normal}"   # full-palette ramp token
  # plus Shadow M elevation while dragging
```
```yaml
# DS3  (src/components/WidgetCard/v3.tsx → overrides radius + padding only)
widget-card:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-med}"
  border: "1px solid {colors.border-general}"
  rounded: "radius-16"                       # rounded-radius-16
  padding: 24px                             # p-spacing-24
  typography: "{typography.headline5}"
widget-card-active:
  border: "1px solid {colors.blue-normal}"   # full-palette ramp token
widget-card-dragging:
  border: "1px solid {colors.blue-normal}"   # full-palette ramp token
  # plus Shadow M elevation while dragging
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md). Tiling/grid layout: see [Placement patterns → Collections / grid](../DESIGN-DS3.md#placement-patterns).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md). Behavior is unchanged between versions.
