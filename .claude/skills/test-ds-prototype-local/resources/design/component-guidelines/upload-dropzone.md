# Dropzone Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `Dropzone`, `FileInfoCard`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=72439-204527)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-57), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=7603-45118))  
**Storybook:** [Dropzone](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-upload-dropzone--docs)

---

## Overview

`Dropzone` handles inline file selection — drag-and-drop or click-to-browse — with per-file status and preview. Use it for form-based file inputs where attachment and status display happen in the same view. For background or batch uploads that run while the user continues working, see [`UploadWindow`](upload-window.md).

---

## Components at a Glance

| Component | When to use |
|---|---|
| `Dropzone` | Inline file input — drag-and-drop or browse, with file previews and per-file status |
| `FileInfoCard` | Single uploaded-file row rendered by `Dropzone` — use directly only for custom file list layouts |

---

## Variants

`Dropzone` has two layout variants:

| Variant | Layout | When to use |
|---|---|---|
| Card (default) | Stacked `FileInfoCard` rows beneath the drop target | Multi-file upload or any non-image file type |
| Image | Single thumbnail preview; hides the dropzone once a file is present | Single-image upload (profile photo, creative asset) |

---

## States

| State | Visual |
|---|---|
| Default (empty) | Dashed border drop target with upload icon and instruction text |
| Drag-over | Drop target highlighted with brand accent fill |
| Loading | `FileInfoCard` shows a spinner while the file uploads |
| Uploaded | `FileInfoCard` shows file icon, name, size, and optional preview/delete actions |
| Warning (global) | Amber icon + warning message below the drop target |
| Error (global) | Red icon + error message below the drop target |
| Warning (per file) | Amber icon on the `FileInfoCard` row; tooltip shows the warning text |
| Error (per file) | Red icon on the `FileInfoCard` row; tooltip shows the error text |
| Disabled | Drop target and file actions non-interactive; muted appearance |

---

## Do's and Don'ts

**Do**
- Always give users a way to remove files they added by mistake
- Render the per-file actions (remove, preview) on a `FileInfoCard` as `IconButton`s — the icon-only button component with its own hover and focus states — not a bare `×` glyph or arbitrary text character
- Show the loading state on a file row immediately when a file is dropped, before the upload finishes — it prevents duplicate submissions
- Use the card variant for any non-image file type (PDF, DOCX, video) so the file name and type are legible
- Give each warning and error a tooltip so touch/keyboard users can access the message without hover
- Style the "Browse" word in the drop-target instruction as a link so the click-to-upload affordance reads as interactive, not as plain instruction text
- Render the drop-target instruction above its supported-formats line so the action reads first and the constraint reads as a quieter sub-line
- Keep every `FileInfoCard` row at the same height and spacing so the file list reads as one uniform set rather than unrelated rows

**Don't**
- Never use the image variant for multi-file or non-image uploads — the thumbnail layout doesn't accommodate multiple rows or file-type icons
- Avoid omitting accepted formats and size limits from the drop target instruction text — users discover constraints only after a failed upload
- Never let the file list show success before the upload actually completes — reflect the real upload result, not just what the user dropped

---

## Anatomy

```
  ┌─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─┐
  │  [↑]  Drop files here or Browse        ← dashed drop target
  │       Supported: JPG, PNG, PDF · 10 MB │
  └─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─┘
  ┌──────────────────────────────────────┐
  │ [icon]  filename.pdf        [👁][✕]  │  ← FileInfoCard (uploaded); actions are IconButtons
  │         1.2 MB                        │
  ├──────────────────────────────────────┤
  │ [icon]  uploading.jpg       [  ⟳  ]  │  ← FileInfoCard (loading)
  └──────────────────────────────────────┘
```

---

## Component Style Tokens

`Dropzone` and `FileInfoCard` have no dedicated DS3 styling — the DS2 component is used in both versions; the blocks below are identical except for the radius scale form.

```yaml
# DS2  (from src/components/Upload/Dropzone/BaseDropzone.tsx + FileInfoCard.tsx)
dropzone:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-low}"
  border: "1px dashed {colors.border-general}"   # dashed drop target
  rounded: "{rounded.md}"                         # rounded-radius-8
  width: 100px                                    # image variant 100x100; card variant is full width
  height: 100px                                   # card variant collapses to 86px tall
  padding: 16px
dropzone-hover:
  border: "1px solid {colors.semantic-blue}"
  textColor: "{colors.semantic-blue}"
dropzone-dragover:
  backgroundColor: "{overlays.compBg/blueLite}"     # blue tint (selected/drag-over fill)
  border: "1px solid {colors.semantic-blue}"
  textColor: "{colors.blue-normal}"               # full-palette ramp token
dropzone-warning:
  border: "1px solid {colors.semantic-orange}"
  textColor: "{colors.semantic-orange}"
dropzone-error:
  border: "1px solid {colors.semantic-red}"
  textColor: "{colors.semantic-red}"
fileinfocard:
  rounded: "{rounded.sm}"                          # rounded-radius-4 image preview
  height: 86px                                     # full-width row; 60x60 preview thumbnail
  typography: "{typography.headline6}"            # subtitle / warning / error text
```
```yaml
# DS3  (same source — no v3 file)
dropzone:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-low}"
  border: "1px dashed {colors.border-general}"
  rounded: "radius-8"
  width: 100px                                    # image variant 100x100; card variant is full width
  height: 100px                                   # card variant collapses to 86px tall
  padding: 16px
dropzone-hover:
  border: "1px solid {colors.semantic-blue}"
  textColor: "{colors.semantic-blue}"
dropzone-dragover:
  backgroundColor: "{overlays.compBg/blueLite}"
  border: "1px solid {colors.semantic-blue}"
  textColor: "{colors.blue-normal}"               # full-palette ramp token
dropzone-warning:
  border: "1px solid {colors.semantic-orange}"
  textColor: "{colors.semantic-orange}"
dropzone-error:
  border: "1px solid {colors.semantic-red}"
  textColor: "{colors.semantic-red}"
fileinfocard:
  rounded: "radius-4"                             # image preview
  height: 86px                                     # full-width row; 60x60 preview thumbnail
  typography: "{typography.headline6}"
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

---

**Version note:** `Dropzone` and `FileInfoCard` have no dedicated DS3 styling or stories — use the DS2 component (it picks up Inter when DS3 tokens are applied globally). Behavior is unchanged. Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
