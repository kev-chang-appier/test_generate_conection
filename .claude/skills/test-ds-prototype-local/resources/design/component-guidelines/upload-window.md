# Upload Window Usage Guidelines

**Last updated:** 2026-06-26

**Components:** `UploadWindow`  
**Figma:** DS3 ([Component](https://www.figma.com/design/z2jVgbxIGyU3XCFSvwbQ4S/DS3-%7C-Library?node-id=63503-294934)) · DS2 ([Spec](https://www.figma.com/design/CfUvdo5ibWVSExALxU4jvI/Design-System-%7C-Spec?node-id=1-57), [Component](https://www.figma.com/design/xQS97DcKNTYfyCYaUOLMWv/Design-system-2.0-%7C-Library?node-id=46343-6253))  
**Storybook:** [UploadWindow](https://appier-aixon-common.de.r.appspot.com/aiqua-design-system-ci/main/storybook/?path=/docs/components-upload-uploadwindow--docs)

---

## Overview

`UploadWindow` is a floating panel that tracks the progress of a batch or background upload queue. It surfaces per-file status — uploading, success, error — without blocking the current page, so users can continue working while files transfer. Use it when uploading takes more than a few seconds or involves multiple files; for single inline uploads, [`Dropzone`](upload-dropzone.md) handles progress inline. It is not file-specific — it also fits other batch operations that run in the background (exports, background jobs) where multiple items each need individual status feedback.

---

## Components at a Glance

| Component | When to use |
|---|---|
| `UploadWindow` | Floating panel tracking a batch or background upload queue with per-item status |
| [`Dropzone`](upload-dropzone.md) | Inline single-view file input — attachment and status in the same form |

---

## States

| State | Visual |
|---|---|
| Open | Floating panel visible with full file list |
| Collapsed | Panel minimized to title bar; users can expand to check progress |
| Loading | Spinner in header while the upload queue initializes |
| Item uploading | Row shows a spinner |
| Item success | Row shows a check icon |
| Item error | Row shows an error icon; tooltip surfaces the failure reason |

---

## Do's and Don'ts

**Do**
- Show `UploadWindow` when batch uploads or background transfers exceed a few seconds — it lets users continue working while tracking progress
- Show a one-line cancellation warning when navigating away will interrupt uploads
- Let users collapse the panel when they don't need to watch every file
- Give error rows a tooltip that explains why a file failed — "Upload failed — file too large" is more useful than a bare error icon

**Don't**
- Avoid making the panel impossible to dismiss unless the upload cannot be abandoned (e.g. a publish step) — always give users a way to close it
- Never use `UploadWindow` as a generic notification panel — every list entry must be a tracked task with its own status; use `Toast` for one-off action results
- Avoid replacing the status icon with a custom icon for in-progress, done, or failed items — it breaks the spinner/check/error language that lets users read every row's state at a glance
- Avoid a static title like "Upload" while items are transferring — reflect the live state ("Uploading 3 files", "All uploads complete") so the header matches the rows below

---

## Anatomy

```
  ┌─────────────────────────────┬───┬───┐
  │  Uploading 3 files          │ ─ │ × │  ← title bar (collapse / close)
  │  Cancel all                 │   │   │
  ├─────────────────────────────┴───┴───┤
  │ [icon]  report.csv          [✓]     │  ← UploadItem (success)
  │ [icon]  image.png           [⟳]     │  ← UploadItem (uploading)
  │ [icon]  data.xlsx           [!]     │  ← UploadItem (error, tooltip)
  └──────────────────────────────────────┘
```

---

## Patterns

### Generic async task tracking

`UploadWindow` is not file-specific — each row can carry any label and status. When a feature runs multiple concurrent background operations (bulk exports, batch processing jobs, background imports) and each item needs individual success/error feedback, `UploadWindow` is a reasonable fit. For example, an "Exporting 3 segments" panel can list each segment with its own uploading, success, or error row and a tooltip on failures. Prefer this only when there are multiple items with distinct statuses; use `Toast` for a single operation with one outcome.

---

## Component Style Tokens

`UploadWindow` has no dedicated DS3 styling — the DS2 component is used in both versions; the blocks below are identical except for the radius scale form.

```yaml
# DS2  (from src/components/Upload/UploadWindow.tsx)
upload-window:
  width: 288px
  rounded: "{rounded.md}"                       # rounded-t-radius-8 (top corners only)
  # plus a two-layer drop shadow (≈ Shadow S)
upload-window-titlebar:
  backgroundColor: "{colors.surface-blue}"
  textColor: "{colors.text-white-hold}"         # title + collapse/close icons
  padding: 12px 12px 12px 16px
  typography: "{typography.headline5}"
upload-window-hint:
  backgroundColor: "{overlays.compBg/blueLite}"   # blue tint
  textColor: "{colors.text-low}"                # Cancel link uses {colors.blue-normal}, hover {colors.blue-hover}
  padding: 4px 16px
upload-window-item:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-med}"               # label (folder rows use headline5; plain rows inherit)
  border: "1px solid {colors.border-general}"   # bottom divider on collapsible folder rows only
  padding: 8px 16px
  typography: "{typography.headline5}"
upload-window-item-hover:
  backgroundColor: "{colors.state-hoverPrimary}"   # collapsible folder rows only; component state fill (full-palette token)
upload-window-item-active:
  backgroundColor: "{colors.state-pressed-primary}" # collapsible folder rows only; component state fill (full-palette token)
```
```yaml
# DS3  (same source — no v3 file)
upload-window:
  width: 288px
  rounded: "radius-8"                          # top corners only
  # plus a two-layer drop shadow (≈ Shadow S)
upload-window-titlebar:
  backgroundColor: "{colors.surface-blue}"
  textColor: "{colors.text-white-hold}"
  padding: 12px 12px 12px 16px
  typography: "{typography.headline5}"
upload-window-hint:
  backgroundColor: "{overlays.compBg/blueLite}"
  textColor: "{colors.text-low}"
  padding: 4px 16px
upload-window-item:
  backgroundColor: "{colors.surface-primary}"
  textColor: "{colors.text-med}"               # folder rows use headline5; plain rows inherit
  border: "1px solid {colors.border-general}"   # bottom divider on collapsible folder rows only
  padding: 8px 16px
  typography: "{typography.headline5}"
upload-window-item-hover:
  backgroundColor: "{colors.state-hoverPrimary}"   # collapsible folder rows only
upload-window-item-active:
  backgroundColor: "{colors.state-pressed-primary}" # collapsible folder rows only
```

Raw token values: [DESIGN-DS3.md](../DESIGN-DS3.md) / [DESIGN-DS2.md](../DESIGN-DS2.md).

---

**Version note:** `UploadWindow` has no dedicated DS3 styling or stories — use the DS2 component (it picks up Inter when DS3 tokens are applied globally). Behavior is unchanged. Cross-version differences: see [DS3-vs-DS2.md](../DS3-vs-DS2.md).
