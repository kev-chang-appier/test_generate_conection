# Icons

883 icons in `source.json`. Each entry is keyed by a camelCase name encoding style and size.

## Naming convention

```
{iconName}{Style}{size}
```

- **iconName** — camelCase descriptor (e.g. `addCircle`, `accountSettings`, `broadcast`)
- **Style** — `Outlined` (default for all UI) or `Solid` (active/selected states only)
- **size** — `16` | `20` | `24` | `28` | `32` | `36` | `48`

Examples: `addOutlined20`, `addCircleSolid24`, `lockOutlined16`

> Note: The JSON has minor inconsistencies — some keys use lowercase style (`outlined`, `solid`) and one has a typo (`outlned`). When searching, try both cases if a lookup fails.

## Common UI patterns → icon name

> **No chevron icons exist in this library.** Use these instead:

| UI pattern | Icon key (20px default) |
|---|---|
| Expand / collapse (accordion, tree, sidebar) — chevron equivalent | `directionalDefaultDownOutlined20` / `directionalDefaultUpOutlined20` |
| Dropdown open indicator (select, menu, filter) | `directionalTriangleArrowDownSolid20` |
| Table column sort ascending / descending | `directionalArrowUpOutlined20` / `directionalArrowDownOutlined20` |
| Breadcrumb / inline nav arrow | `directionalArrowRightOutlined16` |
| Pagination prev/next | `directionalArrowLeftOutlined20` / `directionalArrowRightOutlined20` |
| Back navigation | `directionalArrowLeftOutlined20` |

---

## Size guidance (from DESIGN.md)

| Size | When to use |
|---|---|
| 16px | Inline text, tooltip triggers, compact row actions |
| 20px | Default — buttons, inputs, navigation, table actions |
| 24px | Prominent standalone icons, empty state illustrations |

## Icon data shape

```json
"addOutlined20": {
  "name": "add",
  "style": "outlined",
  "size": 20,
  "body": "<path d=\"...\" />"
}
```

## How to embed in HTML

Add a hidden SVG sprite block near the top of `<body>` (already present in the portal shell template):

```html
<svg xmlns="http://www.w3.org/2000/svg" style="display:none">
  <symbol id="addOutlined20" viewBox="0 0 20 20">
    <!-- paste value of source.json["addOutlined20"].body here -->
  </symbol>
</svg>
```

Reference with:

```html
<svg width="20" height="20" fill="currentColor" fill-rule="evenodd">
  <use href="#addOutlined20"></use>
</svg>
```

Always include `fill-rule="evenodd"`. 594 of 653 outlined icons use compound paths — multiple subpaths where an inner area is meant to be hollow (cart basket, lock keyhole, gear center, etc.). Without `evenodd`, the SVG default `nonzero` winding rule fills those interiors solid, making the icon appear as a filled blob. Single-path icons are unaffected by this attribute.

Set color via `fill="currentColor"` and control it with CSS `color`.

## Icon color rules

| Context | Color |
|---|---|
| Decorative / inactive | `text-low` → `rgba(0,10,58,0.57)` |
| Interactive / active | `primary` → `#296AFF` |
| On colored surface | `text-white-hold` → `#FFFFFF` |
