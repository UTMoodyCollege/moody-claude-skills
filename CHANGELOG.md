# Changelog

## moody-web-editing

### 1.1.0 (2026-10-07)
- Tested end-to-end on test-moody-core.pantheonsite.io: a six-block Moody Standard Page using Basic blocks and Flex HTML. All catalog classes survived CKEditor 5 and were styled by the theme.
- SKILL.md documents what CKEditor does to pasted HTML: it strips `aria-label` on landmarks and `data-*` attributes, wraps bare links in `<p>`, and adds `data-list-item-id` and a `table` class.
- The checker now warns about attributes that CKEditor strips.
- Multi-section requests now get one code block per Layout Builder block.

### 1.0.0 (2026-10-07)
- First version. Workflow, a style-guide reference built from moody.utexas.edu/style-guide, layout recipes, a class allowlist (649 classes), and the `check_moody_html.py` validator.
