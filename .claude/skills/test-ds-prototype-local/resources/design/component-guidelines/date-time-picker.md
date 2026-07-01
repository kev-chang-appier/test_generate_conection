# Date & Time Picker Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `DatePicker`, `DateRangePicker`, `DateQuickSelectionPicker`, `TimePicker`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=22150-393175)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-54), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=22150-393175))  
**Storybook:** [DatePicker](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-datepicker-datepicker--docs)

---

## Overview

Date and time pickers let users select or enter a date, time, or range. Use them wherever temporal input is required — scheduling, filtering by period, setting deadlines, or configuring recurring times — to enforce valid formats and reduce entry errors.

---

## Components at a Glance

| Component | Selection model | When to use |
|---|---|---|
| `DatePicker` | Single date | Scheduling a single event, setting a deadline |
| `DateRangePicker` | Start date + end date | Report date ranges, campaign flights, export windows |
| `DateQuickSelectionPicker` | Preset range OR custom range | Dashboards and analytics where users frequently pick "Last 7 days", "Last 30 days", etc. |
| `TimePicker` | Hour + minute | Campaign scheduling, notification times, event start/end times |

---

## States

All picker inputs share the standard input states:

| State | Visual |
|---|---|
| Default | `border-general` border |
| Focused | `primary` focus outline — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled | Reduced opacity on field; label at full opacity — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Error | Error string below in `semantic-red` |

Selected dates in the calendar:
- **Selected day:** `primary` filled circle. Day cells are square (40×40), so the fill renders as a true circle — never an ellipse.
- **In-range days** (DateRangePicker): `stateOverlay-hoverBlue` tinted background painted as a single continuous horizontal band spanning the range, with the start and end days capped as circles — not a separate rounded pill drawn behind each individual day.
- **Today:** Subtle indicator (a `surface-blue` outline circle); the outline is a true circle on the square cell, not an oval.
- **Disabled days** (beyond the allowed range): `text-low` at reduced opacity, not selectable

---

## Do's and Don'ts

**Do**
- Use `DateQuickSelectionPicker` on analytics/reporting pages — presets dramatically speed up the most common workflows
- Cap the selectable range length on `DateRangePicker` when the product has a business constraint, and surface that constraint in the panel footer
- Step the minute selector by 15 or 30 on `TimePicker` unless minute-precision is required
- Localise all visible labels (Today, Apply, Cancel) — they are not auto-translated
- Let users clear a selected range
- Pre-fill pickers with a sensible default date or preset when context suggests one
- Show the selected date or range in the trigger field at all times — users should see their selection without opening the calendar
- Keep preset labels as concise time-window noun phrases ("Last 7 days", "This month") so each preset reads as a selectable range
- Order presets from shortest to longest window, with "Custom" last, so users scan a predictable progression to the range they want
- Keep the panel footer's Apply as the single primary action with Cancel as secondary, right-aligned together, so the confirming action reads first — see [Placement patterns → Action buttons](../DESIGN-DS3.md#placement-patterns)

**Don't**
- Never set the minimum hour at or above the maximum hour on `TimePicker` — the bounds silently fall back to the full 0–23 day
- Never treat the live-preview range on `DateRangePicker` as a confirmation — only the Apply (and Clear) action commits the selection
- Avoid using a plain `DatePicker` where a range is needed — entering two separate dates is significantly worse than `DateRangePicker`
- Avoid omitting the input placeholder on `DatePicker` — users need a format hint (e.g. "YYYY-MM-DD") to know how to type a date directly
- Avoid a trigger that reads as static text — keep a field border, chevron, or calendar icon so it is recognizable as an opener

---

## Anatomy

### DatePicker / DateRangePicker calendar panel

```
  ┌────────────────────────────────────┐  ← Shadow M, surface-popover border, radius-16 (DS3)
  │  < March 2026 >                    │  ← month navigation
  │  Mo  Tu  We  Th  Fr  Sa  Su        │
  │   2   3   4   5   6   7   8        │
  │   9  10  11  12  13  14  15        │
  │  16  17  18  19  20  21  22        │
  │  23  24  25  26  27  28  29        │  ← selected range: tinted fill
  ├────────────────────────────────────┤
  │  [  Cancel  ]       [  Apply  ]    │  ← standard Buttons, right-aligned (see Action buttons)
  └────────────────────────────────────┘
```

