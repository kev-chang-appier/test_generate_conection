# Component Usage Guidelines

Usage guidelines for Appier Design System components — props, anatomy, and do's/don'ts. Token values, shared rules, and DS2 → DS3 differences live centrally in the root design docs ([`../DESIGN-DS3.md`](../DESIGN-DS3.md), [`../DESIGN-DS2.md`](../DESIGN-DS2.md), [`../DS3-vs-DS2.md`](../DS3-vs-DS2.md)) and the authoring rules in [`../references/GUIDELINE-AUTHORING.md`](../references/GUIDELINE-AUTHORING.md); these docs reference those values rather than restating them.

---

## Inputs

| File | Components | Summary |
|---|---|---|
| [button.md](button.md) | `Button`, `IconButton`, `SplitButton`, `TextButton`, `TriggerButton` | Trigger actions. Use `Button` for labeled actions, `IconButton` for icon-only, `SplitButton` for primary action + dropdown menu. |
| [input.md](input.md) | `TextInput`, `Textarea`, `AffixInput`, `QuantityInput`, `StepperInput` | Text and numeric entry, plus form-layout guidance (single column, field grouping, action placement). `TextInput` for single-line, `Textarea` for multi-line, `AffixInput` for prefix/suffix labels, `QuantityInput`/`StepperInput` for bounded numeric values with controls. |
| [search.md](search.md) | `Search`, `ScopedSearch` | Search input with typeahead suggestions. `ScopedSearch` adds a scope selector for multi-type datasets. |
| [upload-dropzone.md](upload-dropzone.md) | `Dropzone`, `FileInfoCard` | Inline file input via drag-and-drop or browse, with per-file status and preview. |

## Selection

| File | Components | Summary |
|---|---|---|
| [checkbox.md](checkbox.md) | `Checkbox`, `CheckboxGroup`, `CheckboxTree` | Multi-item boolean selection. Supports flat groups and hierarchical trees. |
| [radio.md](radio.md) | `Radio`, `RadioGroup` | Single-item selection from a set of mutually exclusive options. |
| [switch.md](switch.md) | `Switch` | Immediate binary toggle for on/off settings — no confirm step. |
| [select.md](select.md) | `TextSelect`, `TagSelect`, `SingleSelectFilter`, `MultiSelectFilter`, `SelectableTag` | Dropdown option selection. `TextSelect` for standard single/multi, `TagSelect` for chip-based multi, `SingleSelectFilter`/`MultiSelectFilter` for filter toolbars, `SelectableTag` for visible toggle chips. |
| [date-time-picker.md](date-time-picker.md) | `DatePicker`, `DateRangePicker`, `DateQuickSelectionPicker`, `TimePicker` | Calendar and time input. `DatePicker` for a single date, `DateRangePicker` for a start–end range, `DateQuickSelectionPicker` for preset + custom ranges, `TimePicker` for hour/minute selection. |
| [slider.md](slider.md) | `Slider` | Range selection by dragging a handle. Use when relative position is more intuitive than typing an exact number. |
| [color-picker.md](color-picker.md) | `ColorPicker` | Color selection via gradient, hue/alpha sliders, Hex/RGBA input, and preset swatches. |
| [segmented-control.md](segmented-control.md) | `SegmentedControl` | Compact inline toggle for view modes or filters within a toolbar. |
| [toggle-button.md](toggle-button.md) | `ToggleButtonGroup`, `ToggleButton` | Standalone persistent-setting toggle (e.g. view mode, platform) outside a toolbar. |

## Navigation

| File | Components | Summary |
|---|---|---|
| [sidebar.md](sidebar.md) | `*sidebar 3`, `*sidebar 3/submenu`, `*Sidebar3/subMenuItem` (DS3) | Pending rewrite — prior content removed as inaccurate. For navigation structure, refer to the product shells in `../Design-Patterns/`. |
| [breadcrumb.md](breadcrumb.md) | `Breadcrumb`, `BreadcrumbItem` | Header bar location trail. Ancestors are clickable links; current page is plain text. Supports editable current-page name. DS2 only. |
| [tabs.md](tabs.md) | `Tabs`, `Tab`, `TabList`, `TabPanel` | In-page navigation between content sections. |
| [pagination.md](pagination.md) | `Pagination` | Page navigation control for lists and grids. Use `PaginationTable` for table integration. |
| [link.md](link.md) | `Link` | Anchor element for in-app and external navigation. Use `Button` for actions. |
| [stepper.md](stepper.md) | `Stepper` | Multi-step progress indicator for wizard flows and sequential setup screens. |

