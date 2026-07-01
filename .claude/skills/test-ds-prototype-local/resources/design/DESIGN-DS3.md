---
last_updated: 2026-06-30
version: alpha
name: Appier Design System 3.0
description: "Enterprise product design system. Inter font, larger radius, more generous spacing."

colors:
  # Primary / Brand
  primary:         "#296AFF"
  primary-hover:   "#0E4EFF"
  primary-pressed: "#0032E0"

  # Text (Light theme)
  text-high:       "#000A3A"
  text-med:        "rgba(0,10,58,0.80)"  # 80% — NOTE: code (dist/v3) currently ships 70%; 80% is the intended value
  text-low:        "rgba(0,10,58,0.57)"
  text-low-minus:  "rgba(0,10,58,0.45)"
  text-white-hold: "#FFFFFF"

  # Surfaces (Light theme) — darkest to lightest
  surface-quaternary: "#EDEEF1"
  surface-tertiary:   "#F2F3F5"
  surface-secondary:  "#F4F6F9"
  surface-primary:    "#FFFFFF"
  surface-popover:    "#FFFFFF"
  surface-card:       "#FAFBFC"   # Card component background (slightly off-white vs surface-primary)
  surface-blue:       "#296AFF"

  # Borders (Light theme)
  border-general:   "#D9DAE1"
  border-emphasis:  "#B3B6C4"
  border-highlight: "#999DB0"
  border-popover:   "#DEDFE5"

  # Red ramp — danger button states (canonical stop numbers; match code palette)
  red-70: "#E41754"
  red-80: "#C3003A"
  red-90: "#9E002F"

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

  # Semantic text colors — readable text/icon color on the matching background tint
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

  # DS3 UI/* naming aliases — map to the semantic values above.
  "UI/content/high":       "#000a3a"
  "UI/content/med":        "#000a3acc"
  "UI/content/whiteHold":  "#ffffff"
  "UI/surface/primary":    "#ffffff"
  "UI/surface/popover":    "#ffffff"
  "UI/surface/card":       "#fafbfc"
  "UI/surface/blue":       "#296aff"
  "UI/border/general":     "#d9dae1"
  "UI/border/popover":     "#dedfe5"

typography:
  # Inter for all text tokens. Fira Code for code tokens.
  special:
    fontFamily: Inter
    fontSize: 2.5rem
    fontWeight: 600   # NOTE: code (dist/v3) currently ships 400; weight pending confirmation
    lineHeight: 56px
    letterSpacing: 0.4px

  headline1:
    fontFamily: Inter
    fontSize: 1.5rem
    fontWeight: 600
    lineHeight: 32px
    letterSpacing: 0px

  headline2:
    fontFamily: Inter
    fontSize: 1.375rem
    fontWeight: 600
    lineHeight: 30px
    letterSpacing: 0.4px

  headline3:
    fontFamily: Inter
    fontSize: 1.25rem
    fontWeight: 600
    lineHeight: 28px
    letterSpacing: 0.4px

  headline4:
    fontFamily: Inter
    fontSize: 1rem
    fontWeight: 600
    lineHeight: 24px
    letterSpacing: 0.2px

  headline5:
    fontFamily: Inter
    fontSize: 0.875rem
    fontWeight: 600
    lineHeight: 20px
    letterSpacing: 0.2px

  headline6:
    fontFamily: Inter
    fontSize: 0.75rem
    fontWeight: 600
    lineHeight: 16px
    letterSpacing: 0.2px

  body1:
    fontFamily: Inter
    fontSize: 0.875rem
    fontWeight: 400
    lineHeight: 20px
    letterSpacing: 0.2px

  body1-highlight:
    fontFamily: Inter
    fontSize: 0.875rem
    fontWeight: 700
    lineHeight: 20px
    letterSpacing: 0.2px

  body2:
    fontFamily: Inter
    fontSize: 0.75rem
    fontWeight: 400
    lineHeight: 16px
    letterSpacing: 0.2px

  body2-highlight:
    fontFamily: Inter
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

