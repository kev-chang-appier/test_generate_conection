---
last_updated: 2026-06-30
version: alpha
name: Appier Design System 2.0
description: "A professional B2B SaaS design system. Clean, utilitarian, and data-dense — optimized for power users."

colors:
  # Primary / Brand
  primary:         "#296AFF"
  primary-hover:   "#0E4EFF"
  primary-pressed: "#0032E0"

  # Text (Light theme)
  # Figma DS2 uses "content/" namespace: content/high, content/med, content/low
  text-high:       "#000A3A"          # content/high — 100%
  text-med:        "rgba(0,10,58,0.80)"  # content/med — 80% (verified DS2.0 Figma MCP 2026-05-16)
  text-low:        "rgba(0,10,58,0.57)"  # content/low — 57% (verified DS2.0 Figma MCP 2026-05-16)
  text-low-minus:  "rgba(0,10,58,0.45)"  # placeholder text only; no Figma DS2 token — value unverified
  text-white-hold: "#FFFFFF"

  # Surfaces (Light theme) — darkest to lightest
  surface-quaternary: "#EDEEF1"
  surface-tertiary:   "#F2F3F5"
  surface-secondary:  "#F7F8F9"
  surface-primary:    "#FFFFFF"
  surface-popover:    "#FFFFFF"
  surface-card:       "#FAFBFC"   # Card background — same value in DS2 and DS3 (design-consistent)
  surface-blue:       "#296AFF"

  # Borders (Light theme)
  border-general:   "#D9DAE1"
  border-emphasis:  "#B3B6C4"
  border-highlight: "#999DB0"
  border-popover:   "#DEDFE5"  # confirmed Figma DS2 token: UI/border/popover

  # Red ramp — danger button states (Figma: 2_0 L&D/Red/*)
  red-70: "#E41754"  # Danger solid button bg (normal)
  red-60: "#C3003A"  # Danger solid button hover
  red-50: "#9E002F"  # Danger solid button pressed

  # Semantic foreground colors
  semantic-red:     "#FB4078"
  semantic-orange:  "#FE8022"
  semantic-yellow:  "#F3AF00"
  semantic-green:   "#00BA77"
  semantic-teal:    "#00B4BF"
  semantic-azure:   "#00AEE6"
  semantic-blue:    "#296AFF"
  semantic-purple:  "#864CFF"
  semantic-fuchsia: "#F43BC5"
  semantic-gray:    "#80849C"

  # Semantic background tints
  semantic-bg-red:     "#FFEBF1"
  semantic-bg-orange:  "#FFEEE1"
  semantic-bg-yellow:  "#FFF899"
  semantic-bg-green:   "#C7FFEB"
  semantic-bg-teal:    "#C9FCFF"
  semantic-bg-azure:   "#DCF6FF"
  semantic-bg-blue:    "#EAF1FF"
  semantic-bg-purple:  "#F3ECFF"
  semantic-bg-fuchsia: "#FFE9F9"
  semantic-bg-gray:    "#EDEEF1"

  # Semantic text-on-tint (AA-safe foreground for a matching semantic-bg-* tint — darker than the
  # semantic-* fill stop; e.g. Badge tints, tags). Pair each with its same-hue background tint.
  # (Note: a record's status in DS2 is the dot+label Status component, not a tinted pill — see status.md.)
  semantic-text-red:     "#C3003A"
  semantic-text-orange:  "#A34600"
  semantic-text-yellow:  "#8D6500"
  semantic-text-green:   "#00723C"
  semantic-text-teal:    "#006F76"
  semantic-text-azure:   "#006B98"
  semantic-text-blue:    "#0E4EFF"
  semantic-text-purple:  "#712FFF"
  semantic-text-fuchsia: "#B50086"
  semantic-text-gray:    "#333B61"

  # Interaction-state solid fills (replace the base fill; not overlays)
  state-pressed-primary:   "#E5E7EB"  # secondary / emphasis button pressed (Figma: state/pressedPrimary)

  # Dark theme overrides
  dark-primary:            "#5C93FF"
  dark-primary-hover:      "#70A0FF"
  dark-primary-pressed:    "#98BBFF"
  dark-surface-quaternary: "#121212"
  dark-surface-tertiary:   "#191919"
  dark-surface-secondary:  "#2B2B2B"
  dark-surface-primary:    "#212121"
  dark-surface-popover:    "#262626"
  dark-surface-card:       "#1D1D1D"
  dark-text-high:          "#FFFFFF"
  dark-text-med:           "rgba(255,255,255,0.80)"
  dark-text-low:           "rgba(255,255,255,0.55)"
  dark-border-general:     "#4C4C4C"
  dark-border-emphasis:    "#666666"
  dark-border-highlight:   "#808080"

  # PolarDark (navigation sidebar only)
  polar-dark-surface:        "#1A234E"
  polar-dark-blue-normal:    "#4886FF"
  polar-dark-border-general: "#4C4C4C"

