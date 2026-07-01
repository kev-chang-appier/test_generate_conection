# Tabs Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Tabs`, `Tab`, `TabList`, `TabPanel`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63651-15131)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-79), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=8460-98919))  
**Storybook:** [Tabs](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-tabs--docs)

---

## Overview

Tabs organize content into named sections where only one panel is visible at a time. Use them when each option reveals a distinct, large content area. For compact mode toggles with no content swap, use `SegmentedControl` or `ToggleButtonGroup` instead.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `Tabs` (default variant) | Standard navigation tabs with a blue underline indicator |
| `Tabs` (contained variant) | Tabs inside a card or where an underline would conflict with surrounding lines |

---

## States

| State | Visual |
|---|---|
| Inactive | `text-low` text, transparent background |
| Hover | Text shifts to `text-med` (DS2) / `text-high` (DS3); DS3 adds a `stateOverlay/hover` background |
| Active (default) | `primary` text and 2px `primary` bottom border |
| Active (contained) | raised `surface-primary` pill on a `surface-tertiary` track, `primary` text |
| Focused | `primary` focus ring — see [Elevation & Depth](../DESIGN-DS3.md#elevation--depth) |
| Error | Red indicator on the tab |
| Warning | Orange indicator on the tab |

---

## Do's and Don'ts

**Do**
- Use Tabs when each option reveals a distinct, large content section
- Make the tab list scrollable when it may overflow its container width
- Show a badge on a tab to surface counts or status without extra UI
- Keep tab labels short (1–3 words) and parallel in grammatical form
- Preserve panel state when users switch tabs — do not reset scroll position or form inputs

**Don't**
- Avoid using Tabs for 2–4 compact options with no content swap — use `SegmentedControl` instead
- Avoid nesting Tabs inside Tabs — reconsider the information architecture. If nesting is unavoidable, use the default variant for the outer level and the contained variant for the inner level to create a clear visual hierarchy
- Avoid mixing icon-only and text-label tabs in the same tab list — keep one treatment across the set so only the active indicator distinguishes the current tab
- Never use Tabs for multi-select — use a Checkbox group instead
- Never let tabs overflow without making the list scrollable — overflow tabs become invisible

---

## Anatomy

```
┌─────┬──────────┬──────────┬───────┐   ← TabList (32px min-height)
│ Tab │  Tab ✓   │  Tab ⚠  │  Tab  │   ← active tab: bottom indicator or fill
└─────┴──────────┴──────────┴───────┘   ← 2px blue bottom border (default variant)
  ──────────────────────────────────
  TabPanel content                       ← full content area swaps on tab change
```

Tab bar min-height 32px; 16px horizontal tab padding (vertical padding is 4px in DS2, raised to 10px top / 7px bottom in DS3); 20px icons at 8px gap. Active indicator is a 2px `primary` bottom border (default variant) or a raised `surface-primary` pill on a `surface-tertiary` track (contained variant). Labels use `headline5`. Token values are defined centrally — see DESIGN-DS3 [Colors](../DESIGN-DS3.md#colors) · [Typography](../DESIGN-DS3.md#typography).

---

## Behavior Notes

- **`Tabs`** — comes in two variants: default (underline) or contained (pill). Horizontal scroll for overflow tabs takes effect only in the contained variant. Tracks and sets the active tab.
- **`Tab`** — needs a distinct value. An optional 20px icon can sit before the label, and a count/status badge beside it. A tab can show red error styling or an orange warning indicator.

---

## Contained variant

Use the contained variant when tabs sit inside a card, panel, or any surface where a bottom-border indicator would visually merge with a surrounding border or divider line.

The active tab renders with a raised pill (`surface-primary` background on a `surface-tertiary` track, `primary` text) instead of an underline, making it legible against any background.

**When to choose contained over default**

| Situation | Use |
|---|---|
| Tabs at page or section level on a white background | Default |
| Tabs inside a card or panel with a visible border | Contained |
| Tabs on a colored or dark background | Contained |
| Tab list may overflow its container width | Contained (allows scrolling) |

---

## Component Style Tokens

```yaml
# DS2  (Tabs is Tailwind-based; v3 adds rounded tab tops + state overlays)
tab:
  textColor: "{colors.text-low}"           # inactive label
  typography: "{typography.headline5}"
  padding: "4px 16px"                       # default variant: py-4 px-16
tab-hover:
  textColor: "{colors.text-med}"
tab-selected:
  textColor: "{colors.primary}"
  border: "2px solid {colors.primary}"      # default variant: 2px bottom indicator
tab-contained:
  backgroundColor: "{colors.surface-tertiary}"   # track
  padding: "10px 16px"
  rounded: "{rounded.sm}"                   # 4px 4px 0 0 top corners
tab-contained-selected:
  backgroundColor: "{colors.surface-primary}"    # raised pill
  textColor: "{colors.primary}"
tab-list:
  border: "1px solid {colors.border-general}"     # default-variant bottom divider; min-height 32px
```
```yaml
# DS3  (rounded-radius-8 tab tops, content-high hover, blue state overlays)
tab:
  textColor: "{colors.text-low}"           # inactive label
  typography: "{typography.headline5}"
  rounded: "radius-8"                       # rounded-t-radius-8 tab tops
  padding: "10px 16px 7px"                  # v3 raises vertical padding to 10px top / 7px bottom (both variants)
tab-hover:
  textColor: "{colors.text-high}"
  backgroundColor: "{overlays.stateOverlay/hover}"
tab-selected:
  textColor: "{colors.primary}"
  border: "2px solid {colors.primary}"      # default variant: 2px bottom indicator
tab-selected-hover:
  backgroundColor: "{overlays.stateOverlay/hoverBlue}"
tab-contained:
  backgroundColor: "{colors.surface-tertiary}"   # track
  padding: "10px 16px 7px"                  # inherits the v3 vertical padding
  rounded: "radius-8"
tab-contained-selected:
  backgroundColor: "{colors.surface-primary}"    # raised pill
  textColor: "{colors.primary}"
tab-list:
  border: "1px solid {colors.border-general}"     # default-variant bottom divider; min-height 32px
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md). Availability note: the contained variant is new in DS3; the default underline variant and its behavior are unchanged.
