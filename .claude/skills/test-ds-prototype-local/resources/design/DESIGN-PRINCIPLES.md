# Design Principles

**Last updated:** 2026-06-18

The lens for all usage guidance, do's/don'ts, and pattern recommendations. Two complementary groups:

- **Experiential principles** shape how a single component is *used*.
- **Visual design principles** shape how multiple elements are *arranged* — layout patterns, form structure, header composition, section grouping.

Apply both silently as judgment calls. **Never cite a principle by name in guideline output** — the guidance should read as product-team common sense, not a principle list.

> Experiential group inspired by [Apple Human Interface Guidelines — Design Principles](https://developer.apple.com/design/human-interface-guidelines/design-principles) (reintroduced by Apple: June 8, 2026).
> Visual group inspired by [Nielsen Norman Group — Principles of Visual Design](https://www.nngroup.com/articles/principles-visual-design/).

---

## Experiential Principles

### Purpose — Make something meaningful

Design starts with intention. Identify what matters most to the people you're designing for. Focus on making those things great, and you'll create an experience that people truly value.

### Agency — Let people do things their own way

An interface exists to help people accomplish their goals. Give them the freedom to act, keep them informed about what's happening, and make it easy to recover from mistakes.

### Responsibility — Act in people's best interest

Your work has an impact on people's lives. Earn their trust by prioritizing safety and privacy, and being transparent about what your product does and why.

### Familiarity — Build on what people know

Drawing on concepts people already understand helps them feel immediately at home. Ground your experience in established physical and digital patterns and apply them consistently throughout your design.

### Flexibility — Adapt to diverse contexts and needs

People use your software in ways as unique as they are. Be mindful of experiences other than yours, and try to support as many devices, types of interaction, and perspectives as possible.

### Simplicity — Be clear and direct

A well-designed experience removes the unnecessary, with every element earning its place. When your interface is logically organized and straightforward to navigate, it's easier to get things done.

### Craft — Care about every detail

Your design is a reflection of how much you care. It shows your dedication to delivering the best possible experience for people. Take the time to do the work well.

### Delight — Make it human

People remember how a product makes them feel. Think about the emotions that are right for your experience, and aim to deliver them in a way that's satisfying, enriching, and a joy to use.

---

## Visual Design Principles

Reach for these when arranging more than one element on a surface — layout patterns, forms, headers, section grouping.

### Scale — Size signals rank

Relative size tells users what matters most. Make the most important element the largest, and step everything else down from there — e.g. a section title (20px / SemiBold) outranks a field label (14px / SemiBold), which outranks hint text (12px). When two elements compete at the same size, the hierarchy reads as flat and users don't know where to start.

### Visual Hierarchy — Guide the eye in order of importance

Arrange elements so attention lands in the intended sequence: primary, then secondary, then tertiary. Within one action region, keep a single primary emphasis and downgrade the rest — e.g. a header bar with two primary buttons gives the eye no starting point.

### Balance — Distribute visual weight

Spread weight evenly across the surface, symmetrically or not — e.g. right-align a header's action group with a consistent gap so the row reads as one cluster, and keep forms in a single column so the eye returns to a predictable left edge. A lone control floating off the established axis breaks the rhythm.

### Contrast — Make different things look different

When two elements differ in function or state, make them differ visually — and not by a faint cue alone. A focus ring, an error red, or a selected fill should be unmistakable, and stacked sections are better separated by a surface or border token than by a shadow so subtle it reads as one block. Contrast is the one principle that also governs a single component's states, not just layout.

### Gestalt — Proximity and grouping form meaning

Users read elements that sit close together as one group. Keep related items closer to each other than to the next group — e.g. a label tight to its field, or a shared surface (a section container or tinted sub-section) bounding a logical group rather than relying on whitespace alone. Equal spacing between everything erases the grouping the structure is trying to convey.
