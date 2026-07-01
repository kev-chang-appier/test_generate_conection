# Design Patterns

Reusable shell templates and layout patterns for product mockups. Every mockup **must** start from the matching product shell — never build a page from scratch.

## Shell Templates

| Product | Template | Use for |
|---------|----------|---------|
| AIQUA / AQ | [aiqua-shell.html](aiqua-shell.html) | All AIQUA pages — campaigns, analytics, segments, settings, etc. |
| BotBonnie / BB | [botbonnie-shell.html](botbonnie-shell.html) | All BotBonnie pages |

## Creating an AIQUA Mockup

1. **Copy `aiqua-shell.html`** as your starting file — it contains the full shell: TopBar, Icon Rail, Secondary Nav, Page Header, and Content Area.
2. **Set the active Icon Rail item** — find the `.rail-item` matching your section and add the `active` class; remove `active` from the default (Campaign).
3. **Update the Secondary Nav items** — replace the `<div class="nav-items">` children to match your page's sub-navigation. Mark the current page's nav item with the `active` class.
4. **Update the Page Header breadcrumb** — set `.crumb-parent` to the section name, `.crumb-current` to the page name.
5. **Build your page content** inside `<div class="content-area">` — follow the composition rules in [layout-patterns.md](layout-patterns.md).

### Adding a New Sidebar Item

The sidebar has two layers: the **Icon Rail** (left, 56px icons) and the **Secondary Nav** (right, 240px sub-items) — 296px total, matching DESIGN-DS3 → Layout.

#### Icon Rail (primary sections)

Existing rail items: AI Agent, Analytics, **Campaign** (default active), Automation, Segment, Recommendation, My Template, Settings.

To add a new Icon Rail item, insert a `<div class="rail-item">` inside `<aside class="icon-rail">` at the desired position:

```html
<div class="rail-item" data-key="new-section" title="New Section">
  <svg width="24" height="24" viewBox="0 0 20 20" fill="none">
    <!-- DS3 icon path -->
  </svg>
</div>
```

Then register its sub-navigation in the `navData` object inside `<script>`:

```js
navData['new-section'] = {
  title: 'New Section',
  items: [
    { label: 'Sub Page A', active: true },
    { label: 'Sub Page B' },
    { label: 'Sub Page C', badge: 'New' },
  ]
};
```

#### Secondary Nav (sub-pages)

To add a sub-page under an **existing** rail item, add a `<div class="nav-item">` inside `<div class="nav-items">` and update the corresponding `navData` entry:

```html
<div class="nav-item" data-sub="new-sub">
  <span class="icon"><svg width="24" height="24" viewBox="0 0 20 20" fill="none">
    <!-- DS3 icon path -->
  </svg></span>
  <span class="label">New Sub Page</span>
</div>
```

Optional: append a badge for Beta / New labels:

```html
<span class="badge">Beta</span>
```

### Sidebar Item Reference

Current nav structure in `aiqua-shell.html`:

| Icon Rail | `data-key` | Secondary Nav Items |
|-----------|------------|---------------------|
| AI Agent | `agent` | *(no secondary nav)* |
| Analytics | `analytics` | Dashboard |
| Campaign | `campaign` | Message campaign, In-web campaign, In-app campaign, Onsite experience (Beta) |
| Automation | `journeymap` | *(no secondary nav)* |
| Segment | `segment` | *(no secondary nav)* |
| Recommendation | `recommendation` | *(no secondary nav)* |
| My Template | `mytemplate` | *(no secondary nav)* |
| Settings | `settings` | *(no secondary nav)* |

## Layout Patterns

See [layout-patterns.md](layout-patterns.md) for section containers, form layout, spacing decisions, and content hierarchy rules.