typography:
  special:
    fontFamily: Open Sans
    fontSize: 2.5rem
    fontWeight: 600
    lineHeight: 56px
    letterSpacing: 0.4px

  headline1:
    fontFamily: Open Sans
    fontSize: 1.875rem
    fontWeight: 600
    lineHeight: 36px
    letterSpacing: 0.4px

  headline2:
    fontFamily: Open Sans
    fontSize: 1.5rem
    fontWeight: 600
    lineHeight: 32px
    letterSpacing: 0.4px

  headline3:
    fontFamily: Open Sans
    fontSize: 1.25rem
    fontWeight: 600
    lineHeight: 28px
    letterSpacing: 0.4px

  headline4:
    fontFamily: Open Sans
    fontSize: 1rem
    fontWeight: 600
    lineHeight: 24px
    letterSpacing: 0.2px

  headline5:
    fontFamily: Open Sans
    fontSize: 0.875rem
    fontWeight: 600
    lineHeight: 20px
    letterSpacing: 0.2px

  headline6:
    fontFamily: Open Sans
    fontSize: 0.75rem
    fontWeight: 600
    lineHeight: 16px
    letterSpacing: 0.2px

  body1:
    fontFamily: Open Sans
    fontSize: 0.875rem
    fontWeight: 400
    lineHeight: 20px
    letterSpacing: 0.2px

  body1-highlight:
    fontFamily: Open Sans
    fontSize: 0.875rem
    fontWeight: 700
    lineHeight: 20px
    letterSpacing: 0.2px

  body2:
    fontFamily: Open Sans
    fontSize: 0.75rem
    fontWeight: 400
    lineHeight: 16px
    letterSpacing: 0.2px

  body2-highlight:
    fontFamily: Open Sans
    fontSize: 0.75rem
    fontWeight: 700
    lineHeight: 16px
    letterSpacing: 0.2px

  code1:
    fontFamily: Fira Code
    fontSize: 0.875rem
    fontWeight: 500
    lineHeight: 20px
    letterSpacing: 0.2px

  code2:
    fontFamily: Fira Code
    fontSize: 0.75rem
    fontWeight: 500
    lineHeight: 16px
    letterSpacing: 0.2px

rounded:
  xs: 2px
  sm: 4px
  md: 8px

spacing:
  xs:  4px
  sm:  8px
  md:  12px
  lg:  16px
  xl:  24px
  2xl: 32px
  3xl: 48px