# Border radius tokens
# Group MUST be named `rounded` (canonical spec name) so `{rounded.N}` refs resolve.
# DS3 keys it numerically; Tailwind class is rounded-radius-{N}.
rounded:
  0:  0px     # r0  — square
  1:  1px     # r1
  2:  2px     # r2  — (reserved; DS2 badge/tag chips)
  4:  4px     # r4  — checkboxes, radio buttons, tags, badge chips
  6:  6px     # r6  — DS2 button focus ring; not used by DS3 buttons
  8:  8px     # r8  — inputs, selects, form controls, buttons ← primary control default
  10: 10px    # r10 — button focus ring (after:rounded-[10px] in Button v3.tsx)
  12: 12px    # r12 — layout cards, icon cards
  16: 16px    # r16 — page section containers, dialogs, tables, widget cards (content containers)
  20: 20px    # r20
  24: 24px    # r24
  28: 28px    # r28
  full: 9999px  # radiusFull — pill / fully-rounded elements

# Spacing tokens (also used for heights, padding, gaps)
# DS3 uses a numeric scale. Tailwind class examples: h-spacing-{N} / px-spacing-{N} / py-spacing-{N} / gap-x-spacing-{N}
# Rule: the number in the class name IS the pixel value.
spacing:
  0:  0px
  2:  2px
  4:  4px
  6:  6px
  8:  8px
  10: 10px
  12: 12px
  14: 14px
  16: 16px
  18: 18px
  20: 20px
  22: 22px
  24: 24px
  26: 26px
  28: 28px
  30: 30px
  32: 32px
  34: 34px
  36: 36px
  38: 38px
  40: 40px
  48: 48px

