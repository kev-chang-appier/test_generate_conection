# Table Usage Guidelines

**Last updated:** 2026-06-30

**Components:** `VirtualizedTable`, `PaginationTable`, `EditColumnConfig`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=7413-49381)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-80))  
**Storybook:** [Table components](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-table-virtualizedtable--docs)

---

## Overview

The table family renders and manages tabular datasets. Both components render only the visible rows, making them suitable for large datasets.

> **Note for designers:** `Table-cell/*` Figma components are design-time only — they describe how cells should look, not how they are built.

---

## Components at a Glance

| Component | Use when |
|---|---|
| `VirtualizedTable` | You need a scrollable table with no built-in pagination UI; ideal for very large or continuously loading datasets |
| `PaginationTable` | You want page-by-page navigation with an integrated pagination footer; carries all the same features as `VirtualizedTable` |

---

## Cell Types

All cell types are described as Figma design components, and any of them can be reproduced as custom cell content.

**Content cells**

| Cell type | When to use |
|---|---|
| Primary | Default single-line text, with optional leading icon/image/avatar |
| Text | Simple text-only cell |
| Text + Subtext + Icon | Two-line content with a supporting icon |
| LinkText + Subtext + Icon | Same as above but primary text is a clickable link |
| Link | Clickable text only |
| Number | Numeric value (right-aligned by default) |
| Number + Bar | Number with a proportional fill bar |
| DateTime | Date and/or time value |
| Status | Badge or colored indicator |
| Tags | One or more tag chips |
| Icons | One or more icon indicators |
| Icon button | Inline action button (icon only). When a row exposes **multiple** icon actions (e.g. edit + delete), right-align the action column and space them with the standard action-button group gap (**8px DS2 / 12px DS3** — see [Placement patterns](../DESIGN-DS3.md#placement-patterns)), and pair each with a `Tooltip` (see [button.md](button.md)). |
| Rating | Star or score display |
| Performance | Metric with directional indicator |
| Checkbox | Inline checkbox for row-level toggle |
| Select | Inline dropdown select |
| Switch | Inline toggle switch |

**Structure cells**

| Cell type | When to use |
|---|---|
| Header | Column header (internal — do not use directly in code) |
| Group header | Parent header spanning child columns |
| Skeleton | Loading placeholder (internal — shown while data loads) |
| Empty | Placeholder for sparse columns |
| Space filler | Rightmost column to absorb leftover width when content is narrow |

**Custom cells**

When no standard cell type fits, create a custom cell. Mirror the Figma custom cell guidelines: maintain baseline alignment with adjacent columns, and reuse existing DS spacing and typography.

---

## Column Configuration

### Sticky columns

Freeze the leftmost one or more columns so they stay in place while the rest scroll horizontally.

Make the **primary column** sticky. The primary column usually contains the key user-readable identifier of a row (e.g. campaign name, audience name) so users can always tell which row they are looking at while scrolling horizontally through wide tables.

### Sticky header

A sticky header keeps column labels visible while body rows scroll.

**When to use**

Enable sticky header on any table whose body can scroll vertically — it is the expected default. Disable only when the table is always fully visible and has no vertical scroll.

**Visual treatment**

- Apply a bottom shadow or a `border-general` divider under the header row when body content scrolls beneath it; the `surface-tertiary` background alone is not enough to anchor the header against rows in motion.
- Keep the `surface-tertiary` background on the sticky header consistent — do not change header appearance based on scroll position beyond adding the shadow.

**Combining with sticky columns**

When a sticky header and sticky columns are active together, the top-left intersection cell (the frozen column's header) must be frozen on both axes. Verify that its background matches `surface-tertiary` and is not exposed by the scrolling body rows behind it.

**Do**
- Enable sticky header by default on all scrollable tables.
- Add a shadow or bottom border when body rows scroll under the header to preserve visual separation.

**Don't**
- Disable sticky header on vertically scrollable tables — users lose column context and must scroll back to the top to reorient.
- Use a different background on the sticky header than `surface-tertiary` — header appearance must remain consistent throughout the scroll interaction.

---

### Grouped headers

Nested column headers organize multi-level data. Sorting and resizing apply only to child columns — the parent header spans the combined width of its children.

```
┌──────────────────────────────┐
│       Revenue (parent)       │
├──────────────┬───────────────┤
│  Q1 (child)  │  Q2 (child)   │
```

> DS3 note: Grouped headers alongside editable column settings are not yet supported. Bring use cases to the DS team if needed.

### Resizable columns

**Allow column resizing by default.** Users routinely encounter columns too narrow or too wide for their content — width control eliminates that friction.

**Rules:**

- Make every data column resizable; only opt out for icon-only, checkbox, or fixed-action columns where a variable width makes no sense.
- Set a minimum width to prevent columns from collapsing into unreadability (typically 60–80 px for short labels, 120 px for text-heavy columns).
- Persist user-adjusted widths so the layout survives page refreshes.
- When column widths are persisted, provide a **Reset columns** control (e.g. in the column settings menu) so users can recover sane defaults.
- Avoid making sticky columns resizable when they share a scroll area with non-sticky columns — the shadow/border treatment can break. Verify visually if you enable it.

> DS3 note: Resizing is supported on child columns in grouped headers but not on parent group headers.

### Edit Column Config

`EditColumnConfig` is a dialog that lets users show or hide columns and adjust the number of sticky columns. It is a DS2 component; no v3 equivalent is currently available.

**Placement**

Place the trigger — an `IconButton` with an edit-columns icon — at the top-right of the table. Never leave it orphaned on an empty row: if there is no search bar or action bar, pair it with adjacent controls so it sits in a populated row.

```
┌──────────────────────────────────────────────────┐
│  🔍 Search   [Filter ▼]               ⊞ Columns │  ← top-right trigger
├──────────────────────────────────────────────────┤
│  Col A          Col B           Col C            │
```

**Do**
- Always persist the chosen column layout so it survives page refreshes.
- Mark the primary identifier column as non-removable so users can always orient themselves. Exclude it from the toggleable list or keep it always checked.
- Apply changes only after the user confirms — do not update the table live while they are still toggling.

**Don't**
- Never let the user hide every column — keep Apply unavailable when nothing is selected, and explain why.
- Never place the trigger on its own isolated row. If there are no other controls, integrate it into the table header area rather than floating it alone above the table.

---

## Row Height & Alignment

### Row height

| Size | DS2 (v2) | DS3 (v3) | When to use |
|---|---|---|---|
| X_LARGE | 64px | 68px (default v3) | Images, avatars, or tall content |
| L | 56px | 52px | Rich content with subtext |
| M | 48px (default v2) | — (no v3 M size) | Standard data tables |
| S | 40px | 36px | Dense, compact layouts |

Use a consistent row height across all rows. Dynamic row height lets rows expand to fit their content but carries a rendering performance cost — avoid it for datasets with 100+ rows.

### Text alignment

| Content type | Alignment | Reason |
|---|---|---|
| Text, labels | Left | Default; natural reading direction |
| Numbers | Right | Enables quick scanning and comparison across rows |
| Short, fixed-width content | Center | Use cautiously — only when column width and content are both fixed |

Ensure all numbers in a column have the same number of decimal places when right-aligned.

### Vertical alignment

- **Center** — use with fixed row heights (most tables)
- **Top** — use with dynamic row heights

Maintain text baseline alignment across adjacent columns. Input and Select cell variants have intentionally reduced top padding so their text baselines align with neighboring text cells.

### Text overflow

Cell text follows the system-wide truncation rule — single-line ellipsis on overflow, full value on hover in a `Tooltip` (see DESIGN-DS3 [Text overflow](../DESIGN-DS3.md#text-overflow); DS2 in [DESIGN-DS2.md](../DESIGN-DS2.md#text-overflow)). Table-specific notes:

- Truncated cell text must never push the column wider or wrap to a second line.
- A two-line cell truncates its primary and secondary text independently.
- Give text-heavy columns a sensible default and minimum width (see [Resizable columns](#resizable-columns)) so the common case reads without a hover — truncation is a fallback, not a sizing strategy.

**Do**
- Truncate overflowing cell text with an ellipsis and surface the full value in a hover tooltip.

**Don't**
- Never wrap, clip, or hide overflowing cell text with no way to read it — a truncated value must always be recoverable on hover.

---

## Selection

| Mode | Visual |
|---|---|
| None (read-only) | No selection controls |
| Single | Radio button per row |
| Multiple | Checkbox per row + select-all in header |

**Critical:** Always identify rows by a unique field in the data, not their position. Otherwise selection latches to row order and breaks when rows are added, removed, or reordered.

Selection is tracked outside the table — the surrounding view owns which rows are selected and updates that set as the user clicks.

---

## Expandable Rows (Layered Content)

Tables support up to three levels of expandable row hierarchy.

| Layer | Background token | Notes |
|---|---|---|
| Layer 1 (base) | `surface-primary` | Default surface |
| Layer 2 (expanded child) | `surface-secondary` | Highlighted / expanded rows |
| Layer 3 (deep nested) | `surface-quaternary` | Optional; use sparingly |

Token values are defined centrally — see DESIGN-DS3 [Colors](../DESIGN-DS3.md#colors).

Spacing within expanded rows:
- **16px** between checkbox/expand control and row content
- **12px** between groups within the content area

Keep hierarchy to a maximum of 3 layers. If your design requires more depth, move the extra content into a Drawer or Dialog instead.

> Tip: Detach the DS template and create your own expanded content component when needed. Use background color and optional indentation to establish visual hierarchy.

---

## Performance Guidelines

- Both components render only the visible rows.
- **Fixed row height** is significantly faster than dynamic row height. Use dynamic height only when the content genuinely requires it.
- For datasets with 100+ dynamic rows, measure rendering performance before turning on dynamic row height.
- Use `PaginationTable` to cap the rendered row count when total data is large; this keeps the visible set small even if all data is loaded upfront.

---

## States

### Loading

Show skeleton rows in the table body while data loads. The pagination footer can show its own loading state independently.

### Empty

The empty state renders in a centered 600×80px container. Always provide a message and, when appropriate, a CTA to help the user take action.

### Summary rows

Summary rows (totals, aggregates) appear as a pinned row at the top or bottom of the table body.

---

## Do's and Don'ts

**Do**
- Use a space filler column as the rightmost column when table content is narrower than the container
- Keep numbers in a column to a consistent decimal precision when right-aligning
- Use grouped headers to organize related columns under a shared parent label
- Identify rows by a unique data field whenever selection is enabled
- Place bulk actions or contextual controls in the header area above the table
- Place the `EditColumnConfig` trigger alongside search or other controls — never orphan it on an empty row
- Always define a meaningful empty state — tell users why there is no data and what to do (no results vs. no data yet vs. filtered out)
- Write column headers as nouns or short noun phrases — not verbs or full sentences
- Show a loading state during initial data fetch and after filter/sort changes to prevent stale-data flashes
- Render clickable cell content with the Link or LinkText cell type so it reads as interactive — plain text cells that trigger navigation are indistinguishable from static values
- Treat sorting consistently across all sortable columns so the sort affordance and active-sort indicator appear the same on every column a user can sort
- Left-align text columns and right-align numeric columns so values line up for scanning down the column
- Keep cell styling restrained — reserve color, weight, and Status badges for values that genuinely need attention so the data reads before the chrome
- Make the active-sort indicator and selected-row treatment unmistakable, not a faint tint — a user must be able to tell at a glance which column is sorted and which rows are selected

**Don't**
- Never exceed 3 expandable layers — move deeper content into a Drawer or Dialog
- Never reproduce individual `Table-cell/*` Figma components verbatim — they are design references, not building blocks
- Never omit a unique row identifier when selection is enabled; this causes selection bugs with dynamic data
- Avoid dynamic row height on large datasets without validating rendering performance
- Never allow users to hide all columns in `EditColumnConfig` — require at least one column to remain visible
- Avoid center-aligning text unless the column width and content are both fixed and short
- Avoid styling many cells with color, bold, or badges at once — competing emphasis flattens the row and the meaningful values stop standing out
- Never signal the active sort or a selected row with a tint so faint it blends into the row background — the current state must be obvious without hunting
- Never enclose the pagination control inside the table's card or render it as a bordered footer band — in DS3 it is a standalone, transparent control beneath the table (the enclosed footer is the DS2 treatment)

---

## Anatomy

```
┌─────────────────────────────────────────┐  ← Controls bar (32px)
│  🔍 Search   [Filter-Select ▼]  Filter  │    Search + Filter-Select + Filter button
├─────────────────────────────────────────┤
│  ☐  Col A          Col B       Col C   │  ← Header row (44px v3 / 40px v2, surface-tertiary bg)
├─────────────────────────────────────────┤
│  ☐  Row 1 data     ...         ...     │  ← Body rows (height varies by size)
│  ☐  Row 2 data     ...         ...     │    0.5px border-general bottom border
│  ☐  Row 3 data     ...         ...     │
├─────────────────────────────────────────┤
│  Total             —           999     │  ← Summary row (optional)
├─────────────────────────────────────────┤
└─────────────────────────────────────────┘
   ← 1  2  3 … →     20 / page   100 items     ← Pagination (PaginationTable only): standalone,
                                                  transparent control below the table — not a
                                                  bordered footer inside the card
```

| Zone | Height | Notes |
|---|---|---|
| Controls bar | 32px | Search input + Filter-Select + Filter button |
| Header row | 44px (v3, default MEDIUM) / 40px (v2) | `surface-tertiary` background; `headline5` / `text-med` labels |
| Body rows | v3: XL 68 · L 52 · S 36px (no M) · v2: XL 64 · L 56 · M 48 · S 40px | Default is **X_LARGE** (v3) or **M** (v2) |
| Pagination | PaginationTable only | Standalone, transparent, borderless control (32px in DS3) rendered below the table body — not enclosed in the table card. Height and tokens come from `Pagination` (see [pagination.md](pagination.md)); the embedded bordered 56px footer is the DS2 treatment. |
| Empty state | 600×80px | Centered; custom content |

---

## VirtualizedTable

Scrollable table with no built-in pagination UI. Rows scroll within a fixed height — only visible rows are rendered.

---

## PaginationTable

Adds an integrated pagination footer to `VirtualizedTable`. All the same features apply, plus page-by-page navigation.

---

## Component Style Tokens

```yaml
# DS2  (from DESIGN-DS2.md → components)
table-header:
  backgroundColor: "{colors.surface-tertiary}"
  textColor: "{colors.text-med}"
  height: 40px
  typography: "{typography.headline5}"
```
```yaml
# DS3  (from DESIGN-DS3.md → components)
table-header:
  backgroundColor: "{colors.surface-tertiary}"
  textColor: "{colors.text-med}"
  height: 44px
  typography: "{typography.headline5}"
```

Table-specific token roles beyond the header: `surface-primary` / `surface-secondary` / `surface-quaternary` (expandable-row layers 1–3), `border-general` (0.5px row bottom border), `table/table text` (body cell primary text), `table/table sub text` (body cell secondary text). In DS3 the header color is no longer adjustable — it always uses the `CARD` color.

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).