components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.text-white-hold}"
    rounded: "{rounded.sm}"
    height: 32px
    padding: 6px 12px
    typography: "{typography.headline5}"
  button-primary-hover:
    backgroundColor: "{colors.primary-hover}"
  button-primary-pressed:
    backgroundColor: "{colors.primary-pressed}"
  button-secondary:
    backgroundColor: "{colors.surface-primary}"
    border: "1px solid {colors.border-general}"
    textColor: "{colors.text-med}"  # content/med (80%) — verified DS2.0 Figma MCP 2026-05-16
    rounded: "{rounded.sm}"
    height: 32px
    padding: 6px 12px
    typography: "{typography.headline5}"
  button-secondary-hover:
    backgroundColor: "{colors.surface-tertiary}"
  button-secondary-pressed:
    backgroundColor: "{colors.state-pressed-primary}"
  button-emphasis:
    backgroundColor: "{colors.surface-primary}"
    border: "1px solid {colors.primary}"
    textColor: "{colors.primary}"  # #296AFF — verified DS2.0 Figma MCP 2026-05-16
    rounded: "{rounded.sm}"
    height: 32px
    padding: 6px 12px
    typography: "{typography.headline5}"
  button-emphasis-hover:
    backgroundColor: "{colors.surface-tertiary}"  # #F2F3F5 — state/hoverPrimary
    border: "1px solid {colors.primary-hover}"     # #0E4EFF
  button-emphasis-pressed:
    backgroundColor: "{colors.state-pressed-primary}"
    border: "1px solid {colors.primary-hover}"     # #0E4EFF
  button-danger:
    backgroundColor: "{colors.red-70}"
    textColor: "{colors.text-white-hold}"
    rounded: "{rounded.sm}"
    height: 32px
    padding: 6px 12px
    typography: "{typography.headline5}"
  button-danger-hover:
    backgroundColor: "{colors.red-60}"
  button-danger-pressed:
    backgroundColor: "{colors.red-50}"
  button-small:
    height: 24px
  input:
    backgroundColor: "{colors.surface-primary}"
    textColor: "{colors.text-high}"
    rounded: "{rounded.sm}"
    height: 32px
    height-tall: 56px
    padding: 6px 12px
    typography: "{typography.body1}"
  input-placeholder:
    textColor: "{colors.text-low-minus}"
  content-card:
    backgroundColor: "{colors.surface-card}"
    rounded: "{rounded.md}"
    padding: 20px
  dialog:
    backgroundColor: "{colors.surface-primary}"
    rounded: "{rounded.md}"
    padding: 24px
  table-header:
    backgroundColor: "{colors.surface-tertiary}"
    textColor: "{colors.text-med}"
    height: 40px
    typography: "{typography.headline5}"
  # Search field — pill radius (SearchWrapper, 20px on a 32px field; not overridden in v3)
  search:
    backgroundColor: "{colors.surface-primary}"
    textColor: "{colors.text-high}"
    border: "1px solid {colors.border-general}"
    rounded: "20px"
    height: 32px
    padding: "0 12px"
    typography: "{typography.body1}"
  search-placeholder:
    textColor: "{colors.text-low-minus}"
  # Filter chip — pill chip; solid border
  filter:
    backgroundColor: "{colors.surface-primary}"
    textColor: "{colors.text-high}"
    border: "1px solid {colors.border-general}"
    rounded: "20px"
    height: 32px
    padding: "6px 8px 6px 16px"
    typography: "{typography.body1}"
  filter-focused:
    border: "1px solid {colors.primary}"   # focused / popover open: + 2px outline at 2px offset
  # NOTE: There is no tinted "status badge" component in DS2. A record's status is shown with the
  # Status component — a semantic-colored dot + a `text-high` label, with NO background tint or pill
  # (see component-guidelines/status.md). For tinted labels use Tag/Badge (those are real). Do not
  # build a tinted status pill from the semantic-bg-* tokens.
  # Drawer — flush-edge side panel (no radius), full viewport height, Shadow M; MEDIUM 720px default
  # (SMALL 348 / LARGE 1000, via the `size` prop). 48px header, 16px content padding.
  drawer:
    backgroundColor: "{colors.surface-primary}"
    textColor: "{colors.text-high}"
    rounded: "0px"
    width: 720px
    padding: 16px
  # Toast — floating notification panel, Shadow M. Severity tints the WHOLE panel
  # (background + icon), using the same semantic recipe as Hint. Title + message stay
  # text-high; the icon takes the semantic foreground color (see toast.md).
  toast:
    textColor: "{colors.text-high}"   # title + message
    rounded: "{rounded.md}"
    width: 400px
    padding: 12px
    typography: "{typography.headline5}"
  toast-success:
    backgroundColor: "{colors.semantic-bg-green}"
    iconColor: "{colors.semantic-green}"
  toast-info:
    backgroundColor: "{colors.semantic-bg-azure}"
    iconColor: "{colors.semantic-azure}"
  toast-warning:
    backgroundColor: "{colors.semantic-bg-orange}"
    iconColor: "{colors.semantic-orange}"
  toast-error:
    backgroundColor: "{colors.semantic-bg-red}"
    iconColor: "{colors.semantic-red}"

shadows:
  S:      "0 1px 8px rgba(0,10,58,0.08)"
  M:      "0 2px 16px rgba(0,10,58,0.16)"
  M_plus: "0 2px 16px rgba(0,10,58,0.16), 0 0 2px rgba(0,0,0,0.20)"   # M + tight ambient layer
  L:      "0 3px 24px rgba(0,10,58,0.24)"

# Interaction-state overlays & component fills (live Figma families: stateOverlay/*, compBg/*, surface/*)
overlays:
  stateOverlay/hover:        "rgba(0,10,58,0.05)"
  stateOverlay/pressed:      "rgba(0,10,58,0.10)"
  stateOverlay/hoverBlue:    "rgba(41,106,255,0.07)"   # blue-item hover
  stateOverlay/pressedBlue:  "rgba(41,106,255,0.15)"   # blue-item pressed
  compBg/blueLite:           "rgba(41,106,255,0.12)"   # selected-item background (NOT stateOverlay/selectedBlue, which is 0.07)
  compBg/blueHeavy:          "rgba(41,106,255,0.25)"   # heavier blue fill — e.g. slider unfilled track
  stateOverlay/selectedBlue: "rgba(41,106,255,0.07)"   # selected blue-item overlay (lighter than compBg/blueLite 0.12)
  surface/mask:              "rgba(0,10,58,0.30)"       # dialog / modal scrim (aka backdrop, overlay)
---

## Overview

This design system powers a professional B2B SaaS platform. The visual language is clean, utilitarian, and data-dense, optimized for power users managing large volumes of data entities and assets.

