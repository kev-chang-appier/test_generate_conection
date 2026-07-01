# lofi pattern floor

Curated **from** the DS guidelines (`component-guidelines/*.md`) — the compliance-critical
*pattern* rules (which component, which variant, correct anatomy) condensed to what lofi most often
gets wrong. lofi reads this **instead of** fetching the per-component guidelines; the kit
(`ds2-kit.css` / `ds3-kit.css`) already covers the *visual* rules. Version-agnostic — patterns are
identical in DS2 and DS3; only the visual layer differs. Maintained alongside the kit (so it can lag
the guidelines slightly — acceptable on the approximate path; hifi reads the live guidelines).

**lofi builds ONE representative view** (the populated screen) — no empty/selected/overlay state
variants and no state switcher. Rules below tagged *(hifi)* are about those extra states and don't
apply to a lofi build; everything else is about getting that single view's patterns right.

## Filters (`filters.md`)
- **Selection model is per-filter, from the data:** mutually-exclusive value → **SingleSelect**;
  zero-or-more → **MultiSelect** with a checkbox list **and staged Apply/Cancel** (re-fetch once on
  Apply). Make `isSearchable` when the option list is ≥8. Never use SingleSelect where multi is needed.
- Place **Search to the left** of the filter chips; keep the whole bar on one row with a uniform gap.
- An **unset** chip reads differently from a **set** one: both use a solid border, but unset =
  emphasis border + no value/clear icon; set = neutral border + value + `×` clear. Clearing `×`
  resets the value *and* removes the chip.
- Show only the common filters by default; hide the rest behind **Add filter** once you exceed ~5–6
  chips. Never place chips below the table or inside column headers.

## Search (`search.md`)
- In a control bar: **left-aligned, no label**, icon + placeholder ("Search campaigns"); same height
  as the filter buttons. Show a `×` clear while filled.
- After a query, show a result count or **"No results for '[query]'"** — never a silent empty result.

## Table (`table.md`)
- The primary/name column is a **link** (opens detail/edit). Right-align numeric columns with
  consistent precision. Header height 40px (DS2) / 44px (DS3).
- Multi-select tables show a checkbox per row + **select-all in the header**.
- *(hifi)* a list/table page **must** build an **empty state** (message + CTA); selecting rows shows
  a **bulk-action bar** — both are separate states, deferred to hifi.

## Drawer vs Dialog (`drawer.md`, `dialog.md`)
- **Drawer** — long or multi-section forms, or when the user must see the page beneath (create/edit
  campaign while viewing the list). Always a header `×`; title is a noun phrase ("Campaign settings").
- **Dialog** — a modal decision: confirm a destructive/irreversible action, a critical alert, or a
  **short** form (≤4 fields, single-purpose). Title is a verb phrase ("Delete campaign").
- Both: exactly **one primary** button in the footer, rightmost; never give two footer buttons the
  primary emphasis. Destructive confirm → **Danger** variant.

## Dialog footer labels (`dialog.md`)
- Name the verb, matching the title: **"Delete" / "Create" / "Save" / "Rename"** — never "OK", "Yes",
  "Confirm", or "Submit". Alert acknowledgement = single "Got it".

## Badge / status (`badge.md`)
- Tinted pill + dot, color = semantic meaning: green = active/live, gray = paused/neutral,
  orange = draft/pending, red = error/blocked. Keep one status term per concept app-wide.
- 1–3 words only. If the item is removable/interactive it's a **Tag** (has an `×`), not a Badge.

## Primary action
- **One primary per region**, and the page-level primary lives in the **page header** (the shell's
  `.btn-primary` slot) — never a second primary CTA inside `.page-content`.

## Pagination (`pagination.md`)
- Always show the **record-range summary** (it's the only place the count appears). Reset to page 1
  when items-per-page changes. Hide pagination entirely when everything fits on one page.
