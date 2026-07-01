# Chart Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `ColumnChart`, `LineChart`, `PercentageStackedAreaChart`  
**Figma:** DS3 ([ColumnChart](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=20476-272527), [LineChart](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=19917-318284), [AreaChart](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=21166-363788)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec), [ColumnChart](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=20476-272527), [LineChart](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=19917-318284), [AreaChart](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=21166-363788))  
**Storybook:** [Chart](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-chart--docs)

---

## Overview

The chart family visualizes analytics data over time and across dimensions. Use `ColumnChart` to compare discrete values across categories or time buckets; `LineChart` to show trends over a continuous time range; `PercentageStackedAreaChart` to show how proportional composition changes over time. All three share the same data-binding, theming, and axis-formatting foundation, and diverge only in how metrics and chart-type-specific options are set.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `ColumnChart` | Compare discrete metric values across categories or bucketed time periods |
| `LineChart` | Show metric trends over a continuous date range; supports dual Y-axes and comparison time windows |
| `PercentageStackedAreaChart` | Show how proportional composition changes over time — relative distribution, not absolute totals |

---

## Chart Type Selection

Choose the chart type based on the analytical question:

| Question | Use |
|---|---|
| "Which campaign had the highest impressions last month?" | `ColumnChart` |
| "How did CTR change week-over-week?" | `LineChart` |
| "What share of traffic came from each channel over time?" | `PercentageStackedAreaChart` |

Do not use `ColumnChart` for continuous time series with many data points — column density makes trends unreadable. Switch to `LineChart` when you have more than roughly 15 time buckets.

Do not use `PercentageStackedAreaChart` when absolute values matter — the y-axis is fixed at 0–100%, so magnitude information is lost entirely.

---

## States

| State | Visual |
|---|---|
| Loading | Render a `Skeleton` placeholder matching the chart container's dimensions before data arrives |
| Empty | Display an `EmptyState` or descriptive message in the container; never render a chart with zero series |
| Data loaded | Axes, legend, and series rendered; tooltip appears on hover |
| Thumbnail (LineChart only) | Thumbnail mode hides all axes, split lines, legend, and tooltips — the line fills its container as a spark-line |

---

## Do's and Don'ts

**Do**
- Match the axis and tooltip date formats to the data granularity (e.g. "Jan 5, 2025" for daily, "Jan 2025" for monthly)
- Set the timezone from the user's session settings — mismatched timezones shift data points relative to expected dates
- Set numeric precision (decimal places) explicitly so it stays consistent rather than relying on default rounding
- When a `LineChart` shows two metric types with different units (e.g. impressions and CTR), give each its own Y-axis
- Use thumbnail mode for spark-lines in cards or table rows — it suppresses all chrome so the line fills the container cleanly
- Override the default series color order when a specific series must always use a brand or semantic color
- Keep series count low enough that adjacent colors stay distinguishable — the default palette leads with five distinct hues before cycling into lighter repeats, so consolidate or split the chart when later series force look-alike colors
- Draw emphasis to the one series the chart is about, if any, and let the rest recede — many equally bold series give the reader no place to start

**Don't**
- Never assign two metrics to the same Y-axis side — only one applies and the other axis falls back to default formatting; one metric per side
- Never use `PercentageStackedAreaChart` when absolute totals need to be communicated — the fixed scale hides magnitude
- Avoid filling more than three series with gradient areas — overlapping gradients obscure area boundaries
- Avoid leaving the axis date format unset on time-based charts — the default may not match the user's locale or data granularity
- Never omit the date field from a `LineChart` with time-based data — without it, x-axis ordering is undefined
- Avoid letting the same series or segment take a different color across charts on one dashboard — pin its color so a reader maps color to meaning once and it holds everywhere
- Never use washed-out or near-identical hues that drop legend and axis labels below readability — keep series colors clearly distinct from each other and from the background
- Avoid emphasizing every series at once with bold lines, filled areas, or labels — when everything competes, nothing leads the reader's eye

---

## Anatomy

**ColumnChart / LineChart**

```
  Legend  ●  Series A   ●  Series B          ← body2, content-high
  ┌──────────────────────────────────────┐
  │     │                               │
  │   Y │  ╔══╗     ╔══╗               │   ← columns (ColumnChart) / lines (LineChart)
  │     │  ║  ║     ║  ║               │
  │     │  ║  ║  ╔══╣  ╚══╗           │
  │     │  ╚══╝  ╚══╝  ╚══╝           │
  │     └───────────────────────────── │
  │          Jan     Feb     Mar        │   ← x-axis, body2
  └──────────────────────────────────────┘
         ┌────────────────────────┐
         │ Jan 15, 2025            │         ← tooltip overlay
         │ Series A    1,234       │
         │ Series B      567       │
         └────────────────────────┘
```

**PercentageStackedAreaChart**

```
  Legend  ●  Seg A   ●  Seg B   ●  Seg C
  ┌──────────────────────────────────────┐
  │ 100% │████████████████████████████████│
  │      │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│
  │  50% │▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│
  │      │▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓│
  │   0% └────────────────────────────── │
  │           Jan      Feb      Mar       │
  └──────────────────────────────────────┘
```

| Zone | Typography | Token |
|---|---|---|
| Legend labels | `body2` | `content/high` |
| Axis labels | `body2` | `content/low` |
| Axis split lines | 1px | `border/general` |
| Tooltip background | — | `surface/primary` |
| Tooltip border | — | `border/general` |

---

## Component Style Tokens

Chart chrome (legend, axes, tooltip) follows a fixed theme; the series palette is centralized and differs by version. The tooltip uses a `surface-primary` background and `border-general` border (not popover tokens), legend labels render in `content/high` body2, and axis labels in `content/low`.

```yaml
# DS2  (chart chrome from *Theme.ts; series from DEFAULT_CHART_COLORS)
chart:
  backgroundColor: "{colors.surface-primary}"   # tooltip background
  border: "1px solid {colors.border-general}"   # tooltip border + axis split lines (1px)
  textColor: "{colors.text-high}"               # legend labels (axis labels use {colors.text-low})
  typography: "{typography.body2}"              # legend + axis labels
chart-series:
  # fixed order: blue-60 → azure-40 → orange-50 → yellow-40 → green-50 (full-palette ramp tokens; 20-stop cycle)
  backgroundColor: "{colors.blue-60}"
```
```yaml
# DS3
chart:
  backgroundColor: "{colors.surface-primary}"   # tooltip background
  border: "1px solid {colors.border-general}"   # tooltip border + axis split lines (1px)
  textColor: "{colors.text-high}"               # legend labels (axis labels use {colors.text-low})
  typography: "{typography.body2}"              # legend + axis labels
chart-series:
  # fixed order: blue-70 → purple-50 → azure-40 → orange-50 → yellow-50 (full-palette ramp tokens; 20-stop cycle)
  backgroundColor: "{colors.blue-70}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

The default series color order is centralized — see DESIGN-DS3 [Colors](../DESIGN-DS3.md#colors) (Data-visualization series colors). All three components behave identically across DS2 and DS3. Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
