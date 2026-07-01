# Avatar Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Avatar`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=19643-298830)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-47), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=19643-298830))  
**Storybook:** [Avatar](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-avatar--docs)

---

## Overview

`Avatar` identifies a user or entity with a photo, auto-generated initials, or a manual abbreviation. A manual abbreviation takes precedence if provided; otherwise the photo shows; a name without a photo or abbreviation derives two-letter initials with a consistent background color from a fixed palette; supplying none shows a generic placeholder.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `Avatar` with a photo | Known user with a profile photo |
| `Avatar` with a name | User without a photo — initials and auto-color from the name |
| `Avatar` with an abbreviation | Entity without a human name (e.g. "API", "S3") — manual abbreviation |

---

## States

| State | Visual |
|---|---|
| Image loaded | Photo fills the circle/square, cropped to center |
| Image error / no photo | Background tint (`*-30` ramp) + initials or abbreviation in `gray-80` |
| No name, photo, or abbreviation | Generic placeholder icon in `border-emphasis` |

---

## Do's and Don'ts

**Do**
- Provide a name even when a photo is shown — it supplies the accessible text for screen readers
- Use the square shape for system-level entities (integrations, bots, channels) to visually distinguish them from user avatars
- Use small size (20px) in dense table rows; reserve large size (32px) for profile headers and modals

**Don't**
- Avoid using an abbreviation for human users — give a name and let the initials derive consistently
- Avoid hardcoding a color for user avatars; the auto-assignment creates visual distinction across a list of users
- Never use `Avatar` as a decorative placeholder for non-identity content — use `Tag` or a custom icon instead

---

## Anatomy

```
  ┌──────────────────┐
  │                  │   ← colored background (auto or explicit color)
  │       AB         │   ← initials, gray-80
  │                  │
  └──────────────────┘
     ↑ shape: round (circle) or square (rounded rect)
```

Sizes (component-specific): small 20px · medium 24px (default) · large 32px. Square corners are size-specific in DS3 (small 4px · medium 6px · large 8px); DS2 square uses a flat 4px; round uses `radius-full`. Initials use `headline6` (small/medium) and `headline5` (large).

---

## Component Style Tokens

```yaml
# DS2  (Avatar shares one component across versions; only square-corner radius differs)
avatar:
  backgroundColor: "{colors.blue-30}"   # auto-assigned from name/abbr hash → blue/orange/green/purple/fuchsia-30 or gray-10 (full-palette ramp tokens)
  textColor: "{colors.gray-80}"         # initials
  rounded: "radius-full"                # round (default); square → radius-4
  size: 20px / 24px / 32px              # small / medium (default) / large
  typography: "{typography.headline6}"  # large uses {typography.headline5}
avatar-placeholder:
  textColor: "{colors.border-emphasis}" # generic icon when no name/src/abbr
```
```yaml
# DS3
avatar:
  backgroundColor: "{colors.blue-30}"   # auto-assigned from name/abbr hash → blue/orange/green/purple/fuchsia-30 or gray-10 (full-palette ramp tokens)
  textColor: "{colors.gray-80}"         # initials
  rounded: "radius-full"                # round (default); square → radius-4 / radius-6 / radius-8 by size
  size: 20px / 24px / 32px              # small / medium (default) / large
  typography: "{typography.headline6}"  # large uses {typography.headline5}
avatar-placeholder:
  textColor: "{colors.border-emphasis}" # generic icon when no name/src/abbr
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).