The palette anchors on vivid electric blue (`#296AFF`) against a soft near-white canvas, with a 10-hue semantic palette for data labeling and status. The system supports three themes: **Light** (default), **Dark**, and **PolarDark** (navigation sidebar only).

**Character words:** Precise. Functional. Data-forward. Trustworthy. International.

## Colors

The palette is built on a warm navy base (`#000A3A`) and a vivid electric blue primary (`#296AFF`), supported by a full 10-hue semantic palette. Every hue is a 10-stop ramp (100 = darkest → 10 = lightest). The white/navy text split falls at ~step 50: steps 60–100 pair with white text, steps 10–50 with navy.

- **Primary (`#296AFF`):** Carries all interactive weight — buttons, active links, checkboxes, focus rings, and entity names in table primary columns. Three interaction steps: normal → hover (`#0E4EFF`) → pressed (`#0032E0`). Shifts to `#5C93FF` in dark mode.
- **Text base (`#000A3A`, Gray/100):** A warm navy rather than pure black. Three Figma DS2 tiers: high (100%), med (80%), low (57%). A fourth tier, low-minus (45%), is used exclusively for placeholder text in inputs and selects and has no Figma DS2 token counterpart.
- **Surfaces (light):** A four-step hierarchy from `#EDEEF1` (page canvas) through `#FFFFFF` (cards, inputs). Surfaces lighten as they move up the visual stack.
- **Semantic palette:** 10 hues each with a foreground token and a background tint. Red serves a dual role: error states and required-field indicators (`*`). Purple signals AI/premium features.
- **AI Gradient:** Reserved exclusively for AI-powered surfaces. Three interaction states (normal, hover, pressed). Never substitute for standard primary blue.
- **PolarDark:** Navigation sidebar only. Base `#1A234E`, interactive blue `#4886FF`, white text at 100%/70%/50%, hover overlay `rgba(255,255,255,0.07)`, pressed overlay `rgba(255,255,255,0.15)`, active item `rgba(45,125,255,0.50)`.

### Blue ramp

| Stop | Hex | Usage |
|---|---|---|
| 100 | `#0321AA` | Deepest emphasis |
| 90 | `#0032E0` | Pressed state |
| 80 | `#0E4EFF` | Hover state |
| 70 | `#296AFF` | **Default / brand** |
| 60 | `#4886FF` | Dark mode default; PolarDark interactive |
| 50 | `#70A0FF` | Dark mode hover |
| 40 | `#98BBFF` | Dark mode pressed |
| 30 | `#C1D6FF` | Subtle tint |
| 20 | `#D2E1FF` | Very subtle tint |
| 10 | `#EAF1FF` | Background fill / selected bg |

### Gray ramp

| Stop | Hex | Usage |
|---|---|---|
| 100 | `#000A3A` | Text base |
| 90 | `#1A234E` | PolarDark surface |
| 50 | `#80849C` | Semantic gray / disabled |
| 40 | `#999DB0` | Border highlight |
| 30 | `#B3B6C4` | Border emphasis |
| 15 | `#D9DAE1` | **Border general** |
| 10 | `#E5E7EB` | Pressed state solid fill |
| 7  | `#EDEEF1` | Surface quaternary (page canvas) |
| 5  | `#F2F3F5` | Surface tertiary |
| 3  | `#F7F8F9` | Surface secondary |
| 0  | `#FFFFFF` | Surface primary |

### Red ramp

Canonical step numbers. Note: the DS2 Figma file (`2_0 L&D/Red/*`) labels the danger hover and pressed stops differently — `Red/60` = `#C3003A` and `Red/50` = `#9E002F`, which correspond to canonical stops 80 and 90. The frontmatter tokens `red-60` / `red-50` use the DS2 file names.

| Stop | Hex | Usage |
|---|---|---|
| 10 | `#FFEBF1` | Semantic background tint |
| 20 | `#FFD3E1` | — |
| 30 | `#FFC0D4` | — |
| 40 | `#FF9DBC` | — |
| 50 | `#FF77A2` | — |
| 60 | `#FB4078` | **Semantic red foreground** (badges, errors, required `*`) |
| 70 | `#E41754` | **Danger solid button bg (normal)** |
| 80 | `#C3003A` | Danger solid button hover (DS2 Figma: `Red/60`) |
| 90 | `#9E002F` | Danger solid button pressed (DS2 Figma: `Red/50`) |
| 100 | `#730023` | Darkest |

### Semantic palette

