# ConnectorCard Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `ConnectorCard`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63503-12061)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=24908-135403), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=60514-6077))  
**Storybook:** [ConnectorCard](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-connectorcard--docs)

## Overview

`ConnectorCard` lets users discover, compare, and connect third-party platform integrations (LINE, Instagram, TikTok, etc.) from a browsable grid. Each tile follows a fixed layout — a colorful platform icon, a title, optional category tags, and a connection status badge. For general-purpose browsable or selectable cards, use `Card` instead.

## Components at a Glance

| Component | When to use |
|---|---|
| `ConnectorCard` | Integration/connector grid; fixed-layout tiles with platform icon, status badge, and category tags |
| `Card` | General browsable or selectable cards without domain-specific status or a fixed layout |

## Variants

**Element type**

A tile acts as a link by default, navigating to a connector detail page. Make it behave as a button when the tile triggers an inline action (e.g. opens a dialog) rather than navigating.

**With tags**

Add category labels (e.g. E-commerce, Communication) to help users scan by integration type when many connectors appear on the page.

**External link**

Show a link-out icon on the tile when it opens an external destination. Always give the icon a hover label so its purpose is clear.

## States

| State | Visual |
|---|---|
| Default | White surface; platform icon prominently centered |
| Hover | Border darkens (`border-general` → `border-emphasis`); pointer cursor |
| Disabled | Reduced opacity, no interaction |

**Status values**

A status badge at the bottom of the tile communicates connection state:

| Status | Indicator | Typical label |
|---|---|---|
| Available | Ready to connect | "Connect" |
| Connected | Active connection | "Connected" |
| Error | Requires action | "N errors" |
| Info | Informational | "Web SDK required" |
| Warning | Partial issue | "N disconnected" |
| Loading | Spinner | Omit — no label during load |
| _(none)_ | No indicator | Neutral descriptive text |

## Tiles in a Grid

`ConnectorCard` almost always appears in a browsable grid. For grid layout rules (equal-size tiles, equal-height rows, uniform gutters, grouping under one heading), see [Placement patterns → Collections / grid](../DESIGN-DS3.md#placement-patterns). ConnectorCard-specific guidance:

- **Same internal order on every tile.** Keep icon, title, tags, then status in the same positions across the grid (see Anatomy) so users scan one tile and know where to look on the rest.
- **One status reading per tile.** Pair each status with a single status label; don't stack extra inline badges or copy that competes with the status indicator for the tile's one summary cue.

## Do's and Don'ts

**Do**
- Make tiles navigate to a connector detail page; make them behave as a button only when they open an inline dialog.
- Lay tiles out on a uniform grid with equal sizing and even gutters so the set scans as one collection.
- Always pair the status indicator with a status label — don't rely on the indicator color alone to communicate state.
- Use category tags to expose integration types when the connector list is long enough to need filtering.
- Always give the external-link icon a hover label — without it the icon has no accessible meaning.

**Don't**
- Avoid letting one tile grow taller than its row — wrap or truncate the title within a fixed tile so the grid keeps even rows.
- Never use `ConnectorCard` for non-platform content — use `Card` for general option pickers.
- Never leave a tile in the loading status permanently; always resolve it to a final state once the connection check completes.
- Avoid omitting both the status indicator and label when the connection state is known — users need feedback on whether an integration is active.
- Avoid inventing per-tile category wording — draw labels from one shared, concise set (e.g. Communication, E-commerce) so the same category reads identically across every connector and stays scannable.

## Anatomy

```
  ┌──────────────────────────┐
  │         [icon]           │  ← colorful platform icon
  │                          │
  │  Title            [↗]    │  ← title; [↗] for an external link
  │  [tag] [tag]             │  ← category tags (optional)
  │                          │
  │  ● status label          │  ← status indicator + label
  └──────────────────────────┘
```

## Component Style Tokens

`ConnectorCard` is DS2-only — there is no `v3/` implementation; the blocks below are identical.

```yaml
# DS2  (from src/components/ConnectorCard/ConnectorCard.tsx)
connectorcard:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"           # title (headline4)
  border: "1px solid {colors.border-general}"
  rounded: "{rounded.md}"                    # rounded-radius-8
  width: 200px                              # min 200px, max 300px tile
  minHeight: 158px                          # min-h-[158px]; status row adds a 40px-tall band
  padding: 8px 8px 12px                      # pt-8 px-8 pb-12
  typography: "{typography.headline4}"      # title
connectorcard-hover:
  border: "1px solid {colors.border-emphasis}"
connectorcard-active:
  backgroundColor: "{colors.state-pressed-primary}"   # component state fill (full-palette token)
connectorcard-tag:
  backgroundColor: "{colors.semantic-bg-gray}"        # tint token
  textColor: "{colors.gray-70}"             # full-palette ramp token
  rounded: "{rounded.xs}"                   # rounded-radius-2
  typography: "{typography.headline6}"
connectorcard-status:
  textColor: "{colors.text-med}"            # status label; status icon uses semantic-red/green/orange/azure
  typography: "{typography.body1}"
```
```yaml
# DS3  (same source — no v3 file)
connectorcard:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-high}"
  border: "1px solid {colors.border-general}"
  rounded: "radius-8"
  width: 200px
  minHeight: 158px                          # min-h-[158px]; status row adds a 40px-tall band
  padding: 8px 8px 12px
  typography: "{typography.headline4}"
connectorcard-hover:
  border: "1px solid {colors.border-emphasis}"
connectorcard-active:
  backgroundColor: "{colors.state-pressed-primary}"
connectorcard-tag:
  backgroundColor: "{colors.semantic-bg-gray}"
  textColor: "{colors.gray-70}"             # full-palette ramp token
  rounded: "radius-2"
  typography: "{typography.headline6}"
connectorcard-status:
  textColor: "{colors.text-med}"
  typography: "{typography.body1}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

`ConnectorCard` is DS2 only — there is no DS3 equivalent. For DS3 integration grids, compose a layout using `Card` with a platform icon in its content area and a `Badge` or status indicator in its action area. Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
