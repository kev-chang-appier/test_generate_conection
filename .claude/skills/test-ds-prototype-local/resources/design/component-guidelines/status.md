# Status Usage Guidelines

**Last updated:** 2026-06-30

**Components:** `Status`  
**Storybook:** [Status](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-status-status--docs)

---

## Overview

`Status` is the entity-state indicator for a record's state (Active, Error, In progress…). **Every `Status` carries a semantic-colored dot** that names the state's hue; the rest of the treatment differs by version and variant:

- **DS2** — a **semantic-colored dot + a `text-high` (dark) label**, with **no background tint and no pill**. There is **no tinted status badge in DS2**; the dot carries the hue and the label stays `text-high`.
- **DS3** — a **semantic-colored dot + label** with two background modes:
  - **With Background (default)** — a `semantic-bg-*` tint pill (`radius-4`) holding the dot + a **`text-high` (dark) label**. The dot carries the hue; the label stays `text-high` and reads uniformly across all states.
  - **Without Background** — the dot + a **`semantic-*` (foreground-colored) label**, no pill. Here the label takes the same semantic hue as the dot.

Do not carry the DS3 tint pill back into DS2 — pick the treatment that matches the target version.

> `Status` is distinct from `Badge`. `Badge` is a general tinted label for categories/counts/AI markers (see [badge.md](badge.md)); `Status` specifically conveys a record's state in the version-correct form above.

---

## Anatomy

**DS2 — dot + label (no background)**

```
  ● Active            ← semantic-colored dot (≈8px) + 8px gap + text-high label
  ● Error
  ● In progress
```

| Zone | Spec |
|---|---|
| Dot | Small semantic-colored circle (≈8px). The only element that carries the semantic hue. |
| Label | `text-high` (dark), `body1`. Never semantic-colored, never on a tinted background. |
| Background | **None.** No tint, no pill, no border. |

**DS3 — With Background (default)**

```
  ┌──────────────┐
  │ ● Active      │   ← semantic-bg-* pill + semantic-colored dot + text-high label, radius-4
  └──────────────┘
```

| Zone | Spec |
|---|---|
| Dot | Small `semantic-*` (foreground) circle (≈6px). The only element that carries the semantic hue. |
| Label | `text-high` (dark), `body1`. Reads uniformly across states — not semantic-colored. |
| Background | `semantic-bg-*` tint matching the state. |
| Radius | `radius-4`. |

**DS3 — Without Background**

```
  ● Active            ← semantic-colored dot + semantic-colored label, no pill
```

| Zone | Spec |
|---|---|
| Dot | `semantic-*` (foreground) circle (≈6px). |
| Label | `semantic-*` (foreground), `body1` — same hue as the dot. |
| Background | **None.** No tint, no pill, no border. |

---

## Status set

The dot color is shared by every version and variant; the DS3 *With Background* variant adds the matching tint behind it.

| State | Dot color (semantic foreground) | DS3 With-Background tint |
|---|---|---|
| Error | `semantic-red` | `semantic-bg-red` |
| Warning | `semantic-orange` | `semantic-bg-orange` |
| Ok / success | `semantic-green` | `semantic-bg-green` |
| Stand by | `semantic-blue` | `semantic-bg-blue` |
| Extra | `semantic-purple` | `semantic-bg-purple` |
| Inactive | `semantic-gray` | `semantic-bg-gray` |
| In progress | primary blue `#296AFF` | `semantic-bg-blue` |

Label color by treatment: **DS2** and **DS3 With Background** → `text-high`; **DS3 Without Background** → the dot's `semantic-*` foreground. The dot always carries the hue, so the With-Background label never needs to be semantic-colored.

---

## Do's and Don'ts

**Do**
- Always render a semantic-colored dot — both DS3 variants and DS2 keep it; the dot is what carries the state's hue
- Default to the DS3 *With Background* variant (`semantic-bg-*` pill + `text-high` label); use *Without Background* (dot + semantic-colored label) where a pill reads too heavy, e.g. dense table rows
- Keep the `text-high` label for DS2 and DS3 With Background — only the dot carries color, so the row stays scannable
- In the DS3 *Without Background* variant, color the label with the same `semantic-*` foreground as the dot
- Reuse one status term + color app-wide (always "Active", never mixing "Live")
- Pair the dot with a text label — never rely on color alone to convey state

**Don't**
- Never drop the dot — it is the constant across both DS3 variants and DS2; the background tint is the optional part
- Never color the DS3 With-Background (or DS2) label with the semantic hue — the label is `text-high`; the dot and tint already signal state
- Never build a tinted status pill in DS2 — that treatment does not exist there; use the dot + `text-high` label
- Don't invent colors outside the set above — map every state to one of the semantic colors

---

## Related

- [badge.md](badge.md) — general tinted labels, counts, and AI markers (a different component).
- [tag.md](tag.md) — tinted, interactive/removable labels.
- Raw semantic color values: [DESIGN-DS2.md](../DESIGN-DS2.md) / [DESIGN-DS3.md](../DESIGN-DS3.md).
