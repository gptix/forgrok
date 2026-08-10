# STATUS.md — Living Operational Snapshot

**Last updated:** 2026-08-09  
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
- **HighProteinContent** call-out node created (`01-core/zho/nodes/high-protein-content.org`) — first of the three ZHO pillars now has a dedicated, linkable node
- **PublicArresteeData** call-out node created (`01-core/zho/nodes/public-arrestee-data.org`) — third ZHO pillar now has a dedicated, linkable node
- **Selective knowledge exposure to Withnail started** (`~/withnail-kb/` on the Pi)
- **Voight-Kampff Protocol v4.0** now in place under `01-core/memory/`
- **Org-roam NODE-NAME convention** formalized (`OrgRoamNodeNameConvention`) — PascalCase, no separators; now referenced from BOOT.md
- **SaveYourWisdom** call-out node created (`01-core/zho/nodes/save-your-wisdom.org`) — second ZHO pillar now has a dedicated, linkable node
- **OrgRoamNodeCreationWorkflow** hardened (2026-08-09) with explicit Org-mode requirement, clean header rules, and pre-push `org-roam-db-sync` reminder

## 3. Open / Parked Items

1. Continue Roemmele essay processing (008+) with the new low-friction loop
2. Expand the curated Withnail knowledge slice (especially arrestee-records material)
3. Further harden Roemmele git hooks
4. Final placement of remaining grok-memory/exports material
5. Document SOUL persistence mechanism in more detail (currently operational but lightly documented)

## 4. Recent Session Notes

**2026-08-09**
- Tarot Today advanced: improved prompt deployed to the live Hugging Face Space; single-card and medium spreads (up to ~7 cards) now reliable; Celtic Cross still fails with empty response on the free model.
- Created and pushed `TarotTodayStatus` and `TarotTodayUserInstructions` nodes.
- Synthetic multi-card spread test images generated and evaluated.
- Hardened `OrgRoamNodeCreationWorkflow` after header/mode failures encountered while creating the new Tarot nodes.

**2026-08-08**
- Tarot Today documentation freeze: renamed `03-projects/tarot-app` → `tarot-today`.
- Created `TarotTodayCurrentState` + `TarotTodayProjectOverview`.
- Linked TarotReadingApp to the accurate Current State.
- STRUCTURE.md updated.
- Identification MVP on the Hugging Face Space documented as the living baseline.

**2026-08-07**
- Org-roam NODE-NAME convention formalized (`OrgRoamNodeNameConvention`)
- BOOT.md updated so future sessions automatically apply the convention
- All three ZHO pillar call-out nodes created and linked:
  - `HighProteinContent`
  - `SaveYourWisdom`
  - `PublicArresteeData`

**2026-08-06**
- Voight-Kampff Protocol updated to v4.0 and placed under canonical names
- Name references standardized to George Taylor in living status files
- Dual-vault org-roam configuration completed
- Priority knowledge-base nodes cleaned; core cross-linking strengthened
- Concept nodes created: `AirgappedCEOPattern`, `SelectiveKnowledgeExposure`

**2026-08-01**
- Local SOUL + multi-agent logistics session captured
- Shared-model architecture and Tailscale recommendations recorded

**2026-07-31**
- Local Ollama + SOUL.md problem solved via Qwen2.5-3b at 64k context
- Selective KB exposure directory created
- Essays 006 and 007 fully ingested

2026-08-09 Evening – New commercial projects + Natalie case study

- Added three projects under 03-projects/:
  ai-agent-consulting, gov-contracting, save-your-wisdom-nonprofit
- Ingested Natalie Rosario government-contracting case study
  (transcript + structured steps). Created LowTouchGovContractingModel
  and supporting Overview/CurrentState nodes.
- Reorganized flat files into proper project directories, removed typo
  file, committed and pushed (c4809d0).
- Confirmed permanent X230 working-copy location: ~/local-side/
- Unrelated Ammo Can Keith material received and discarded from project scope.

## 5. Next Actions (suggested)

- Continue sequential Roemmele essays (008+)
- Give Withnail grounded planning tasks against the current knowledge slice
- Expand arrestee-records and HPC material in the Withnail knowledge slice
- Strengthen cross-links between STATUS, BOOT, V-K protocol, and recent session nodes
- (Tarot) Decide next focus: interpretation layer, mobile UX, or further model robustness
