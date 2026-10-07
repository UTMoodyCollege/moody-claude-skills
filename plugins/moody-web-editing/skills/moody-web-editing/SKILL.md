---
name: moody-web-editing
description: Guided page building for the Moody College of Communication website (moody.utexas.edu, a UT Austin Drupal Layout Builder site). Plans pages using Moody's own Layout Builder blocks (Moody Hero, Showcase, Flex Grid, Promo Unit, Promo List, Featured Highlight, Flex Color Blocks, Flex Content Area, Focus Areas, Quotation, Image Link, Accordion, Contact Info), says which block, view mode and field values to use, and writes paste-ready HTML for Basic blocks using only the documented Moody/UT utility classes (ut-*, ut-surface-*, ut-btn, ut-cta-link). Use this whenever someone is building, editing, restyling or reviewing a Moody web page, section, hero, card grid, people list, quote, FAQ, callout, table or layout, asks which block to use, or mentions the Moody style guide or Layout Builder, even if they just say "make this look on-brand for our site" or paste rough copy to turn into a page.
---

# Moody Web Editing

You're helping a Moody College web editor build pages on moody.utexas.edu. Pages are assembled in Drupal **Layout Builder**: sections (one to four columns) hold blocks. Moody maintains a set of structured blocks with managed images and fixed designs, plus a **Basic block** that takes free HTML. Good output picks the right block for each piece of content. It fills structured blocks with field values, and writes clean, catalog-only HTML only where a Basic block is genuinely the best fit.

References (read when relevant):
- `references/block-chooser.md` maps each scenario to a block and view mode, with page patterns. **Read it whenever planning a page or section.**
- `references/blocks.md` covers every block's fields, view modes, image sizes, rendered output and quirks. Read it before specifying a structured block.
- `references/style-guide.md` covers classes and colors for Basic block HTML (from https://moody.utexas.edu/style-guide). Read it before writing HTML.
- `references/recipes.md` holds Basic block layout patterns.

## Why the constraints matter

- **Structured blocks first.** A Moody Hero or Flex Grid gives editors image cropping, consistent design and simple fields. HTML that imitates one is harder to maintain and drifts from the brand. Use a Basic block when no structured block fits: long copy, tables, stat rows, custom callouts.
- **Only documented classes** in Basic block HTML. The site's CSS and its AI allowlist come from the same catalog, so an invented class (`ut-card`, `rounded-lg`) silently does nothing.
- **No inline `style=""`, `<style>`, or `<script>`.** The editor strips them, and they bypass the brand system.
- **Square corners, core palette.** Burnt orange, charcoal, limestone/paper, white and black. Avoid the bright accents (Bluebonnet, Turquoise, Turtlepond), even where an old option still offers them.
- **Fragments, not pages.** The page title is already the `<h1>`, so content headings start at `<h2>`.

## Workflow

### 1. Get the context (briefly)

If the request is clear, go straight to planning. Otherwise ask only what changes the plan, in one short message:
- What the content is and who it's for: page type, audience, goal
- Whether they have photos, and of what (heroes, showcases and grids need images)
- Links and calls to action

Use sensible defaults for anything not given and say what you assumed.

### 2. Plan the page: sections and blocks

Using `block-chooser.md`, map each piece of content to a section layout, a block and a view mode. Keep one hero per page, give each section a real heading, and avoid long runs of the same block. Present the plan as a short ordered list before the details when the page has more than two or three blocks.

### 3. Specify each block

**Structured blocks:** give a block spec the editor can follow field by field, using the field names from `blocks.md`:

```
Block 2 · Moody Flex Grid · view mode: Circular Style · section: one column, container width
- Title: "Leadership" (Display title: on)
- Items per row: Four
- Item 1: Image: headshot (square, 500×500) · Item Headline: "Jane Doe" · Copy: "Dean" · URL: /about/leadership/jane-doe
- …
```

Include image guidance (subject, ratio, minimum size) and alt text for every image. Mark anything the editor must supply, such as `[photo needed]`.

**Basic blocks:** write the HTML following `style-guide.md`:
- Plain elements first. h2–h6, p, lists, blockquote and table already look on-brand.
- Responsive and mobile-first: `ut-cols-1 md:ut-cols-2 lg:ut-cols-3`. Breakpoints are sm 576px, md 768px, lg 992px and xl 1200px.
- For colored panels, use `ut-surface-{white,paper,charcoal,orange}`, since they set an approved text/background pair.
- Links: write descriptive link text. Use `ut-cta-link` for CTAs and `ut-btn` for button-styled links.
- Images need meaningful `alt`. Tables use `class="tablesaw tablesaw-stack"` with `<th scope="col">`.

What the editor (CKEditor 5, Flex HTML) does to your HTML. Tested 2026-10-07; every catalog class survives:
- **Stripped:** `aria-label` on landmarks, and `data-*` attributes. Use visible headings instead.
- **Wrapped:** a bare `<a>` inside `<div>`/`<article>` becomes `<p><a>`. Write the `<p>` yourself.
- **Added:** `data-list-item-id` on `<li>`, and a `table` class. Both are harmless.
- **Kept:** `id` attributes, so in-page anchors like `#schedule` work.

### 4. Validate Basic block HTML

```bash
python3 <skill-dir>/scripts/check_moody_html.py path/to/fragment.html
```

It flags unknown classes, inline styles, stripped attributes, rounded corners, skipped headings, missing alt text and vague link text. Fix what it reports, or explain why a warning is fine.

### 5. Deliver

1. The page plan, as an ordered list of blocks with their view modes.
2. One spec or one ```html block per Layout Builder block, in page order.
3. A few bullets covering assumptions, placeholders to replace (links, photos), and anything to preview because it's new or untested on live pages.

## Reviewing existing pages or HTML

Run the checker on any HTML, then rewrite it: replace inline styles and unknown classes with catalog equivalents, and fix heading order and alt text. When a Basic block is hand-building something a structured block does (a card grid, hero or FAQ), suggest the block and view mode that should replace it.

## Extending this skill

Add new background material as files under `references/`, with a one-line pointer in the reference list above, so this file stays short.
