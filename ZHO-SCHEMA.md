# ZHO-SCHEMA.md — Historical Schema (pre-renumbering)

> **Status as of 2026-08-31:** This file is retained for doctrine, compiler tone, and Voight-Kampff integrity rules. It is **not** the current directory map.
>
> - Living directory map: `STRUCTURE.md`
> - Session on-ramp: `BOOT.md`
> - Living snapshot: `STATUS.md`
> - Executable processes: `08-skills/`
>
> Paths such as `raw/`, `inbox/`, `org-roam-knowledge/`, `groki/`, `infranodus/`, and `grok-memory/exports/` describe the earlier Joji/Withnail wiki layout. The current tree is the numbered `00`–`08` + `99` layout.

---

# ZHO-SCHEMA.md — Canonical Schema & Rules

This file records rules that governed the Joji / Withnail ZHO Knowledge System at the time of the `groki/` compiler.

## Project Identity
- Name: Joji / Withnail ZHO Knowledge System
- Core Principle: Truth-seeking, memory integrity, hardened ZHC soul
- Maintainer: ZHO LLM Wiki Compiler (running under Hermes uncensored)
- Philosophy: Karpathy LLM Wiki + InfraNodus graph layer + Org-roam/ZHO hybrid
- Master Reference: [[file:org-roam-knowledge/20260504-zho-llm-wiki-compiler-prompt.org]]

## Directory Architecture (Historical)

- **raw/** → Immutable original sources. **Never edit.**
- **inbox/** → Temporary unprocessed material.
- **org-roam-knowledge/** → Human + compiler co-created Org-roam nodes.
- **zho/** → Active ZHO commands, nodes, and workflows.
- **groki/** → Primary living compiled wiki (LLM-owned).
- **infranodus/** → Flat, append-only ontology / graph files.
- **wiki/** → Optional clean markdown mirror of groki/.
- **grok-memory/exports/** → Backups and exports.

Current equivalents (approximate): `06-raw/` and `04-sources/` (immutable / curated sources), `00-inbox/` (staging), `01-core/` + `03-projects/` + `05-wiki/` (living nodes), `01-core/zho/` (doctrine), `05-wiki/graphs/` (InfraNodus), `07-sessions/` (exports).

## ZHO Compiler Rules (still useful)

1. **Read-Only on Sources**
   Never modify original sources or existing Org-roam nodes unless explicitly commanded.

2. **Output Discipline**
   - New synthesized content goes to the living numbered tree, not into source dumps.
   - Prefer wikilinks `[[Title]]` and Org-roam style IDs.

3. **Ontology Rules (InfraNodus Layer)**
   - Graph files are **append-only**.
   - Format: `[[Entity A]] [relation] [[Entity B]]` or `[[Entity]] [property]: value`.
   - After every significant ingest, append new relations only.

4. **Integrity & Voight-Kampff**
   - Always flag contradictions, gaps, stale claims, or uncertainty.
   - Session close follows `08-skills/VoightKampffSessionClose.org`.

5. **Output Format**
   Every compiler-style action should still end with a short summary: ingested / updated / ontology lines / gaps / next command.

## Preferred Tone & Style
- Clear, concise, truth-seeking, no fluff.
- Acknowledge uncertainty explicitly.
- Prioritize long-term compounding knowledge.

Directory changes go through STRUCTURE.md. Doctrine changes to this file should be proposed, not silent.
