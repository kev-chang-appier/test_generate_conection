# Pagination Usage Guidelines

**Last updated:** 2026-06-30

**Components:** `Pagination`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=20441-265206)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-66), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=20441-265206))  
**Storybook:** [Pagination](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-pagination--docs)

## Overview

Pagination lets users navigate a dataset split across pages. Left to right it combines a **rows-per-page `TextSelect`** ("Rows"), the **record-range summary**, and a **nav cluster**: first, previous, a page `TextInput` reading `[n] / N`, next, and last. The record-range summary (e.g. "1–50 of 320 items") is supplied by the product team, giving them control over format and localization. The four nav buttons are borderless icon buttons; only the page input and the Rows select are bordered.

In DS3, `Pagination` is standalone. When used with a table, prefer `PaginationTable`, which connects pagination to the table's rows — see [table.md](table.md).

## Components at a Glance

| Component | When to use |
|---|---|
| `Pagination` | Standalone paging control for lists, grids, or any view outside a table |
| `PaginationTable` | Pagination pre-connected to `Table` or `VirtualizedTable` — see [table.md](table.md) |

## States

| State | Visual |
|---|---|
| Default | Rows-per-page select + range summary + nav cluster (first / prev / `[n] / N` page input / next / last) |
| First page | First and Prev buttons disabled |
| Last page | Next and Last buttons disabled |
| Loading | Skeleton over the info zone while new page data is fetching |
| Read-only | Page-jump input hidden; keyboard navigation off |
| Focus | Focus ring on the page-jump input — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Disabled | Prev/next disabled — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |

## Do's and Don'ts

**Do**
- Always provide the record-range summary — it is the only place that count appears
- Reset to page 1 when the user changes items-per-page — the previous page index is likely out of range after a density change
- Show the items-per-page selector only when the dataset is large enough that changing density meaningfully helps (typically 100+ records)
- Show the loading skeleton while new page data is fetching to prevent stale counts from confusing users

**Don't**
- Never put `Pagination` inside a table that already uses `PaginationTable` — duplicate controls are redundant and conflict
- Never offer an empty items-per-page selector — hide the selector entirely instead
- Avoid showing `Pagination` when the full dataset fits on one page — the control adds noise with nothing to navigate
- Avoid turning off keyboard navigation on large datasets — users with many pages need the direct jump input
- Avoid hiding the page-jump input without surfacing the current page elsewhere — include it in the record-range summary so users still know where they are

## Anatomy

```
  ┌────────────────────────────────────────────────────────────────────────────────┐
  │  Rows [ 50 ▾ ]     1–50 of 320 items        ⏮  ◁   [ 3 ] / 7   ▷  ⏭             │
  └────────────────────────────────────────────────────────────────────────────────┘
     ↑ rows-per-page    ↑ record-range summary    ↑ nav cluster:
       TextSelect                                   first · prev · page TextInput `[n] / N` · next · last
```

| Element | Spec |
|---|---|
| Rows-per-page | Bordered `TextSelect` ("Rows") — changing it resets to page 1. Shown only when density choice meaningfully helps (typically 100+ records). |
| Record-range summary | Product-supplied text ("1–50 of 320 items"); the only place the total count appears. |
| First | Borderless icon button, `jumpToFirstOutlined20`; disabled on page 1. |
| Prev | Borderless icon button, `directionalDefaultLeftOutlined20` (a chevron, not a full arrow); disabled on page 1. |
| Page input | Bordered `TextInput` reading `[n] / N` — the editable current page over the total. |
| Next | Borderless icon button, `directionalDefaultRightOutlined20` (chevron); disabled on the last page. |
| Last | Borderless icon button, `jumpToLastOutlined20`; disabled on the last page. |

## Component Style Tokens

```yaml
# DS2  (bordered surface bar; controls inherit from TextInput / TextSelect sub-controls)
pagination:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"             # text-high
  border: "1px solid {colors.border-general}" # top border only
  height: 56px                                # 44px with no nav input and no per-page selector
  padding: 12px 16px
  typography: "{typography.body1}"            # 14px / 20px
```
```yaml
# DS3  (transparent, borderless bar; sub-controls use the small input/select size)
pagination:
  backgroundColor: "transparent"
  textColor: "{colors.text-high}"             # text-high
  height: 32px                                # 20px with no nav input and no per-page selector
  padding: 0px
  typography: "{typography.body1}"            # 14px / 20px
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md). Border, radius, focus, and disabled treatment of the page-jump input and per-page selector come from the `TextInput` / `TextSelect` sub-controls.

Table integration differs by version: in DS2 pagination was embedded in `Table`; in DS3 `Pagination` is standalone and tables use `PaginationTable` (see [Components at a Glance](#components-at-a-glance)).
