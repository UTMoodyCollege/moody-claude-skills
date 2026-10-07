# Moody Claude Skills

Claude skills for people who edit the [Moody College of Communication](https://moody.utexas.edu) website.

| Skill | What it does |
|---|---|
| [`moody-web-editing`](plugins/moody-web-editing/skills/moody-web-editing/SKILL.md) | Plans moody.utexas.edu pages with the right Layout Builder block for each section (Moody Hero, Showcase, Flex Grid, Promo Unit, Featured Highlight, Flex Color Blocks, Accordion, Contact Info), gives field-by-field instructions for each block, and writes Basic block HTML that's ready to paste in, using only classes from the [Moody style guide](https://moody.utexas.edu/style-guide). |

## Install

### Claude Code (recommended, gets updates)

```
/plugin marketplace add UTMoodyCollege/moody-claude-skills
/plugin install moody-web-editing@moody-claude-skills
```

To pick up new versions, run `/plugin marketplace update moody-claude-skills`.

### Claude.ai / Claude desktop

Download `moody-web-editing.skill` from the [latest release](https://github.com/UTMoodyCollege/moody-claude-skills/releases/latest) and upload it under **Settings → Capabilities → Skills**. You can also build the file yourself:

```bash
./scripts/package.sh   # writes dist/moody-web-editing.skill
```

## Using it

Just ask in plain language. For example:

- "Turn this program blurb into a three-card section for the Moody site"
- "Make an on-brand callout for the spring application deadline"
- "Clean up this HTML I pasted from an old page so it uses the Moody classes"
- "Plan a landing page for our new center. Which blocks should I use?"
- "We need a people page for 12 staff with headshots"

Claude asks a quick question if anything is unclear. It writes one HTML snippet per page section, checks it, and tells you about any placeholder links or images to swap out. To use a snippet, add a **Basic block** in Layout Builder, switch the editor to **Source**, and paste.

See [`examples/signal-2026-event-page`](examples/signal-2026-event-page) for a six-section page made with the skill. It was tested on the Moody test site.

## Repo layout

```
.claude-plugin/marketplace.json        # plugin marketplace index
plugins/<plugin>/.claude-plugin/plugin.json   # plugin metadata and version
plugins/<plugin>/skills/<skill>/SKILL.md      # the skill itself
plugins/<plugin>/skills/<skill>/references/   # detail loaded only when needed
plugins/<plugin>/skills/<skill>/scripts/      # helper scripts (e.g. HTML checker)
examples/                              # real outputs, useful for review
scripts/package.sh                     # builds .skill files for claude.ai
```

## Contributing

1. Edit the skill. Put new background material in `references/` and add a pointer to it in `SKILL.md`, so `SKILL.md` stays short.
2. If the [style guide](https://moody.utexas.edu/style-guide) changes, update `references/style-guide.md` and regenerate `scripts/allowed_classes.json`.
3. Raise the `version` in `plugin.json` and add an entry to [CHANGELOG.md](CHANGELOG.md).
4. Tag the release (`git tag v1.2.0`) and attach the `dist/*.skill` file.
