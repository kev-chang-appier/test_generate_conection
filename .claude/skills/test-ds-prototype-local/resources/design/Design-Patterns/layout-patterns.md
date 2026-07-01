# DS3 Layout Patterns

Reusable **page-composition patterns** for DS3 — how containers, forms, and conditional sections assemble into a page. This file is the source of truth for *composition* (which container wraps what, how triggers reveal content, how to decide spacing). All underlying **token values** (spacing, radius, typography, color, component heights) live in [`../DESIGN-DS3.md`](../DESIGN-DS3.md); this file references them rather than restating them, per the repo convention in [`../component-guidelines/README.md`](../component-guidelines/README.md).

**Token naming:** bare token references use the **DESIGN.md frontmatter names** (the token keys defined in [`../DESIGN-DS3.md`](../DESIGN-DS3.md)) — color/surface/border in kebab-case (`text-high`, `surface-secondary`, `border-general`, `semantic-red`, `primary`), state/overlay tokens slash-pathed (`stateOverlay/hover`, `compBg/blueLite`), spacing/radius on the numeric scale (`spacing-24`, `radius-16`), typography (`headline1`, `body1`, `body1-highlight`). The MCP token-id and Figma-variable forms for the same tokens are cross-referenced in [`../references/component-mapping.md`](../references/component-mapping.md).

**How this file is organised.** It is split into two parts. Read Part 1 first; it applies to every page. Reach into Part 2 only for the patterns your page actually needs.

**Part 1 · Foundations** — the shared structure, vocabulary, and rules that *every* DS3 page follows.