components:
  # Buttons — M (default) size: 40px height, 8px radius, 8px/16px padding
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.text-white-hold}"
    rounded: "8px"
    height: 40px
    padding: "8px 16px"
    typography: "{typography.headline5}"
  button-primary-hover:
    backgroundColor: "{colors.primary-hover}"
  button-primary-pressed:
    backgroundColor: "{colors.primary-pressed}"
  button-secondary:
    backgroundColor: "{colors.surface-primary}"
    border: "1px solid {colors.border-general}"
    textColor: "{colors.text-med}"
    rounded: "8px"
    height: 40px
    padding: "8px 16px"
    typography: "{typography.headline5}"
  button-secondary-hover:
    backgroundColor: "{colors.surface-tertiary}"
  button-secondary-pressed:
    backgroundColor: "{colors.state-pressed-primary}"
  button-emphasis:
    backgroundColor: "{colors.surface-primary}"
    border: "1px solid {colors.primary}"
    textColor: "{colors.primary}"
    rounded: "8px"
    height: 40px
    padding: "8px 16px"
    typography: "{typography.headline5}"
  button-emphasis-hover:
    backgroundColor: "{colors.surface-tertiary}"
    border: "1px solid {colors.primary-hover}"
  button-emphasis-pressed:
    backgroundColor: "{colors.state-pressed-primary}"
    border: "1px solid {colors.primary-hover}"
  button-danger:
    backgroundColor: "{colors.red-70}"
    textColor: "{colors.text-white-hold}"
    rounded: "8px"
    height: 40px
    padding: "8px 16px"
    typography: "{typography.headline5}"
  button-danger-hover:
    backgroundColor: "{colors.red-80}"
  button-danger-pressed:
    backgroundColor: "{colors.red-90}"
  # Button — S (small) size: 32px height
  button-small:
    height: 32px
    padding: "6px 12px"
    rounded: "8px"
  # DS3 Tailwind-based geometry tokens (used in v3.tsx overrides)
  button-height-default: spacing-40
  button-height-small:   spacing-32
  button-radius:         radius-8
  button-padding-default: "px-spacing-16 py-spacing-8"
  button-padding-small:   "px-spacing-12 py-spacing-6"
  button-icon-gap:        spacing-4
  button-focus-ring-radius: 10px   # after:rounded-[10px] in Button v3.tsx
  button-focus-ring-inset-default:  "-inset-[2px]"
  button-focus-ring-inset-bordered: "-inset-[3px]"
  # Input — 40px inline / 68px stacked (label 20px + gap 8px + field 40px)
  input:
    backgroundColor: "{colors.surface-primary}"
    textColor: "{colors.text-high}"
    rounded: "8px"
    height: 40px
    height-tall: 68px
    padding: "6px 12px"
    typography: "{typography.body1}"
  input-placeholder:
    textColor: "{colors.text-low-minus}"
  input-height-default:  40px
  input-height-stacked:  68px
  input-radius:          radius-8
  # Select
  select-height-default: 44px
  select-radius:         radius-8
  # Content card — border only (no shadow); 12px radius; surface-card background
  content-card:
    backgroundColor: "{colors.surface-card}"
    border: "1px solid {colors.border-general}"
    rounded: "12px"
    padding: 20px
  card-elevation: border
  card-radius:    radius-12
  # Dialog — 16px radius
  dialog:
    backgroundColor: "{colors.surface-primary}"
    rounded: "16px"
    padding: 24px
  # Table header
  table-header:
    backgroundColor: "{colors.surface-tertiary}"
    textColor: "{colors.text-med}"
    height: 44px
    typography: "{typography.headline5}"
  # Search field — keeps its 20px pill radius from v2 (SearchWrapper not overridden); 40px field
  search:
    backgroundColor: "{colors.surface-primary}"
    textColor: "{colors.text-high}"
    border: "1px solid {colors.border-general}"
    rounded: "20px"
    height: 40px
    padding: "0 16px"
    typography: "{typography.body1}"
  search-placeholder:
    textColor: "{colors.text-low-minus}"
  # Filter chip — full pill, 40px (v3: rounded-radius-full, h-spacing-40); solid border
  filter:
    backgroundColor: "{colors.surface-primary}"
    textColor: "{colors.text-high}"
    border: "1px solid {colors.border-general}"
    rounded: "9999px"
    height: 40px
    padding: "8px 12px 8px 16px"
    typography: "{typography.body1}"
  filter-focused:
    border: "1px solid {colors.primary}"   # focused / popover open: + 2px outline at 2px offset
  # Status — semantic-colored dot + label, radius-4. Two background modes:
  #  • With Background (default): semantic-bg-* tint pill + text-high label; the dot (semantic foreground) carries the hue.
  #  • Without Background: dot + semantic-* (foreground) label, no pill.
  # The per-state entries below give the dot/foreground hue and its With-Background tint. See component-guidelines/status.md.
  status-badge:
    rounded: "4px"
    labelColor: "{colors.text-high}"        # With Background label; Without Background uses the matching dotColor
  status-badge-success:
    dotColor: "{colors.semantic-green}"
    backgroundColor: "{colors.semantic-bg-green}"
  status-badge-error:
    dotColor: "{colors.semantic-red}"
    backgroundColor: "{colors.semantic-bg-red}"
  status-badge-warning:
    dotColor: "{colors.semantic-orange}"
    backgroundColor: "{colors.semantic-bg-orange}"
  status-badge-info:
    dotColor: "{colors.semantic-azure}"
    backgroundColor: "{colors.semantic-bg-azure}"
  # Drawer — flush-edge side panel (no radius), full viewport height, Shadow S; MEDIUM 800px default
  # (SMALL 400 / LARGE 1000, or dynamic 25% / 40% / 55%, via the `width` prop). 48px header, 24px content padding.
  drawer:
    backgroundColor: "{colors.surface-primary}"
    textColor: "{colors.text-high}"
    rounded: "0px"
    width: 800px
    padding: 24px
  # Toast — floating notification panel, Shadow M. Severity tints the WHOLE panel
  # (background + icon), using the same semantic recipe as Hint. Title + message stay
  # text-high; the icon takes the semantic foreground color (see toast.md).
  toast:
    textColor: "{colors.text-high}"   # title + message
    rounded: "8px"
    width: 400px
    padding: 16px
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