| Role | Foreground | Background tint |
|---|---|---|
| Red (error / danger / required) | `#FB4078` | `#FFEBF1` |
| Orange (warning) | `#FE8022` | `#FFEEE1` |
| Yellow (caution) | `#F3AF00` | `#FFF899` |
| Green (success) | `#00BA77` | `#C7FFEB` |
| Teal (info-alt) | `#00B4BF` | `#C9FCFF` |
| Azure (info) | `#00AEE6` | `#DCF6FF` |
| Blue (brand / selected) | `#296AFF` | `#EAF1FF` |
| Purple (AI / premium) | `#864CFF` | `#F3ECFF` |
| Fuchsia (custom label) | `#F43BC5` | `#FFE9F9` |
| Gray (neutral / inactive) | `#80849C` | `#EDEEF1` |

### Data-visualization series colors

Charts and other multi-series visualizations assign colors in this fixed ramp-stop order (from `DEFAULT_CHART_COLORS`), so a given series keeps the same color across views:

| Series | Hue | Foreground |
|---|---|---|
| 1 | Blue 60 | `#4886FF` |
| 2 | Azure 40 | `#27CBFF` |
| 3 | Orange 50 | `#FE8022` |
| 4 | Yellow 40 | `#FFC42D` |
| 5 | Green 50 | `#00BA77` |

### Purple ramp

| Stop | Hex | Usage |
|---|---|---|
| 10 | `#F3ECFF` | Semantic background tint |
| 20 | `#E6DAFE` | — |
| 30 | `#DECDFF` | — |
| 40 | `#C8ACFF` | — |
| 50 | `#B18CFF` | — |
| 60 | `#9B6BFF` | — |
| 70 | `#864CFF` | **Semantic purple foreground** (AI / premium) |
| 80 | `#712FFF` | — |
| 90 | `#510BE5` | — |
| 100 | `#3B0B9F` | Darkest |

### Fuchsia ramp

| Stop | Hex | Usage |
|---|---|---|
| 10 | `#FFE9F9` | Semantic background tint |
| 20 | `#FED4F3` | — |
| 30 | `#FFC1EF` | — |
| 40 | `#FF98E5` | — |
| 50 | `#FF6AD9` | — |
| 60 | `#F43BC5` | **Semantic fuchsia foreground** (custom label) |
| 70 | `#DC10A8` | — |
| 80 | `#B50086` | — |
| 90 | `#970070` | — |
| 100 | `#6C0051` | Darkest |

### Orange ramp

| Stop | Hex | Usage |
|---|---|---|
| 10 | `#FFEEE1` | Semantic background tint |
| 20 | `#FDDDC5` | — |
| 30 | `#FFC89E` | — |
| 40 | `#FFA35E` | — |
| 50 | `#FE8022` | **Semantic orange foreground** (warning) |
| 60 | `#E96400` | — |
| 70 | `#C15300` | — |
| 80 | `#A34600` | — |
| 90 | `#873A00` | — |
| 100 | `#5F2900` | Darkest |

### Yellow ramp

| Stop | Hex | Usage |
|---|---|---|
| 10 | `#FFF899` | Semantic background tint |
| 20 | `#FFEE59` | — |
| 30 | `#FFDE2F` | — |
| 40 | `#FFC42D` | — |
| 50 | `#F3AF00` | **Semantic yellow foreground** (caution) |
| 60 | `#CA9100` | — |
| 70 | `#A17400` | — |
| 80 | `#8D6500` | — |
| 90 | `#735300` | — |
| 100 | `#543C00` | Darkest |

### Green ramp

| Stop | Hex | Usage |
|---|---|---|
| 10 | `#C7FFEB` | Semantic background tint |
| 20 | `#81F8CE` | — |
| 30 | `#54EFB8` | — |
| 40 | `#3CD39E` | — |
| 50 | `#00BA77` | **Semantic green foreground** (success) |
| 60 | `#009D65` | — |
| 70 | `#008746` | — |
| 80 | `#00723C` | — |
| 90 | `#005B30` | — |
| 100 | `#004223` | Darkest |

### Teal ramp

| Stop | Hex | Usage |
|---|---|---|
| 10 | `#C9FCFF` | Semantic background tint |
| 20 | `#7CF4FB` | — |
| 30 | `#4CE9F2` | — |
| 40 | `#00CFDC` | — |
| 50 | `#00B4BF` | **Semantic teal foreground** (info-alt) |
| 60 | `#0098A1` | — |
| 70 | `#008088` | — |
| 80 | `#006F76` | — |
| 90 | `#00565B` | — |
| 100 | `#003E42` | Darkest |

### Azure ramp

| Stop | Hex | Usage |
|---|---|---|
| 10 | `#DCF6FF` | Semantic background tint |
| 20 | `#ACEBFF` | — |
| 30 | `#87E2FF` | — |
| 40 | `#27CBFF` | — |
| 50 | `#00AEE6` | **Semantic azure foreground** (info) |
| 60 | `#0093D1` | — |
| 70 | `#007DB3` | — |
| 80 | `#006B98` | — |
| 90 | `#005275` | — |
| 100 | `#003C55` | Darkest |

