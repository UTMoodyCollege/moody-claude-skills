---
name: moody-web-editing
description: Guided HTML authoring for the Moody College of Communication website (moody.utexas.edu, a UT Austin Drupal site). Produces paste-ready HTML fragments for Drupal/CKEditor body fields using only the documented Moody/UT utility classes (ut-*, text-ut-*, bg-ut-*, ut-surface-*, ut-btn, ut-cta-link), brand colors and accessible markup. Use this whenever someone is writing, editing, restyling or reviewing web content, HTML, a page section, card grid, callout, table, button or layout for Moody, Moody College, UT Austin communication school pages, or mentions the Moody style guide — even if they just say "make this look on-brand for our site" or paste rough copy to turn into a web page section.
---

# Moody Web Editing

You're helping a Moody College web editor turn content into HTML that drops straight into a Drupal body field on moody.utexas.edu and looks right without any extra CSS. The site's theme already styles plain HTML elements and ships a fixed catalog of utility classes; good output leans on those and nothing else.

Source of truth: https://moody.utexas.edu/style-guide. Details are in `references/style-guide.md` (read it before writing HTML) and `references/recipes.md` (read it when building layouts).

## Why the constraints matter

- **Only documented classes.** The site's CSS and its AI allowlist are generated from the same catalog. An invented class (`ut-card`, `ut-text-orange`, Tailwind's `rounded-lg`) silently does nothing, so the editor sees broken layout and doesn't know why.
- **No inline `style=""`, `<style>`, or `<script>`.** CKEditor's text filters typically strip them, and they bypass the brand system. If something truly can't be done with the catalog, say so and suggest the Hero Builder / Card Builder blocks or asking the web team.
- **Square corners, current palette.** The brand retired the teal/bright palette and rounded-corner options; don't generate them.
- **Fragments, not pages.** Editors paste into a body field that is already inside the page, so no `<html>`, `<head>`, `<body>`, site header or footer. The page title is already the `<h1>`, so content headings start at `<h2>`.

## Workflow

### 1. Get the context (briefly)

If the request is clear, go straight to drafting. Otherwise ask only what changes the HTML, in one short message:
- What the content is and who it's for (news blurb, program overview, event, faculty list, resource links…)
- Where it goes: a normal body field (default), or something the editor wants to look like a hero, card grid, callout
- Any links, images (with alt text), or CTAs they need

Use sensible defaults for anything not given and mention them, rather than stalling.

### 2. Pick structure before styling

Decide semantics first: headings in order (h2 → h3 → h4, no skipping), real lists for lists, `<table>` only for tabular data, `<a>` for navigation and `<button>` only for actions. Then add layout utilities from the catalog. Prefer grid/flex utilities for layout over positioning; positioning can overlap text at browser zoom.

### 3. Write the HTML

Follow `references/style-guide.md`. Key habits:
- Plain elements first — h2–h6, p, ul/ol, blockquote, table already look on-brand. Add classes only for layout, emphasis, or color.
- Responsive: mobile-first base class, then `sm:` (576px) `md:` (768px) `lg:` (992px) `xl:` (1200px) overrides, e.g. `ut-cols-1 md:ut-cols-2 lg:ut-cols-3`.
- Color: use `ut-surface-{white,paper,charcoal,orange}` for blocks with backgrounds, since they set an approved text/background pair together. Use `text-ut-*` / `bg-ut-*` only in approved contrasting combinations (see the style guide reference).
- Links: descriptive text ("View the B.S. in Journalism requirements", not "click here"). Use `ut-cta-link` for a call-to-action link, `ut-btn` for a button-styled link. External links get `ut-cta-link--external` when styled as a CTA.
- Images: meaningful `alt`, or `alt=""` if purely decorative. Wrap with `<figure>`/`<figcaption>` when there's a caption.
- Tables: `class="tablesaw tablesaw-stack"` with `<thead>`, `<th scope="col">` so they stack on mobile.

### What the editor does to your HTML

Tested 2026-10-07 on the Moody test site, using a Layout Builder **Basic block** with the **Flex HTML** text format. Every catalog class survived CKEditor 5, and the theme's CSS styled them all. CKEditor still rewrites some markup, so write with that in mind:
- **Stripped:** `aria-label` on `<aside>`/`<section>`, and `data-*` attributes such as `data-tablesaw-minimap`. Put a visible heading inside landmark elements rather than relying on `aria-label`.
- **Wrapped:** a bare `<a>` directly inside `<article>`/`<div>` becomes `<p><a>…</a></p>`. That's harmless, but writing the `<p>` yourself keeps the source predictable.
- **Added:** `data-list-item-id` on `<li>`, and a `table` class on tables. Both are expected.
- `id` attributes survive, so in-page anchors like `href="#schedule"` work.

### 4. Validate

Save the fragment to a file and run:

```bash
python3 <skill-dir>/scripts/check_moody_html.py path/to/fragment.html
```

It flags unknown classes, inline styles/scripts, rounded corners, skipped heading levels, missing alt text, and vague link text. Fix what it reports (or explain why a warning is fine) before handing back.

### 5. Deliver

Give the editor:
1. The HTML in a single ```html code block, ready to paste into CKEditor's **Source** view. If the request is for several sections of a page, give one code block per section, since each becomes its own Basic block in Layout Builder and editors can reorder them.
2. A few bullets on what you chose and any defaults you assumed (e.g. "used placeholder link `#` for the RSVP — replace with the real URL").
3. If part of the request needs something beyond body-field HTML (video backgrounds, image overlays, managed buttons), point them to Hero Builder / Card Builder instead of faking it.

## Reviewing existing HTML

When asked to review or clean up existing markup, run the checker on it, then rewrite: swap inline styles and unknown classes for catalog equivalents, fix heading order and alt text, and summarize the changes in a short list.

## Extending this skill

This skill is meant to grow. Additional context (editorial voice and tone, AP/UT style rules, Hero/Card Builder field guidance, department-specific patterns) goes in new files under `references/` with a one-line pointer added to this section, so the core workflow stays short.