# Shadow levels — S, M (DS3 has only two; DS2's M_plus and L were removed)
# Token pattern: offset (x, y), blur, spread 0, color = UI content dark (#000a3a) at varying opacity
# CSS format: box-shadow: {x}px {y}px {blur}px 0px {color}
shadows:
  # Light mode values (color: #000a3a). Dark mode uses #000000 with larger blur.
  S:      "0px 1px 8px 0px #000a3a14"     # #000a3a at 8%  — Top Nav, Table head, Sidebar, Drawers (NOT Card — Card uses border)
  M:      "0px 2px 16px 0px #000a3a29"    # #000a3a at 16% — Dialog, Dropdown, Tooltip, Popover

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

DS3 is the design system for Enterprise products. The visual layer uses larger radius, more generous spacing, and Inter. Component API (names, variants, props), behavior, and state logic are stable.

The palette anchors on vivid electric blue (`#296AFF`) against a soft near-white canvas, with a 10-hue semantic palette for data labeling and status. The system supports two themes: **Light** (default) and **Dark**.

**Character words:** Precise. Functional. Enterprise-grade. Trustworthy. International.


## Colors

The palette is built on a warm navy base (`#000A3A`) and a vivid electric blue primary (`#296AFF`), supported by a full 10-hue semantic palette. Every hue is a 10-stop ramp (100 = darkest → 10 = lightest). The white/navy text split falls at ~step 50: steps 60–100 pair with white text, steps 10–50 with navy.

- **Primary (`#296AFF`):** Carries all interactive weight — buttons, active links, checkboxes, focus rings. Three interaction steps: normal → hover (`#0E4EFF`) → pressed (`#0032E0`). Shifts to `#5C93FF` in dark mode.
- **Text base (`#000A3A`, Gray/100):** A warm navy rather than pure black. Three tiers: high (100%), med (80%), low (57%). A fourth tier, low-minus (45%), is used exclusively for placeholder text in inputs and selects.
- **Surfaces (light):** A four-step hierarchy from `#EDEEF1` (page canvas) through `#FFFFFF` (cards, inputs). Surfaces lighten as they move up the visual stack.
- **Semantic palette:** 10 hues each with a foreground token and a background tint. Red signals error and danger states; the required-field `*` uses `text-high` in DS3 (not red — that is the DS2 treatment). Purple signals AI/premium features.
- **AI Gradient:** Reserved exclusively for AI-powered surfaces. Three interaction states (normal, hover, pressed). Never substitute for standard primary blue.

### Blue ramp

| Stop | Hex | Usage |
|---|---|---|
| 100 | `#0321AA` | Deepest emphasis |
| 90 | `#0032E0` | Pressed state |
| 80 | `#0E4EFF` | Hover state |
| 70 | `#296AFF` | **Default / brand** |
| 60 | `#4886FF` | Dark mode default |
| 50 | `#70A0FF` | Dark mode hover |
| 40 | `#98BBFF` | Dark mode pressed |
| 30 | `#C1D6FF` | Subtle tint |
| 20 | `#D2E1FF` | Very subtle tint |
| 10 | `#EAF1FF` | Background fill / selected bg |

### Gray ramp

| Stop | Hex | Usage |
|---|---|---|
| 100 | `#000A3A` | Text base |
| 50 | `#80849C` | Semantic gray / disabled |
| 40 | `#999DB0` | Border highlight |
| 30 | `#B3B6C4` | Border emphasis |
| 15 | `#D9DAE1` | **Border general** |
| 10 | `#E5E7EB` | Pressed state solid fill |
| 7  | `#EDEEF1` | Surface quaternary (page canvas) |
| 5  | `#F2F3F5` | Surface tertiary |
| 3  | `#F7F8F9` | Palette gray3 (surface-secondary is `#F4F6F9`, not on this ramp) |
| 0  | `#FFFFFF` | Surface primary |

