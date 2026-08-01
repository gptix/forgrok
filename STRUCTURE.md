# forgrok Repository Structure

This document describes the current high-level organization of the knowledge base.

## Top-level layout

forgrok/
├── 00-inbox/                  # Temporary staging only (keep empty)
├── 01-core/                   # Stable, high-value knowledge
│   ├── memory/                # Master memory, Voight-Kampff, protocols
│   ├── principles/            # Enduring schemas and operating principles
│   ├── soul/                  # Agent identity (Withnail, etc.)
│   └── zho/                   # Zero-Human Organization doctrine & nodes
├── 02-infrastructure/         # How the machines and agents run
│   ├── hermes-pi/             # Pi 5 / Hermes / Ollama / Telegram / systemd
│   │   ├── baselines/
│   │   ├── inventory/
│   │   ├── procedures/
│   │   └── scripts/
│   ├── hardware/              # Hardware inventories
│   └── tools/                 # Supporting tools (e.g. Infranodus process)
├── 03-projects/               # Active or significant projects
│   ├── withnail/              # Current CEO/COO agent work
│   ├── tarot-app/             # Tarot card recognition + reading app (vision + interpretation)
│   └── ...
├── 04-sources/                # Curated external high-protein content
│   ├── roemmele/              # Brian Roemmele / 5000 Days material
│   ├── wilhelm/               # Scalar / longitudinal wave material
│   └── hpc/                   # Other high-protein sources
├── 05-wiki/                   # Wikified / interlinked knowledge
│   ├── concepts/
│   ├── graphs/                # Including Infranodus exports
│   ├── indexes/
│   └── topics/
├── 06-raw/                    # Unprocessed or semi-processed material
├── 07-sessions/               # Selected conversation / session exports
└── 99-archive/                # Old, superseded, or low-value material



## Design principles

- **Clear separation of concerns** — identity & doctrine, infrastructure, projects, sources, and wiki are distinct.
- **Inbox is temporary** — nothing should live long in `00-inbox/`.
- **Procedures and scripts live with the machine they belong to**.
- **High-protein external content** has its own top-level home under `04-sources/`.
- **Archive is explicit** — we move material out of the active path rather than deleting history.
- Numbered prefixes make ordering and navigation easier.
- Compatible with org-roam (nodes live under the appropriate branch).

## Notes

- Secrets and large binary backups must never be committed.
- Prefer small, focused commits when moving material.
- Update this file when the top-level structure changes.
- 04-sources/roemmele/ now uses a clean mechanical-first ingest loop (HTML → md + images → Grok org node). Skeleton .org generation was removed 2026-07-31.