### Emerald ramp

Partial — only stops 30 and 50 are available in the current token set.

| Stop | Hex | Usage |
|---|---|---|
| 30 | `#9BD0C6` | — |
| 50 | `#70A499` | — |

## Typography

**Open Sans** for Latin/English, **Noto Sans** for non-Latin scripts (metrically identical at every scale), **Fira Code Medium** for monospaced content. No italic styles exist in this system.

- **Headlines (`headline1`–`headline6`):** SemiBold (600). `headline5` (14px) is the primary workhorse for form labels, column headers, and section titles. `headline6` (12px) is for required-field `*` indicators and small chips.
- **Body (`body1`, `body2`):** Regular (400). `body1` is the default for all UI text, input values, and table cells. `body2` handles sub-labels, entity IDs, helper text, and character counters.
- **Bold body (`body1-highlight`, `body2-highlight`):** Bold (700). For emphasized inline text only — not a substitute for headlines.
- **Code (`code1`, `code2`):** Fira Code Medium (500). For IDs, tokens, and technical strings rendered inline.

Every token from `special` through `body2-highlight` has a `Non-English/` Noto Sans counterpart with identical metrics. No layout reflow occurs when switching scripts.

| Token | Size | Weight | Line Height | Letter Spacing |
|---|---|---|---|---|
| `special` | 40px | 600 | 56px | 0.4px |
| `headline1` | 30px | 600 | 36px | 0.4px |
| `headline2` | 24px | 600 | 32px | 0.4px |
| `headline3` | 20px | 600 | 28px | 0.4px |
| `headline4` | 16px | 600 | 24px | 0.2px |
| `headline5` | 14px | 600 | 20px | 0.2px |
| `headline6` | 12px | 600 | 16px | 0.2px |
| `body1` | 14px | 400 | 20px | 0.2px |
| `body1-highlight` | 14px | 700 | 20px | 0.2px |
| `body2` | 12px | 400 | 16px | 0.2px |
| `body2-highlight` | 12px | 700 | 16px | 0.2px |
| `code1` | 14px | 500 | 20px | 0.2px |
| `code2` | 12px | 500 | 16px | 0.2px |

Each token is available as a CSS utility class in the shell template: `class="text-headline5"`, `class="text-body1"`, etc. These classes set `font-size`, `font-weight`, `line-height`, and `letter-spacing` together. In component snippets, use the class instead of writing all four properties inline.

### Text overflow

System-wide default: when text exceeds its available width, truncate it on a single line with a trailing ellipsis (`…`) and reveal the full value on hover in a `Tooltip`. This applies anywhere a label, value, or name can outgrow its container — table cells, menu/select options, breadcrumbs, tabs, tags, chips, card titles, list rows, sidebar items.

- Show the tooltip **only when the text is actually truncated** — content that fits must not trigger a hover tooltip.
- Truncate per line: a two-line block (primary + secondary text) truncates each line independently.
- Truncation is a fallback for incidental overflow, not a sizing strategy — size containers so the common case reads without a hover.
- Never wrap unexpectedly, clip mid-character, or hide overflow with no way to recover the full value.

## Layout

The system uses a fixed full-height layout. The content area sits on a `surface-quaternary` background, divided into a **Header bar** and **Content body**.

**Header bar:** 48px tall, `surface-primary` background, Shadow S, 1px `border-general` bottom border, 24px horizontal padding. Contains a left slot and a right slot:

- **Left slot — Breadcrumb (M):**
  - **Function page (no parent):** Only the current page label is shown — it acts as the page title. No path items, no separator.
  - **Drilldown page:** Full breadcrumb path is shown. Each ancestor is a clickable link that navigates back up the hierarchy.

- **Right slot — Action buttons:**
  - **List/overview page:** Single Primary M button for the primary create action (e.g. "Create"), right-aligned.
  - **Create / Settings page:** Multiple page-level actions displayed right-aligned with 8px gaps — typically Cancel (Secondary) + Save (Primary), plus any additional secondary actions. When buttons exceed available space, secondary actions collapse into a 3-dot icon menu (Icon-only Secondary M button).

