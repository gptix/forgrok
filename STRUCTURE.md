# forgrok Repository Structure

This document is the authoritative map of the knowledge base on disk.

Companion files:

- `BOOT.md` — session-start on-ramp for Grok
- `STATUS.md` — living operational snapshot
- `README.md` — short public orientation
- `08-skills/` — executable processes

Historical schemas that describe the *pre-renumbering* layout (`raw/`, `groki/`, `org-roam-knowledge/`) live at `ZHO-SCHEMA.md` and `01-core/principles/GROK-SCHEMA.md`. They are not the directory map.

**Last aligned:** 2026-08-31 (GitHub `main` exact-path survey)

## Top-level layout

```
forgrok/
├── 00-inbox/                  # Temporary staging only (keep empty)
├── 00-meta/                   # Startup / naming conventions (STARTUP.org)
├── 01-core/                   # Stable, high-value knowledge
│   ├── memory/                # Master memory, Voight-Kampff protocol
│   ├── principles/            # Enduring schemas (NODE-NAME, workflows, historical GROK-SCHEMA)
│   └── zho/                   # Zero-Human Organization doctrine and pillar nodes
├── 02-infrastructure/         # How the machines and agents run
│   ├── emacs/                 # forgrok-org-helpers.el and Emacs automation
│   ├── hardware/              # Hardware inventories
│   ├── hermes-pi/             # Pi 5 / Hermes / Ollama / Telegram / systemd
│   ├── procedures/            # Cross-machine procedures
│   └── tools/                 # Supporting tools (file transfer, Infranodus, etc.)
├── 03-knowledge/              # Non-project knowledge slices (currently transcripts/)
├── 03-projects/               # Active or significant projects
├── 04-sources/                # Curated external high-protein content
│   ├── free-ai-curriculum/    # ShikamaruTsai free AI/ML course index
│   ├── koerner-office/        # Koerner Office AI audit / agency material
│   ├── roemmele/              # Brian Roemmele / 5000 Days material
│   ├── savewisdom/            # Save-Your-Wisdom source material
│   └── wilhelm/               # Scalar / longitudinal wave material
├── 05-wiki/                   # Wikified / interlinked knowledge
│   ├── concepts/
│   ├── graphs/                # Including Infranodus exports
│   └── indexes/
├── 06-raw/                    # Unprocessed or semi-processed material
├── 07-sessions/               # Selected conversation / session exports
│   ├── grok-workflow/
│   ├── session-summaries/
│   └── vk/                    # Voight-Kampff summary nodes
├── 08-skills/                 # Reusable skill nodes (how-to processes)
└── 99-archive/                # Old, superseded, or low-value material
```

`01-core/soul/` is named in older BOOT/STRUCTURE text as the home for agent identity. It is **not present** on GitHub `main` as of 2026-08-31. Withnail/SOUL material currently lives under `03-projects/withnail/` and on hermes-pi. Do not claim `01-core/soul/` exists until the directory is created and pushed.

## Projects under `03-projects/` (as of 2026-08-31)

Active or significant:

- `ai-agent-consulting` — private local-first agents for Atlanta professional services
- `emacs-obsidian-skin` — Org-first Emacs skin approximating Obsidian UX
- `gov-contracting` — low-touch government-contracting model
- `save-your-wisdom-nonprofit`
- `skill-system-improvement`
- `tarot-today` — Tarot recognition + reading app (canonical project dir)
- `TsuiokuPresentation`
- `withnail`

Also present on `main` (keep or park explicitly; do not pretend they are gone):

- `ai-services`, `arrest-demographics`, `local-ai-agents`, `rental`, `sources`, `test-grok-build`

## Design principles

- **Clear separation of concerns** — identity & doctrine, infrastructure, projects, sources, wiki, sessions, and skills are distinct.
- **Inbox is temporary** — nothing should live long in `00-inbox/`.
- **Repo root is for orientation only** — BOOT, STATUS, STRUCTURE, README. Scratch files do not belong here.
- **Procedures and scripts live with the machine they belong to**, with shared Emacs helpers under `02-infrastructure/emacs/`.
- **High-protein external content** has its own top-level home under `04-sources/`.
- **Archive is explicit** — move material out of the active path rather than deleting history.
- Numbered prefixes make ordering and navigation easier.
- Compatible with org-roam (nodes live under the appropriate branch).
- **Org-roam NODE-NAME convention**: PascalCase with no spaces, hyphens, or underscores (`#+NODE-NAME: OrgRoamNodeNameConvention`). Canonical definition: `01-core/principles/org-roam-node-name-convention.org`.
- **Skills are first-class** — concrete, repeatable processes live under `08-skills/` as org-roam nodes.
- **STRUCTURE.md wins directory disputes.** If STARTUP.org, ZHO-SCHEMA.md, or GROK-SCHEMA.md disagree about folder names, this file is correct until it is deliberately changed.

## Notes

- Secrets and large binary backups must never be committed.
- Prefer small, focused commits when moving material.
- Update this file when the top-level structure changes.
- Inspect GitHub with `08-skills/InspectGitHubState.org` (exact-path fetch). Do not treat a summarized tree page as a complete inventory.
- `04-sources/roemmele/` uses a mechanical-first ingest loop (HTML → md + images → Grok org node). Skeleton `.org` generation was removed 2026-07-31.
- `03-knowledge/` is a real top-level directory (transcripts). Future cleanup may fold it into `07-sessions/`; until then it is documented, not invisible.