## Overlays

| File | Components | Summary |
|---|---|---|
| [menu.md](menu.md) | `MenuItem`, `MenuIconItem` | Contextual action list triggered from a button or right-click. `MenuIconItem` extends `MenuItem` with leading/trailing icon slots. |
| [dialog.md](dialog.md) | `Dialog` | Modal overlay for confirmations, focused forms, or critical decisions. |
| [drawer.md](drawer.md) | `Drawer`, `AbsoluteDrawerContainer` | Slide-in side panel for detail editing while keeping the underlying page visible. |
| [popover.md](popover.md) | `Popover` | Floating panel anchored to a trigger for non-modal inline actions or rich content. |
| [content-assistant.md](content-assistant.md) | `ContentAssistant` | Floating collapsible panel for AI assistant features. Collapses to a trigger button; expands to a structured header/content/footer shell. DS2 only. |
| [upload-window.md](upload-window.md) | `UploadWindow` | Floating panel for tracking batch or background upload progress without blocking the page. |

## Data Display

| File | Components | Summary |
|---|---|---|
| [table.md](table.md) | `Table` | Structured data grid with sorting, pagination, and row selection. |
| [chart.md](chart.md) | `ColumnChart`, `LineChart`, `PercentageStackedAreaChart` | Analytics charts for comparing categories, trending over time, and showing proportional composition. |
| [filters.md](filters.md) | `BaseFilter`, `SingleSelectFilter`, `MultiSelectFilter`, `AddFilter` | Filter chips above a table to narrow a dataset. `SingleSelectFilter` for one value, `MultiSelectFilter` for zero-or-more with staging, `BaseFilter` for custom popover content, `AddFilter` to control chip visibility. |
| [tag.md](tag.md) | `Tag`, `SelectableTag`, `TagInput`, `TagSelect`, `AddTag` | Compact label for statuses and categories. `TagInput` for free-form multi-value entry, `TagSelect` for predefined options, `SelectableTag` for toggle chips in dropdowns, `AddTag` for inline tag addition. |
| [badge.md](badge.md) | `Badge` | Compact inline label for statuses, counts, and AI feature markers. |
| [status.md](status.md) | `Status` | Entity-state indicator — semantic-colored dot + `text-high` label, no background tint. The only status treatment (there is no tinted status badge). |
| [avatar.md](avatar.md) | `Avatar` | User or entity identity display — photo, initials, or abbreviation. |
| [card.md](card.md) | `Card`, `StackedCard` | Bounded surface for browsing and selecting items. Supports vertical/horizontal layout and selection states. For section grouping containers, see [layout-patterns.md](../Design-Patterns/layout-patterns.md). |
| [connectorcard.md](connectorcard.md) | `ConnectorCard` | DS2 platform integration tiles with a fixed layout: platform icon, title, category tags, and connection status badge. |
| [widget-card.md](widget-card.md) | `WidgetCard` | Dashboard panel card with a fixed title header, optional subtitles, action slot, and drag-to-rearrange states. |

## Feedback & Message

| File | Components | Summary |
|---|---|---|
| [tooltip.md](tooltip.md) | `Tooltip`, `IconTooltip` | Short hover hint for labels or icon-only controls. |
| [hint.md](hint.md) | `Hint` | Inline helper or error text displayed below a form field. |
| [toast.md](toast.md) | `Toast` | Transient notification for action results (success, error, info). |
| [skeleton.md](skeleton.md) | `Skeleton` | Animated loading placeholder that mirrors the shape of incoming content. |
| [loader.md](loader.md) | `Loader`, `InfiniteLoadingSpinner`, `InfiniteLoadingDots`, `LoadingTooltip` | Indeterminate loading indicators. `InfiniteLoadingSpinner` / `InfiniteLoadingDots` for spinners; `Loader` for full-page blocking states; `LoadingTooltip` for labeled inline loading states. |
| [progress.md](progress.md) | `Progress bar`, `Progress bar_budget goal` | Determinate progress bars. `Progress bar` for completion-based flows; `Progress bar_budget goal` for budget/quota contexts with a goal marker. Figma-only components. |


## Onboarding

| File | Components | Summary |
|---|---|---|
| [product-tour.md](product-tour.md) | `ProductTour` | Anchored overlay for guided feature introductions and multi-step walkthroughs. DS2 only. |