| § | Section | Covers |
|---|---|---|
| 1 | [Page Layout Structure](#1--page-layout-structure) | the shell regions and the scrollable content area |
| 2 | [Section Containers](#2--section-containers) | the Page section / Nested section grouping containers |
| 3 | [Spacing Decisions](#3--spacing-decisions) | how to pick a spacing value when placing elements |
| 4 | [Content Hierarchy](#4--content-hierarchy) | which typography token + color each UI role uses |

**Part 2 · Composition Patterns** — patterns for specific page types. **Not universal:** consult one only when the page calls for it; a page may use none, one, or several. Each builds on the foundations, in particular the Page section container (§2).

| § | Pattern | Reach for it when… |
|---|---|---|
| 5 | [Form Layout](#5--form-layout) | the page collects user input (wizards, settings, filters) |
| 6 | [Section with Side Preview](#6--section-with-side-preview) | an edit surface benefits from a live, read-only preview |
| 7 | [Grouped Summary](#7--grouped-summary-heading-grouped-information) | a read-only, information-dense review or detail page |

---

# Part 1 · Foundations

Apply to every DS3 page.

---

## 1 · Page Layout Structure

The page is composed of three fixed shell regions and one scrollable content area:

```
┌─ TopBar (56px) ──────────────────────────────────┐
├─ Sidebar ─┬─ Content Area ───────────────────────┤
│  56px rail │  padding: spacing-32 all sides        │
│ +240px nav │  background: surface-secondary       │
│  (expanded)│  Page sections stacked vertically    │
│            │  with spacing-24 gap                   │
└────────────┴─────────────────────────────────────┘
```

Region dimensions, backgrounds, and the content-area padding are defined in DESIGN-DS3 → [Layout](../DESIGN-DS3.md#layout) and [Component heights](../DESIGN-DS3.md#component-heights). In short: TopBar and Page header `56px`; Sidebar `296px` expanded (a `56px` icon rail collapsed, plus a `240px` nav panel when expanded); content area uses `surface-secondary` background with `spacing-32` padding on all sides; page sections stack with `spacing-24` gaps.

**Navigation shell:** every page must use a product shell — `aiqua-shell.html` for AIQUA/AQ pages, `botbonnie-shell.html` for BotBonnie/BB pages. Read the corresponding shell HTML before creating any page to understand the TopBar, Sidebar nav tree, and PageHeader structure.

**Do:**
- Follow DESIGN-DS3 → [Placement patterns](../DESIGN-DS3.md#placement-patterns) for the canonical action-button rule — one primary action, right-aligned, plus the group gap. Render every other action as secondary or minimal so the eye lands on the primary first.
- Divide distinct action groups within a header bar with a vertical Divider

**Don't:**
- Place more than one primary action on the same surface — see DESIGN-DS3 → [Placement patterns](../DESIGN-DS3.md#placement-patterns)
- Hardcode color values — always use design tokens

---

## 2 · Section Containers

The passive layout surfaces that wrap and group page content. DS3 names these **Page section** and **Nested section** (see DESIGN-DS3 → [Layout](../DESIGN-DS3.md#layout)); other guidelines refer to them collectively as the **section grouping container**. They are distinct from the interactive `Card` component (see [`../component-guidelines/card.md`](../component-guidelines/card.md)), which carries clickable/selectable behavior and must never be used as a section wrapper. This section covers *when* to reach for each and how they nest.

**Page section** — primary container for page content
- **When to use:** wrapping any distinct content group on the page — forms, tables, charts, KPI rows, settings panels
- **Composition:** a white rounded panel (`surface-primary` background, `border-general` border, `radius-16`, `spacing-24` padding, border-only elevation — never shadow). Values in DESIGN-DS3 → [Layout](../DESIGN-DS3.md#layout) · [Shapes](../DESIGN-DS3.md#shapes).
- Title is optional; when present it uses `headline3`, placed at the top with `spacing-24` to the first content
- Content groups within the section are separated by `spacing-24`; related fields within a group by `spacing-16`

**Nested section (gray section)** — nested container inside a Page section
- **When to use:** showing conditional or secondary content revealed by a toggle, switch, selectable card, or checkbox
- **Composition:** a tinted block (`surface-secondary` background, `radius-12`, `spacing-24` padding, `spacing-12` internal gap)
- `spacing-12` gap between the trigger and the Nested section
- **One level deep only** — never nest a Nested section inside another Nested section

---

## 3 · Spacing Decisions

The full spacing scale and its per-token usage live in DESIGN-DS3 → [Spacing scale](../DESIGN-DS3.md#spacing-scale). This file keeps only the **decision hierarchy** — how to pick a value when placing elements:

1. Same component internals — `spacing-4` to `spacing-8`
2. Adjacent fields within the same group (vertical), and side-by-side fields (horizontal) — `spacing-16`
3. Trigger to its conditional content — `spacing-12`
4. Sections within a card — `spacing-24`
5. Cards on a page — `spacing-24`
6. Content to page edge — `spacing-32`

---

## 4 · Content Hierarchy

This table is the **source of truth for role → token + color** assignments — which typography token *and* which color each UI role uses. The underlying token values are defined in DESIGN-DS3 → [Typography](../DESIGN-DS3.md#typography) (sizes/weights) and [Colors](../DESIGN-DS3.md#colors); this table is the role-by-role view that composes them.

| Role | Typography | Color |
|---|---|---|
| Page title | `headline1` | `text-high` |
| Section card title | `headline3` | `text-high` |
| Sub-section heading | `headline5` | `text-high` |
| Field label | `headline5` | `text-high` |
| Required marker `*` | `headline6` | `text-high`, inline after label text |
| Helper text | `body2` | `text-med` |
| Body text / values | `body1` | `text-high` |
| KPI number | `headline2` | `text-high` |
| KPI label | `body2` | `text-med` |
| Table header | `headline5` | `text-med` |
| Table cell | `body1` | `text-high` |
| Link text | `body2` | `primary` |
| Read-only field label | `body1-highlight` | `text-high` |
| Counter | `body2` | `text-med` |
| Placeholder | `body1` | `text-low-minus` |

---

# Part 2 · Composition Patterns

Specific page-type patterns — **consult as needed, not by default.** A page may use none, one, or several. Each builds on the foundations above, in particular the Page section container (§2).

---

## 5 · Form Layout

**When to use:** any page that collects user input — creation wizards, settings, configuration panels, filter forms.

How form fields, selections, and conditional sections compose inside a Page section. Field/label/group spacing values follow the DESIGN-DS3 named conventions (control-to-label `spacing-8`, grouped controls `spacing-16`) — see [Spacing scale](../DESIGN-DS3.md#spacing-scale).

**Form width (measure):**
- Field widths are standardised to a small set of steps (200 / 416 / 632px) so that fields
  across rows align to a shared grid. The goal is visual order: arbitrary per-field widths
  create noise even when each field is individually reasonable. Width should reflect the
  expected input length *within these steps* — not be chosen freely.
- The Page section card stays full-width (per §2). The form *content* is held in a single
  left-aligned column with a `max-width` of **632px**; the card's right side is left as
  whitespace. Form fields never stretch to fill the card.
- Standard field width is **200px** (40px height, 14px text). Side-by-side fields use a
  **16px** horizontal gap (per DESIGN-DS3 → Forms). Row widths derive from this single unit:
  - 1 field — **200px** — short input: number, percentage, code, postal code, short select
  - 2 fields — **416px** (= 200 + 16 + 200) — general text: name, email, single-line title
  - 3 fields — **632px** (= 200 + 16×2 + 200×2) — long input: description, URL; also the form's max-width
- **632px is a cap, not a fixed width.** Effective width = `min(available content width, 632px)`.
  Fields flex-wrap within this range: the row narrows and wraps when the viewport shrinks
  (sidebar expanded, split window, small laptop), and stops growing at 632px on wide screens.
- **Field width must reflect expected input length — never default everything to full width.**
  Short inputs (number / percentage / code) must use the 200px width; widening them to 416/632
  is wrong. Long inputs (description, URL) may take the full 632px.
- Only **logically related** short fields sit side by side (start/end date, City + Zip).
  Unrelated fields stack on separate rows even if they would fit.
- **Few-field forms:** prefer narrow fields + whitespace. Do NOT widen fields to fill the card.

> Note: the 200 / 416 / 632 / 632-cap values are layout-composition conventions, not design
> tokens. If the Appier Design System MCP exposes width/size tokens, reference those token ids
> here instead of the literal px values.

**Constrained containers (Dialog, Popover, Drawer):**
- The 200 / 416 / 632 system above is the *page-form* rule, where field width drives layout.
  Inside a popped container the relationship inverts: the container's available width caps the
  field. The unifying rule is **`field width = min(container available width, category max-width)`**,
  where category max-width is 200 (short) / 416 (general) / 632 (long). Short fields stay fixed
  at **200px** and never fill; general/long fields fill up to their category cap. (The page form
  is just this rule with a large available width, so every field reaches its category max.)
- **Dialog / Popover** — size the container to its content (just wide enough for the widest
  field); do not apply the 632px page cap. A long input takes the full available content width.
- **Drawer** — width is fixed by the DS3 spec (SMALL 400 · MEDIUM 800 · LARGE 1000px, content
  padding 24px; see [drawer.md](../component-guidelines/drawer.md)). Pick the size by content
  purpose, **not** to hit a field-width target.
  - SMALL (400px) → ~352px usable. Short fields stay **200px**. General/long fields (email,
    URL, description) switch to fill, capped at their category max (416 / 632) — so in practice
    they fill to ~352px. A long field never forces an upgrade to MEDIUM.
  - MEDIUM (800px, default) → ~752px usable. Every category reaches its full width (416 / 632),
    so layout matches the page form exactly. This avoids the SMALL fill case altogether.
  - LARGE (1000px) → ~952px usable. Same as MEDIUM; the 632px long-field cap still applies.
  - Dynamic widths (25 / 40 / 55% of viewport): compute usable width, then apply the same
    `min(available, category max)` rule — the category caps are unchanged.

**Field stacking:**
- Section title at the top of the card, `spacing-24` gap to the first field
- `spacing-8` gap between a field label and its input
- `spacing-16` gap between adjacent fields within the same group
- `spacing-24` gap between field groups (matches the §3 "sections within a card" rule)
- Required fields append ` *` to the label; info icon appears inline after label text

**SelectableCard Grid:**
- Preceded by a field label, `spacing-8` gap to the card row
- Cards in a horizontal row with `spacing-16` gap, wrapping if needed
- Single-selection (radio behavior); states: Default → Selected (blue border + blue label) → Hover

**Conditional expand (Nested section):**
- A Switch, SelectableCard, or Checkbox can trigger a Nested section (gray section) that appears with `spacing-12` gap below the trigger
- When the trigger is OFF / unselected, the Nested section collapses and takes no space
- Multiple toggles stack with `spacing-16` gap between them
- A Checkbox inside a Nested section can reveal further inline content — this is the only case where content goes one level deeper
- Nested sections never nest inside another Nested section

---

## 6 · Section with Side Preview

**When to use:** a create/edit surface where seeing the rendered result helps — push / SMS / LINE / in-app / email campaigns, template editors. The preview is **read-only**; it never collects input.

A **single Page section** is divided by one **vertical divider** into a left input area and a right preview area — not two nested cards. This is a property of one section, not the page; other sections stay full-width (e.g. a full-width Variants table above a split Creative section).

```
┌─ Page section ──────────────────────────────────────────────┐
│  Section title (headline3)                 │                 │
│                                            │                 │
│  single-column form                        │  device /       │
│  (label→input, per §5)                     │  output frame   │
│                                            │  (read-only)    │
│                                            │                 │
│                                            │  [ Send test … ]│
│         input area                         │  preview area   │
│   flex: min 580px, max 680px               │ fills, min 580px│
└──────────────────────────────────────────────────────────────┘
                                             ↑ single vertical divider
        Total content width ≥ ~1160px (≈1224px with container padding)
```

**Width** (per the AQ DS3 Regular-campaign reference):
- Input area flexes between **min 580px** and **max 680px**.
- Preview area **fills the remaining width**, with a **min of 580px**.
- The two sit side by side only when the section has ~**1160px** of content width (≈1224px with container padding).

**This does not contradict the single-column form rule** (DESIGN-DS3 → [Form layout](../DESIGN-DS3.md#layout)): the right area is a read-only preview, not a second form column. The input column width and the field widths are two separate things — the rules below keep them from being confused.

*Definitions*
- **Input column width:** 580–680px — the width of the area that holds the form, not the width of any field.
- **Field width categories (§5):** 200 / 416 / 632px.

*Rules*
1. The input column width is independent of field width.
2. Compute field width as `fieldWidth = min(inputColumnWidth, categoryMaxWidth)` (the §5 constrained-container formula).
3. A field never exceeds its category maximum — long inputs cap at 632px even when the column is wider.
4. When the column is narrower than a row of side-by-side fields, the row wraps; it never overflows the column.
5. Any space left between the widest field and the column edge is gutter to the divider.
6. Do not widen fields beyond their category maximum to fill the column.

The 632px *measure* in §5 caps a full-width form column; in this split that column rule is replaced by the 580–680px band, while the field categories (rule 3) stay unchanged.

**Preview area:**
- Hosts a frame matched to the channel — a phone frame for push / SMS / LINE / in-app; a desktop ⇄ mobile toggle for email.
- Updates live as the user edits; before anything is configured, render a placeholder / empty state, not a blank box.
- Carries at most one action (e.g. *Send test creative*) and a short caption noting the preview is approximate.
- **Sticky:** stays pinned in view while the input area scrolls, so the result stays visible.

**Narrow viewports:** below the ~1160px total, the divider is dropped and the preview moves **beneath** the input area at full width — never shrink either area below its 580px minimum to force a side-by-side fit.

**Don't:**
- Wrap either area in its own card — use one section with a single divider
- Place editable fields in the preview area
- Split sections that have no renderable output
- Treat the preview as confirmation of a committed state

---

## 7 · Grouped Summary (heading-grouped information)

**When to use:** an **optional** pattern for read-only, information-dense surfaces — a review step before launch, or a record detail page — where many settings must be listed and scanned. Use it when a flat list would be too long to parse; skip it for a handful of fields.

Collect values into named groups inside one Page section. **Reuse existing type roles — do not invent new ones:**

- **Group heading — `headline3`** — the same role as a Section card title; here it marks one of several groups within the section.
- **Field label — `headline5`** — the standard field-label role (see §4).
- **Value — `body1`**.

```
┌─ Page section ─────────────────────────────┐
│  Campaign info            ← headline3       │
│    Campaign name          ← headline5       │
│    %value%                ← body1           │
│    Notification ID        ← headline5       │
│    %value%                ← body1           │
│                                             │
│  Audience                 ← headline3       │
│    User to include        ← headline5       │
│    [tag] [tag] [tag]                        │
│  …                                          │
└─────────────────────────────────────────────┘
```

**Mirror the input order.** Groups and their order should follow the flow the user already moved through — the wizard steps or form sections used to create the record (e.g. Audience → Creative → Settings → Schedule). When the summary echoes the path the user took, each value maps back to where it was set. Do not re-sort the summary by an unrelated logic (alphabetical, by data type).

**Spacing** (per §3):
- Group-to-group — `spacing-24`
- Label → value — `spacing-8`
- Consecutive label/value pairs within a group — `spacing-16`

**Combine with §6:** a review step often places the grouped summary in the **left** area and a preview in the **right**.

**Don't:**
- Introduce a new heading size for groups — reuse `headline3` / `headline5`
- Use this pattern for short forms — the heading overhead outweighs the benefit
- Re-order groups away from the creation flow