### Red ramp

Canonical step numbers. Note: the DS2 Figma file (`2_0 L&D/Red/*`) labels the danger hover and pressed stops differently — `Red/60` = `#C3003A` and `Red/50` = `#9E002F`, which correspond to canonical stops 80 and 90.

| Stop | Hex | Usage |
|---|---|---|
| 10 | `#FFEBF1` | Semantic background tint |
| 20 | `#FFD3E1` | — |
| 30 | `#FFC0D4` | — |
| 40 | `#FF9DBC` | — |
| 50 | `#FF77A2` | — |
| 60 | `#FB4078` | **Semantic red foreground** (badges, errors) |
| 70 | `#E41754` | **Danger solid button bg (normal)** |
| 80 | `#C3003A` | Danger solid button hover |
| 90 | `#9E002F` | Danger solid button pressed |
| 100 | `#730023` | Darkest |

### Semantic palette

Each hue has a foreground, a background tint, and a text color for use on that tint.

| Role | Foreground | Background tint | Text on tint |
|---|---|---|---|
| Red (error / danger) | `#FB4078` | `#FFEBF1` | `#C3003A` |
| Orange (warning) | `#FE8022` | `#FFEEE1` | `#A34600` |
| Yellow (caution) | `#F3AF00` | `#FFF899` | `#8D6500` |
| Green (success) | `#00BA77` | `#C7FFEB` | `#00723C` |
| Teal (info-alt) | `#00B4BF` | `#C9FCFF` | `#006F76` |
| Azure (info) | `#00AEE6` | `#DCF6FF` | `#006B98` |
| Blue (brand / selected) | `#296AFF` | `#EAF1FF` | `#0E4EFF` |
| Purple (AI / premium) | `#864CFF` | `#F3ECFF` | `#712FFF` |
| Fuchsia (custom label) | `#F43BC5` | `#FFE9F9` | `#B50086` |
| Gray (neutral / inactive) | `#80849C` | `#EDEEF1` | `#333B61` |

### Data-visualization series colors

Charts and other multi-series visualizations assign colors in this fixed ramp-stop order (from `DEFAULT_CHART_COLORS_V3`), so a given series keeps the same color across views:

| Series | Hue | Foreground |
|---|---|---|
| 1 | Blue 70 | `#296AFF` |
| 2 | Purple 50 | `#B18CFF` |
| 3 | Azure 40 | `#27CBFF` |
| 4 | Orange 50 | `#FE8022` |
| 5 | Yellow 50 | `#F3AF00` |

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

**Inter** for Latin scripts, **Noto Sans** for non-Latin scripts (metrically identical at every scale), **Fira Code Medium** for monospaced content. No italic styles exist in this system.

- **Headlines (`headline1`–`headline6`):** SemiBold (600). `headline5` (14px) is the primary workhorse for form labels, column headers, and section titles. `headline6` (12px) is for required-field `*` indicators and small chips.
- **Body (`body1`, `body2`):** Regular (400). `body1` is the default for all UI text, input values, and table cells. `body2` handles sub-labels, helper text, and character counters.
- **Bold body (`body1-highlight`, `body2-highlight`):** Bold (700). For emphasized inline text only — not a substitute for headlines.
- **Code (`code1`, `code2`):** Fira Code Medium (500). For IDs, tokens, and technical strings rendered inline.

| Token | Size | Weight | Line Height | Letter Spacing |
|---|---|---|---|---|
| `special` | 40px | 600 | 56px | 0.4px |
| `headline1` | 24px | 600 | 32px | 0px |
| `headline2` | 22px | 600 | 30px | 0.4px |
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

