# Changelog

## moody-web-editing

### 1.3.0 (2026-10-07)
- `references/blocks.md` adds the next six most-used blocks:
  - **Moody Quotation:** all 5 styles, plus the Split options for palette, size, alignment and image side
  - **Utexas Flex Content Area**
  - **Utexas Promo List:** all 4 view modes
  - **Utexas Image Link**
  - **Moody Focus Areas:** items per row and spacing
  - **Call to Action:** flagged as legacy
- Each new block section covers its fields, image specs, rendered markup, live usage and when to use it.
- `block-chooser.md` gains scenario rows for quotes, video and link-list features, compact people and partner lists, program facts with icons, clickable images and standalone buttons. The program, people and event page patterns now use these blocks.
- New rules of thumb: Image Link alt text must describe the destination, and the Promo List headline needs a *Display title* to get a real `<h2>`.
- The skill description now names all 13 supported blocks, so it triggers on more requests.

### 1.2.0 (2026-10-07)
- New `references/blocks.md` documents the 9 most-used Layout Builder blocks: Basic, Moody Hero, Flex Grid, Showcase, Promo Unit, Featured Highlight, Flex Color Blocks, Accordion and Contact Info. It covers their fields, every view mode, image specs, rendered markup and live usage counts, plus section layout options.
- New `references/block-chooser.md` maps scenarios to blocks, with page patterns and rules of thumb.
- The SKILL.md workflow now plans pages around structured blocks first and gives field-by-field block specs. HTML is written only for Basic blocks.

### 1.1.0 (2026-10-07)
- Tested end-to-end on test-moody-core.pantheonsite.io: a six-block Moody Standard Page using Basic blocks and Flex HTML. All catalog classes survived CKEditor 5 and were styled by the theme.
- SKILL.md documents what CKEditor does to pasted HTML: it strips `aria-label` on landmarks and `data-*` attributes, wraps bare links in `<p>`, and adds `data-list-item-id` and a `table` class.
- The checker now warns about attributes that CKEditor strips.
- Multi-section requests now get one code block per Layout Builder block.

### 1.0.0 (2026-10-07)
- First version. Workflow, a style-guide reference built from moody.utexas.edu/style-guide, layout recipes, a class allowlist (649 classes), and the `check_moody_html.py` validator.