| Zone | DS3 spec |
|---|---|
| Calendar shadow | Shadow M — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Calendar border | `UI/surface/popover` (1px) |
| Calendar radius | `radius-16` (DS2: 8px) — see [Shapes](../DESIGN-DS3.md#shapes) |
| Day cell | 40×40px, day-number circle `radius-full` |
| Input | Standard Input — see [Component heights](../DESIGN-DS3.md#component-heights) · [Shapes](../DESIGN-DS3.md#shapes) |
| Footer buttons | Standard Buttons (Secondary M + Primary M) — Button radius (`radius-8`), grouped per [Placement patterns → Action buttons](../DESIGN-DS3.md#placement-patterns) (12px DS3 group gap) |

---

## DatePicker

Single date selection via a calendar dropdown attached to a text input. `DatePicker` (single) has no Apply button, so the selection takes effect immediately on each pick.

---

## DateRangePicker

Two-date selection (start and end) with a unified calendar. Apply and Cancel buttons confirm the selection — nothing is committed until Apply is clicked.

> **Important:** The calendar updates a live preview on every click and date-input edit, but the range is only committed when the user clicks Apply (or Clear). Never treat the live preview as confirmation.

---

## DateQuickSelectionPicker

A two-panel picker: a left panel with named presets (Today, Last 7 days, Last 30 days, All time, Custom) and a right panel showing the corresponding calendar range. Use on dashboards and reporting surfaces where users frequently switch between common time windows. It builds on `DateRangePicker` and shares the same Apply-commits behavior; the "All time" option can be hidden when not applicable.

---

## TimePicker

Hour and minute selection via two dropdown selects. Use for scheduling fields alongside a `DatePicker` or independently. Selectable hours are bounded by a configurable min and max within the 0–23 day, with configurable hour and minute intervals; users may also type the time directly when input is allowed.

---

## Component Style Tokens

The trigger field is a standard Input and the footer Apply/Cancel are standard Buttons (Secondary M + Primary M) — see those guidelines for their tokens. The calendar panel and day cells below are styled by the picker's own source. The picker shares one implementation across versions; DS3 only widens the panel radius and input radius.

```yaml
# DS2
date-picker-input:                   # trigger field (standard BaseInput)
  textColor: "{colors.text-high}"
  border: "1px solid {colors.border-general}"
  rounded: "{rounded.sm}"            # 4px
  typography: "{typography.headline5}"
date-picker-calendar:                # dropdown panel
  backgroundColor: "{colors.surface-popover}"
  border: "1px solid {colors.surface-popover}"
  rounded: "{rounded.md}"            # border-radius: 8px
date-picker-day-selected:
  backgroundColor: "{colors.surface-blue}"
  textColor: "{colors.text-white-hold}"
  rounded: "radius-full"             # 99px circle
date-picker-day-inrange:
  backgroundColor: "{overlays.stateOverlay-hoverBlue}"
  textColor: "{colors.blue-normal}"  # full-palette ramp token
date-picker-day-today:
  border: "2px solid {colors.surface-blue}"
  rounded: "radius-full"
date-picker-day-hover:
  backgroundColor: "{overlays.stateOverlay-hover}"
```
```yaml
# DS3
date-picker-input:
  textColor: "{colors.text-high}"
  border: "1px solid {colors.border-general}"
  rounded: "radius-8"                # rounded-radius-8
  typography: "{typography.headline5}"
date-picker-calendar:
  backgroundColor: "{colors.surface-popover}"
  border: "1px solid {colors.surface-popover}"
  rounded: "radius-16"               # pickerClassName rounded-radius-16
date-picker-day-selected:
  backgroundColor: "{colors.surface-blue}"
  textColor: "{colors.text-white-hold}"
  rounded: "radius-full"
date-picker-day-inrange:
  backgroundColor: "{overlays.stateOverlay-hoverBlue}"
  textColor: "{colors.blue-normal}"  # full-palette ramp token
date-picker-day-today:
  border: "2px solid {colors.surface-blue}"
  rounded: "radius-full"
date-picker-day-hover:
  backgroundColor: "{overlays.stateOverlay-hover}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

The footer Apply/Cancel are **standard Buttons** grouped per [Placement patterns → Action buttons](../DESIGN-DS3.md#placement-patterns) (12px DS3 group gap), and the calendar panel carries Shadow M elevation.

---

Cross-version differences (input height/radius, button height, font): see [DS3-vs-DS2.md](../DS3-vs-DS2.md). The picker reuses standard Input and Button geometry, so it inherits those components' version deltas. Behavior is unchanged across versions.