Every token from `special` through `body2-highlight` has a `Non-English/` Noto Sans counterpart with identical metrics. No layout reflow occurs when switching scripts.

Each token is available as a Tailwind utility class: `class="text-headline5"`, `class="text-body1"`, etc.

### Text overflow

System-wide default: when text exceeds its available width, truncate it on a single line with a trailing ellipsis (`…`) and reveal the full value on hover in a `Tooltip`. This applies anywhere a label, value, or name can outgrow its container — table cells, menu/select options, breadcrumbs, tabs, tags, chips, card titles, list rows, sidebar items.

- Show the tooltip **only when the text is actually truncated** — content that fits must not trigger a hover tooltip.
- Truncate per line: a two-line block (primary + secondary text) truncates each line independently.
- Truncation is a fallback for incidental overflow, not a sizing strategy — size containers so the common case reads without a hover.
- Never wrap unexpectedly, clip mid-character, or hide overflow with no way to recover the full value.

## Layout

Enterprise products use a fixed full-height layout. The page structure defines the outer chrome; content sections and forms govern what sits inside the main content area.

**Page structure** — three zones:

- **Top nav bar:** 56px tall, full viewport width. `UI/surface/primary` background, `UI/border/general` bottom border (no shadow). Holds the app logo, global navigation, and account/profile controls.
- **Sidebar:** 296px wide, full body height. `UI/surface/primary` background, Shadow S. Holds section-level navigation links, collapsible groups, and the workspace switcher.
- **Content column:** Remaining width after the sidebar, split into:
  - **Page header:** 56px tall, `UI/surface/primary` background, `UI/border/general` bottom border (no shadow). Left slot = page title or breadcrumb; right slot = page-level action buttons.
  - **Main content area:** 32px horizontal (`spacing-32`) / 24px vertical (`spacing-24`) padding.

**Content sections** — how content stacks inside the main content area:

- **Page sections:** rounded panels (`border-radius: 16px`, `UI/border/general` border, no shadow, 24px padding) that stack vertically with 24px gaps.
- **Nested sections:** one level deep only, on a tinted surface to distinguish from the white parent, 16px–24px padding. Never nest a section within a nested section.

**Forms** — field and form arrangement within a section:

- **Field layout:** flex-wrap with 16px (`spacing-16`) gaps; wide fields fill partial rows, paired narrow fields sit side by side.
- **Form layout:** a form follows **one top-to-bottom reading path** — never split it into two parallel columns. The paired narrow fields above don't break this: a shared row holds fields *read as a single unit* (start/end date) and stays on that one path; it never starts a second column. Group related fields under a section label. Commit through exactly one primary action (see Footer action hierarchy under [Placement patterns](#placement-patterns)).

### Spacing scale

Spacing tokens use numeric naming where the number is the pixel value. Tailwind utilities: `h-spacing-{N}`, `px-spacing-{N}`, `py-spacing-{N}`, `gap-x-spacing-{N}`. The full scale runs `spacing-0` through `spacing-48` in even steps (0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 48); the most common values are below.

| Token | Value | Common use |
|---|---|---|
| `spacing-4` | 4px | Tight gaps within a component |
| `spacing-8` | 8px | Icon-to-label gaps, control row gaps, section separators |
| `spacing-12` | 12px | Card column/row gaps, filter panel insets |
| `spacing-16` | 16px | Field gaps, paired-field spacing, section label-to-content |
| `spacing-20` | 20px | Checkbox/radio and label heights, default icon size |
| `spacing-24` | 24px | Page section padding, section stack gaps, dialog margins |
| `spacing-32` | 32px | Page content horizontal padding |
| `spacing-40` | 40px | Button M height |
| `spacing-48` | 48px | — |

**Named spacing conventions** (cross-component — components reference these, not their own values):