**Content body:** 24px internal padding. Content is organized into **Content Cards** — `surface-card` rounded panels (see [Cards](#cards) for the variant spec). Cards stack vertically with 24px gaps. Sections within a card are separated by 8px with a `headline5` label above each group.

**Nested sections:** One level deep only. Nested sections use `surface-secondary` to distinguish from the parent card white, with 16px–20px internal padding. Never nest a section within a nested section.

**Field layout:** Fields inside cards use a flex-wrap layout with 16px gaps. Wide fields (400px or 600px) fill partial rows. Paired narrower fields sit side by side with 16px gap.

**Form layout:** a form follows **one top-to-bottom reading path** — never split it into two parallel columns. The paired narrow fields above don't break this: a shared row holds fields *read as a single unit* (start/end date) and stays on that one path; it never starts a second column. Group related fields under a section label. A form commits through exactly one primary action (see Footer action hierarchy under [Placement patterns](#buttons)).

### Spacing scale

| Token | Value | Named size | Common use |
|---|---|---|---|
| `xs` | 4px | XS | Tight gaps within a component |
| `sm` | 8px | SM | Icon-to-label gaps, section separators |
| `md` | 12px | MD | Filter panel insets |
| `lg` | 16px | LG | Field gaps, paired-field spacing |
| `xl` | 24px | XL | Page padding, card gaps, dialog margins |
| `2xl` | 32px | 2XL | Larger section gaps, wide panel gutters |
| `3xl` | 48px | 3XL | Header bar height, full-height bar rows |

**Named spacing conventions** (cross-component — components reference these, not their own values):

| Convention | DS2 value |
|---|---|
| Control-to-label gap (stacked field) | `xs` 4px |
| Vertical gap between grouped form controls (checkbox/radio lists) | `md` 12px |
| Toolbar control gap and chip-to-chip gap | `sm` 8px |

### Component heights

| Component | Height |
|---|---|
| Button M / Input / Select | 32px |
| Button S | 24px |
| Tall Input / Select (stacked label) | 56px |
| Table row XL / L / M / S | 64 / 56 / 48 / 40px |
| Table header | 40px |
| Header bar | 48px |
| Filter controls bar | 32px |
| Dialog header / footer | 48 / 56px |
| Pagination | 56px |

## Elevation & Depth

Depth is expressed through layered surfaces and directional shadows using brand navy `#000A3A` at low opacity — never pure black in light mode. Four levels:

| Level | Light shadow | Dark shadow | Used for |
|---|---|---|---|
| S | `0 1px 8px rgba(0,10,58,0.08)` | `0 2px 16px rgba(0,0,0,0.16)` | Header bar, content cards, table columns |
| M | `0 2px 16px rgba(0,10,58,0.16)` | `0 4px 32px rgba(0,0,0,0.32)` | Dropdowns, tooltips, filter panels, sidebar |
| M_plus | M + `0 0 2px rgba(0,0,0,0.20)` | M_dark + `0 0 4px rgba(0,0,0,0.16)` | M with added tight ambient; tight-inset floating panels |
| L | `0 3px 24px rgba(0,10,58,0.24)` | `0 6px 48px rgba(0,0,0,0.48)` | Dialogs, popovers |

**Interaction state overlays:**

| State | Overlay token | Overlay | Solid fill |
|---|---|---|---|
| Hover | `stateOverlay/hover` | `rgba(0,10,58,0.05)` | `#F2F3F5` |
| Pressed | `stateOverlay/pressed` | `rgba(0,10,58,0.10)` | `#E5E7EB` |
| Selected | `compBg/blueLite` | `rgba(41,106,255,0.12)` | `#F0F5FF` |
| Blue item hover | `stateOverlay/hoverBlue` | `rgba(41,106,255,0.07)` | — |
| Blue item pressed | `stateOverlay/pressedBlue` | `rgba(41,106,255,0.15)` | — |

**Disabled:** `opacity: 0.5` per interactive element. For stacked label + field patterns, the field gets 50% opacity but the label stays at full opacity — never apply to the entire form group.

**Focus:** 2px solid `primary` outline, offset 2px outside the component border.

**Motion:** Use `cubic-bezier(0.2, 0, 0, 1)` (ease-out). Fast: 100ms (hover transitions); Base: 150ms (panel open/close, button feedback); Slow: 250ms (dialog entrance/exit). Animate only opacity, transform, and color — never layout properties.

## Shapes

All interactive elements and containers use minimal corner radii that provide just enough softness to feel modern while maintaining the precision of a data-forward tool.

- **`rounded/xs` (2px):** Badge chips.
- **`rounded/sm` (4px):** Buttons, inputs, selects, checkboxes, tags, and all form controls.
- **`rounded/md` (8px):** Content cards, dialogs, and app icon thumbnails in table cells.

The Search field and filter chips use a 20px pill radius (fully rounded at their 32px height); otherwise only specialized tag chip dismiss buttons are fully rounded.

## Components

Per-component detail — variants, props, anatomy, and states — lives in the component guidelines under [`component-guidelines/`](component-guidelines/). This section keeps only DS2-level summaries, the cross-component **placement patterns** that belong to no single component file, and foundational **iconography** (which has no separate guideline doc).

### Component summaries

| Component | DS2 summary | Detail |
|---|---|---|
| Buttons | Two sizes (M 32px / S 24px), six categories (Primary, Secondary, Minimal, Emphasis, Danger, AI Exclusive), `rounded/sm` radius, 20px icons at 8px gap. `TextButton` (L 32px / M 20px) for inline low-emphasis actions. | [button.md](component-guidelines/button.md) |
| Form controls | Stacked label + field: input/select 32px (56px with label), `rounded/sm` radius, `body1` value, `text-low-minus` placeholder; required `*` in `semantic-red`. | [input.md](component-guidelines/input.md), [select.md](component-guidelines/select.md), [checkbox.md](component-guidelines/checkbox.md), [radio.md](component-guidelines/radio.md) |
| Tables | Primary data surface. Row heights XL 64 / L 56 / M 48 / S 40px; 40px header on `surface-tertiary`; controls bar, filter popover, and 56px pagination footer. | [table.md](component-guidelines/table.md), [filters.md](component-guidelines/filters.md) |
| Dialogs | Modal: header 48 / footer 56px, `rounded/md` radius, Shadow L, `surface/mask` backdrop. Use the narrowest fitting width. | [dialog.md](component-guidelines/dialog.md) |
| Cards | `rounded/md` radius, `surface-card` background. Content card (Shadow S, no border); table / list card (border, no shadow); nested section (`surface-secondary` fill). | [card.md](component-guidelines/card.md) |
| Breadcrumb | In the 48px header bar; ancestors `text-low` darkening to `text-high` on hover (no shift to `primary`), current page `text-high`, 8px gaps. | [breadcrumb.md](component-guidelines/breadcrumb.md) |

> Card layering (content card → one-level-deep nested section) is covered under [Layout](#layout).

### Placement patterns

Cross-component layout rules that belong to no single component file, grouped by where they apply.

**Action buttons** — the general rule for any action-button group (page header, footer, panel):

- Right-aligned; exactly one primary action, right-most; all other actions are secondary and sit to its left.
- Group gap: **8px**.
- Icon-only button clusters (e.g. a dialog header's close `×` plus an optional secondary icon) sit **8px** apart.

| Context | Spec |
|---|---|
| Page-level actions | In the page header right slot: Primary M (+ Start-icon). The table create action also lives here — not in the table controls bar. |
| Dialog / drawer footer | Right-aligned in the footer: Secondary M (Cancel) + Primary M (Confirm). Applies to Dialog, Drawer, ContentAssistant footers. |
| Filter panel | Secondary S (Clear) + Primary S (Apply). |

**Forms & collections**

| Context | Spec |
|---|---|
| Form inline add | Text Button M (Main) inside the content card |
| Collections / grid | Equal-size tiles, equal-height rows, uniform gutters; group related tiles under one heading (applies to Card, ConnectorCard, WidgetCard, any tiled set) |

### Iconography

Outlined style by default; filled variants for active/selected states only.

| Size | Usage |
|---|---|
| 16px | Inline text icons, tooltip triggers, compact row actions |
| 20px | Default UI icons — buttons, inputs, navigation, table actions |
| 24px | Prominent standalone icons, navigation icons |

Color: `text-low` for decorative, `primary` for interactive/active states, `text-white-hold` on colored surfaces.

## CSS Variables

All design tokens are expressed as CSS custom properties. Token groups:

- **Light theme** `:root {}` — color, surface, border, overlay, shadow, shape (`--radius-*`), spacing (`--space-*`), and AI tokens
- **Dark theme** — same tokens overridden via `@media (prefers-color-scheme: dark)` and `.theme-dark` class on `<html>`
- **Typography utility classes** — `.text-headline5`, `.text-body1`, etc. (see [Typography](#typography))

## Do's and Don'ts

The entries below are design-system constraints that apply across all surfaces:

- **Do** pair each semantic foreground color with its matching background tint token for tags (e.g., `semantic-red` on `semantic-bg-red`). Note: status is **not** shown with a tinted pill — use the Status component (dot + `text-high` label, no background); see [component-guidelines/status.md](component-guidelines/status.md).
- **Do** use `surface-quaternary` as the outermost page background with `surface-primary` cards on top — respect the four-step surface stacking order.
- **Do** limit card nesting to one level deep, using `surface-secondary` for nested section backgrounds.
- **Don't** apply Shadow M or L to content cards or the header bar. Heavier shadows are reserved for floating elements (dropdowns, dialogs).
- **Don't** use italic text — no italic styles exist in this system.
