# STATUS.md — Living Operational Snapshot

**Last updated:** 2026-08-17  
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
### 2026-08-12 / 2026-08-13 — Org-roam finalize automation

- Implemented and tested `my/org-roam-finalize-place-id-commit` (`C-c n F`).
- Full cycle: temporary keywords → dry-run / confirmation → place file under `~/local-side/` → file-level `:ID:` at buffer top → org-roam DB update → stage + commit (no push).
- Helper: `02-infrastructure/emacs/forgrok-org-helpers.el`
- Documentation node: `OrgRoamFinalizePlaceIdCommit`
- Dual-vault roots now include `02-infrastructure`
- init.el updated (load-path + require + key binding)

### Skill System (2026-08-17)

- New project: Skill System Improvement
- Live skills:
  - CaptureLessonLearned
  - CreateNewSkill
  - GenerateTsuiokuNodeText
  - SkillsIndex
  - UpdateProjectStatus
  - VoightKampffSessionClose
- Finalize helper (`my/org-roam-finalize-place-id-commit`) hardened:
  - Forces `org-mode` when needed
  - Stray backslash that broke `(require 'org)` fixed
- Voight-Kampff Protocol updated to v4.1 (Session Action Review now mandatory)
- Learning cycle entry points are executable

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

### 2026-08-23 — EmacsObsidianSkin project initiated

- New project: 03-projects/emacs-obsidian-skin/
- Goal: curated Emacs “skin” approximating Obsidian look/feel/keybindings to lower onboarding friction for Markdown/wiki users into Org-roam + local AI agents
- Primary format locked: **Org-first**
- Nodes created: EmacsObsidianSkinOverview, EmacsObsidianSkinCurrentState, EmacsObsidianSkinResearch
- Research confirms genuine gap; strongest building blocks identified (org-roam-ui, org-modern, modern completion stack, md-roam as later option)
- Next: minimal viable skin configuration (theme + layout + keybinding map + org-roam-ui)

### 2026-08-10 / 2026-08-11 — Tarot test corpus + file-transfer skill + LLC guidance

**Infrastructure / Tools**
- Proven end-to-end method for moving photos from Galaxy A10e (Termux + Tailscale + sshd) to X230 documented as org-roam node `A10eTermuxTailscaleSshFileTransfer` under `02-infrastructure/tools/`.
- Method preferred over USB MTP, KDE Connect, and Nautilus SFTP after extensive troubleshooting.

**Tarot Today**
- 51 real-world test photographs collected on 2026-08-10 (after 15:00) covering the full scenario roster (valid layouts, invalid counts, foreign cards, orientation stress, lighting/clutter, etc.).
- Images sorted into 33 numbered category directories under `~/Pictures/tarot-test-images/`.
- Batch-testing script (`~/bin/tarot-batch-test.py`) written; calls OpenRouter with the exact prompt used by the static HF Space.
- First full batch run completed with `openrouter/free`. Results show frequent long chain-of-thought and occasional refusals; free vision models subsequently rate-limited.
- Paid models (Gemini Flash, etc.) currently unavailable (OpenRouter account has no credits; replacement credit card pending after fraud cancellation).

**Business / Entity Formation**
- High-quality guidance node `LlcFormationWhyWhenHow` created from Mark J. Kohler material + IRS / SBA / Georgia Secretary of State primary sources. Ready for use when forming the operational LLC for gov-contracting / AI-agent services.

**Open items**
- Wait for new credit card → add small OpenRouter credit → re-run single-card tests with a stronger vision model (Gemini 2.5 Flash recommended).
- Once recognition is stable, add automatic descriptive renaming and the progressive validation rules (count, foreign cards, layout, lighting, etc.).

Final Status Pulse — 2026-08-17 01:28 AM
What is now durable

Skill System is live and indexed:
6 skills under 08-skills/
SkillsIndex present
Learning cycle entry points executable (CaptureLessonLearned, VoightKampffSessionClose, UpdateProjectStatus)

Voight-Kampff Protocol at v4.1 (Session Action Review mandatory)
Finalize helper hardened and the stray-backslash bug fixed
BOOT.md and STATUS.md both updated and pushed
08-skills now included in my/org-roam-extra-roots

Remaining small items (non-blocking)

Restart Emacs (or re-evaluate the defvar + org-roam-db-sync) so the new extra-root is fully active in the running session
A few Tier-2/3 skills still on the Skill System Improvement checklist (IngestHighProteinSource, SkillRefinementLoop, etc.)
Tarot Today still waiting on OpenRouter credits

Overall
The knowledge base is in a clean, coherent, and significantly more automated state than it was at the start of the evening. The core meta-skill loop is working.
Good stopping point.

## Voight-Kampff — 2026-08-20
- Session-Close skill executed (remote).
- Status: PASS (preference integrity + project vector alignment confirmed).
- Major work: Off-loaded 2.7 GB Whisper transcription to Pi 5 under tmux; job independent of X230.
- New durable pattern: ~/transcription + faster-whisper + logged script + named tmux session.
- Secondary: Explored client-side X “Account based in” filter; multiple public extensions already exist; pure hide is low–moderate ToS risk.
- Next local: Retrieve transcript when finished; consider formalizing Pi transcription skill.


## 5. Next Actions (suggested)

- Continue sequential Roemmele essays (008+)
- Give Withnail grounded planning tasks against the current knowledge slice
- Expand arrestee-records and HPC material in the Withnail knowledge slice
- Strengthen cross-links between STATUS, BOOT, V-K protocol, and recent session nodes
- (Tarot) Decide next focus: interpretation layer, mobile UX, or further model robustness