| Convention | DS3 value |
|---|---|
| Control-to-label gap (stacked field) | `spacing-8` |
| Vertical gap between grouped form controls (checkbox/radio lists) | `spacing-16` |
| Toolbar control gap and chip-to-chip gap | `spacing-8` |

### Component heights

| Component | Height |
|---|---|
| Top nav bar | 56px |
| Page header | 56px |
| Dialog header | 48px |
| Button M | 40px (`h-spacing-40`) |
| Button S | 32px (`h-spacing-32`) |
| Input M (inline, no label) | 40px |
| Input M (with stacked label) | 68px (label 20px + gap 8px + field 40px) |
| Select M | 44px |
| Checkbox / radio | 20px |
| Form label | 20px |
| Layout card / icon card | 96px |

## Elevation & Depth

DS3 uses a flat elevation system. Structural chrome (header, footer) uses **borders only** — no shadow. Shadows are reserved for elements that visually float above the page.

| Layer | Shadow | Applied to |
|---|---|---|
| Structural chrome | Border only (`UI/border/general`) | Top nav bar, page header, footer |
| Navigation | Shadow S | Sidebar, drawers |
| Floating | Shadow M | Dropdowns, tooltips, popovers, dialogs |
| Modal | Shadow M + `surface/mask` overlay | Confirmation dialogs |
| Modal drawer | Shadow S + `surface/mask` overlay | Side-panel modals |

**Backdrop:** `rgba(0,10,58,0.30)`.

**Interaction state overlays:** Hover `stateOverlay/hover` `rgba(0,10,58,0.05)` · Pressed `stateOverlay/pressed` `rgba(0,10,58,0.10)` · Selected `compBg/blueLite` `rgba(41,106,255,0.12)` · Blue-item hover `stateOverlay/hoverBlue` `rgba(41,106,255,0.07)` · Blue-item pressed `stateOverlay/pressedBlue` `rgba(41,106,255,0.15)`.

**Focus:** 2px solid `primary` outline, offset 2px outside the component border.

**Disabled:** `opacity: 0.5` per interactive element; the label stays at full opacity for stacked label+field patterns.

**Motion:** `cubic-bezier(0.2, 0, 0, 1)` (ease-out) — 100ms hover transitions, 150ms panel open/close, 250ms dialog entrance/exit. Animate only opacity, transform, and color.

## Shapes

DS3 uses an explicit per-context radius scale. Use `rounded-radius-{N}` Tailwind classes.

| Radius token | Value | Applied to |
|---|---|---|
| `radius-2` | 2px | — (reserved; DS2 badge/tag chips) |
| `radius-4` | 4px | Checkboxes, radio buttons, tags, badge chips |
| `radius-8` | 8px | Inputs, selects, all form controls, buttons |
| `radius-12` | 12px | Layout cards, icon cards (clickable `Card` controls) |
| `radius-16` | 16px | Page section containers, dialogs, tables, widget cards (content containers) |
| `radiusFull` | 9999px | Pill / fully-rounded elements |

## Components

Per-component detail — variants, props, anatomy, and states — lives in the component guidelines under [`component-guidelines/`](component-guidelines/). This section keeps only DS3-level summaries, the cross-component **placement patterns** that belong to no single component file, and foundational **iconography** (which has no separate guideline doc).

### Component summaries

