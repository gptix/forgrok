# STATUS.md — Living Operational Snapshot

**Last updated:** 2026-08-06  
**Maintainer:** George Taylor + Grok  
**Companion files:** BOOT.md, STRUCTURE.md, 01-core/memory/joji-grok-project-memory.org, 01-core/memory/voight-kampff-protocol.org

---

## 1. Withnail / Hermes (hermes-pi)

- Hermes Agent 0.19.0 running
- Local model path now working: **qwen2.5-3b-64k** (64k context)
- SOUL.md is respected on the local path (persistent)
- Telegram: @WithnailRobot live
- systemd user service enabled
- Skills heavily reduced for near-airgapped operation
- First successful longer-cycle local work completed (operating brief + health pulse)

## 2. Knowledge Base

- Numbered structure remains authoritative
- **Roemmele essay ingest pipeline mature**
  - Driver script no longer creates skeleton .org files
  - Preferred flow: mechanical files (HTML + md + images) pushed first → Grok writes full org-roam node → human reviews → push org + inventory
- Essays fully processed and marked **pushed**: **001–007**
- Zero-Human Organization Intent node exists (three pillars: HPC, Save-Your-Wisdom, public arrestee data)
- **Selective knowledge exposure to Withnail started** (`~/withnail-kb/` on the Pi)
- **Voight-Kampff Protocol v4.0** now in place under `01-core/memory/`

## 3. Open / Parked Items

1. Continue Roemmele essay processing (008+) with the new low-friction loop
2. Expand the curated Withnail knowledge slice (especially arrestee-records material)
3. Further harden Roemmele git hooks
4. Final placement of remaining grok-memory/exports material
5. Document SOUL persistence mechanism in more detail (currently operational but lightly documented)

## 4. Recent Session Notes

**2026-08-06**
- Voight-Kampff Protocol updated to v4.0 and placed under canonical names
- Name references standardized to George Taylor in living status files

**2026-08-01**
- Local SOUL + multi-agent logistics session captured
- Shared-model architecture and Tailscale recommendations recorded

**2026-07-31**
- Local Ollama + SOUL.md problem solved via Qwen2.5-3b at 64k context
- Selective KB exposure directory created
- Essays 006 and 007 fully ingested

## 5. Next Actions (suggested)

- Continue sequential Roemmele essays (008+)
- Give Withnail grounded planning tasks against the current knowledge slice
- Expand arrestee-records and HPC material in the Withnail knowledge slice
- Strengthen cross-links between STATUS, BOOT, V-K protocol, and recent session nodes


## 2026-08-06 Evening – Org-roam Dual Vault + Concept Node Work (Voight-Kampff)

### Completed tonight
- Dual-vault org-roam configuration is working (single SQLite database covering both `~/RoamNotes/` and selected trees under `~/local-side/`).
- Priority knowledge-base nodes cleaned: proper `#+NODE-NAME:` (no spaces) + standard metadata applied.
- Duplicate “ZHO Active Task List” resolved (living 2026-05-11 version kept; 2026-05-03 version marked as historical snapshot).
- Core cross-linking strengthened between Withnail’s Role, ZHO Active Task List, and Voight-Kampff Protocol v4.0.
- Two new high-value concept nodes created, committed, and cross-linked:
  - **Air-gapped / Near-Airgapped CEO Pattern** (`AirgappedCEOPattern`)
  - **Selective Knowledge Exposure** (`SelectiveKnowledgeExposure`)

### Open for next session
- Create **LocalSOULPersistence** concept node (first item).
- Continue remaining concept nodes (Roemmele Essay Ingest Pipeline, Numbered Structure, etc.).
- Broader metadata sweep on remaining knowledge-base nodes that still lack clean `#+NODE-NAME:`.
- Expand the selective knowledge exposure slice available to Withnail.

### Notes
- Org-roam now reliably finds nodes from both the personal vault and the structured knowledge base.
- Temporary file corruption (`#<buffer ...>` artifacts) that appeared during editing was cleaned.
