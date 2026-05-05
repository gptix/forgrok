# ZHO-SCHEMA.md — Canonical Schema & Rules

This is the single source of truth for all rules governing the Joji / Withnail ZHO Knowledge System.

## Project Identity
- Name: Joji / Withnail ZHO Knowledge System
- Core Principle: Truth-seeking, memory integrity, hardened ZHC soul
- Maintainer: ZHO LLM Wiki Compiler (running under Hermes uncensored)
- Philosophy: Karpathy LLM Wiki + InfraNodus graph layer + Org-roam/ZHO hybrid
- Master Reference: [[file:org-roam-knowledge/20260504-zho-llm-wiki-compiler-prompt.org]]

## Directory Architecture (Strict)

- **raw/** → Immutable original sources. **Never edit.**
- **inbox/** → Temporary unprocessed material.
- **org-roam-knowledge/** → Human + compiler co-created Org-roam nodes.
- **zho/** → Active ZHO commands, nodes, and workflows.
- **groki/** → Primary living compiled wiki (LLM-owned).
- **infranodus/** → Flat, append-only ontology / graph files.
- **wiki/** → Optional clean markdown mirror of groki/.
- **grok-memory/exports/** → Backups and exports.

## ZHO Compiler Rules (Mandatory)

1. **Read-Only on Sources**  
   Never modify anything in `raw/`, `inbox/`, or existing Org-roam nodes unless explicitly commanded.

2. **Output Discipline**  
   - All new synthesized content goes to `groki/` or `infranodus/`.
   - Use consistent `YYYYMMDD-` prefixes for chronological files.
   - Prefer wikilinks `[[Title]]` and Org-roam style IDs.

3. **Ontology Rules (InfraNodus Layer)**
   - All graph files are **append-only**.
   - Format: `[[Entity A]] [relation] [[Entity B]]` or `[[Entity]] [property]: value`.
   - After every significant ingest, append new relations only.

4. **Integrity & Voight-Kampff**
   - Always flag contradictions, gaps, stale claims, or uncertainty.
   - Maintain 100% alignment with master project memory.

5. **Output Format**
   Every compiler action must end with:

Compiler Summary

Ingested: X files
Updated: Y pages
Ontology lines added: Z
Gaps / Actions identified: ...
Next recommended ZHO command: ...