| Component | DS3 summary | Detail |
|---|---|---|
| Buttons | Two sizes (M 40px / S 32px), six categories (Primary, Secondary, Minimal, Emphasis, Danger, AI Exclusive), `radius-8`, 20px icons at 4px gap. `TextButton` for inline low-emphasis actions. | [button.md](component-guidelines/button.md) |
| Form controls | Stacked label + field: input/select 40px (68px with label), `radius-8`, `body1` value, `text-low-minus` placeholder; required `*` in `text-high`. | [input.md](component-guidelines/input.md), [select.md](component-guidelines/select.md), [checkbox.md](component-guidelines/checkbox.md), [radio.md](component-guidelines/radio.md) |
| Tables | Primary data surface. Row heights XL 68 / L 52 / S 36px (no M); 44px header on `surface-tertiary`; controls bar, filter popover, and 32px pagination footer. | [table.md](component-guidelines/table.md), [filters.md](component-guidelines/filters.md) |
| Dialogs | Modal: header 48 / footer 56px, `radius-16`, Shadow M, `surface/mask` backdrop. Use the narrowest fitting width. | [dialog.md](component-guidelines/dialog.md) |
| Cards | `radius-12`, `surface-card` background. Flat by default (border, no shadow); shadow only on elevation (hover / drag). | [card.md](component-guidelines/card.md) |
| Breadcrumb | In the 56px page header; ancestors `text-low` darkening to `text-high` on hover (no shift to `primary`), current page `text-high`, 8px gaps. | [breadcrumb.md](component-guidelines/breadcrumb.md) |

> Card layering (page section → one-level-deep nested section) is covered under [Layout](#layout).
> ⚠ Breadcrumb may be DS2-only — see the open TODOs in `README.md`.

### Placement patterns

Cross-component layout rules that belong to no single component file, grouped by where they apply.

**Action buttons** — the general rule for any action-button group (page header, footer, panel, table/list row-action clusters):

- Right-aligned; exactly one primary action, right-most; all other actions are secondary and sit to its left.
- Group gap: **12px** in DS3 (8px in DS2) between sibling buttons in any action cluster — page-header actions, dialog/drawer footers, **and table/list row-action icon clusters** (the edit/delete/overflow group in a row's action column).
- Icon-only button clusters (e.g. a dialog header's close `×` plus an optional secondary icon) sit **8px** apart — icon-button spacing, separate from the action-button group gap above.

| Context | Spec |
|---|---|
| Page-level actions | In the page header right slot: Primary M (+ Start-icon). The table create action also lives here — not in the table controls bar. |
| Dialog / drawer footer | Right-aligned in the footer: Secondary M (Cancel) + Primary M (Confirm). Applies to Dialog, Drawer, ContentAssistant footers. |
| Filter panel | Secondary S (Clear) + Primary S (Apply). |
| Table / list row actions | Right-aligned icon-button cluster (edit / delete / overflow) in the row's action column, spaced with the standard group gap (12px DS3 / 8px DS2); each icon button carries a Tooltip — see [button.md](component-guidelines/button.md). |

**Forms & collections**

| Context | Spec |
|---|---|
| Form inline add | Text Button M (Main) inside the page section |
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

All design tokens are expressed as Tailwind utility classes and CSS custom properties. Token groups:

- **Light theme** `:root {}` — color, surface, border, overlay, shadow, shape (`--radius-*`), spacing (`--space-*`), and AI tokens
- **Dark theme** — same tokens overridden via `@media (prefers-color-scheme: dark)` and `.theme-dark` class on `<html>`
- **Spacing classes** — `h-spacing-{N}`, `px-spacing-{N}`, `py-spacing-{N}`, `gap-x-spacing-{N}` where N is the pixel value
- **Radius classes** — `rounded-radius-{N}` where N is the pixel value
- **Typography utility classes** — `.text-headline5`, `.text-body1`, etc. (see [Typography](#typography))

## Do's and Don'ts

- **Do** pair each semantic foreground color with its matching background tint token for status chips and tags (e.g., `semantic-red` on `semantic-bg-red`).
- **Do** use `surface-quaternary` as the outermost page background with `surface-primary` page sections on top — respect the four-step surface stacking order.
- **Do** limit card nesting to one level deep, using `surface-secondary` for nested section backgrounds.
- **Don't** apply shadows to page sections or structural chrome (top nav, page header). Shadows are reserved for elements with elevation — floating layers (dropdowns, dialogs, sidebar) or a card lifting on hover/drag.
- **Don't** use italic text — no italic styles exist in this system.
