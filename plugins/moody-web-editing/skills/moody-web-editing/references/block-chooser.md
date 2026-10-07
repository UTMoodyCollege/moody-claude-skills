# Choosing Blocks

Pick the block by **what the content is**, not by how you'd like it to look. Structured blocks give editors managed images and a consistent site-wide design. Basic blocks give you freedom. Field and view-mode details are in `blocks.md`.

## Scenario → block

| The content is… | Use | View mode / setup |
|---|---|---|
| The opening of a landing, center or top-level page | Moody Hero | `moody_hero_8` (text bottom-left), or `_7` to place text elsewhere. Charcoal overlay with white text on busy photos |
| A program, minor or degree page opener with a one-line pitch | Moody Hero | `moody_hero_1` (orange panel) |
| A big photo where the credit or caption matters | Moody Hero | `default` |
| Alternating image + story rows | Moody Showcase | `default_33_66_display` when the copy leads, `moody_showcase_style_two` when the image leads, `default` for balance |
| A persuasive recruiting sequence ("Why Moody", "How to apply") | Moody Showcase | `moody_showcase_style_three` (Marketing), 3 or more rows |
| People: leadership, staff, faculty, coaches | Moody Flex Grid | `flex_grid_circular_style`, 3–4 per row. Name in Item Headline, title in Copy |
| Cards with a photo, blurb and button | Moody Flex Grid | `flex_grid_card_style`, 3 per row |
| Visual navigation to sub-pages or programs | Moody Flex Grid | `flex_grid_promo_style`, 3–4 per row |
| Teasers that reveal more on hover | Moody Flex Grid | `flex_grid_flip_style` (new, untested on live pages, so preview it) |
| A resource or program list with thumbnails and blurbs | Utexas Promo Unit | `default` (landscape thumbnail), or `_4` stacked inside a 2–3 column section |
| Award winners or people with a bio line and portrait | Utexas Promo Unit | `utexas_promo_unit_2` (portrait) or `_3` (square) |
| One spotlighted resource, report or program, as a full-width band | Utexas Featured Highlight | `default` (Limestone) or `_3` (Charcoal) |
| 2–4 big "go here" tiles, or an end-of-page CTA band | Moody Flex Color Blocks | One item per block, one block per column of a 2–4 column section. Alternate gray and orange |
| FAQs, policies, requirements, long reference lists | Moody Accordion | `default`, or `condensed` for dense lists. Turn on *Display title* |
| Office location, hours, phone, appointment link | Moody Contact Info | — |
| Long-form copy, tables, stat rows, callouts, custom layout | Basic block | HTML from this skill |

## Page patterns that work

- **Landing page:**
  1. Hero 8
  2. Basic intro (`ut-measure-standard`)
  3. Flex Grid promo (sub-pages)
  4. Showcase rows
  5. Flex Color Blocks CTA row
- **Program page:**
  1. Hero 1
  2. Basic overview
  3. Showcase 33/66 (highlights)
  4. Accordion (requirements / FAQ)
  5. Contact Info
- **People page:**
  1. Hero 6 short
  2. Basic intro
  3. A Flex Grid circular for each group, with *Display title* as the group heading
- **Event or marketing page:**
  1. Hero 8 (date and CTA in subheading and CTA)
  2. Basic stats row
  3. Showcase Marketing
  4. Basic schedule table
  5. Flex Color Blocks or Featured Highlight for registration

## Rules of thumb

- **One hero per page,** at the very top.
- **Headings:** give each section a real heading. Turn on the block's *Display title* (it renders as `<h2>`) when the block's own headline field isn't a heading: Flex Grid headline, Accordion, and hero styles 1–6.
- **Repetition:** don't repeat the same block type more than about 3 times in a row. Alternate with a Basic block or change the section background.
- **Basic block:** reach for it when no structured block fits the content. Don't use it to rebuild a structured block by hand.
- **Prove-out:** for brand-new styles with no live usage (flip, Promo Unit 5/6), tell the editor to preview before publishing.
