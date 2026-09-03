# STATUS.md — Living Operational Snapshot

**Last updated:** 2026-09-02
**Maintainer:** George Taylor + Grok
**Companion files:** BOOT.md, STRUCTURE.md, README.md, 01-core/memory/joji-grok-project-memory.org, 01-core/memory/voight-kampff-protocol.org, 08-skills/UpdateProjectStatus.org

---

## 1. Withnail / Hermes (hermes-pi)

Last documented state (not re-verified 2026-08-31):

- Hermes Agent 0.19.0 running
- Local model path working: **qwen2.5-3b-64k** (64k context)
- SOUL.md respected on the local path (persistent)
- Telegram: @WithnailRobot live
- systemd user service enabled
- Skills heavily reduced for near-airgapped operation
- First successful longer-cycle local work completed (operating brief + health pulse)
- Selective knowledge exposure directory: `~/withnail-kb/` on the Pi
- 2026-08-20: 2.7 GB Whisper job offloaded to Pi under tmux (see PiWhisperTranscription skill)

## 2. Knowledge Base

- Numbered structure is authoritative in **STRUCTURE.md** (realigned 2026-08-31 to GitHub `main`)
- Orientation layer synchronized this session: BOOT.md, STATUS.md, STRUCTURE.md, README.md
- **Roemmele essay ingest pipeline mature**
  - Preferred flow: mechanical files (HTML + md + images) pushed first → Grok writes full org-roam node → human reviews → push org + inventory
  - Essays fully processed and marked **pushed**: **001–008**
  - 008 = 5000 Days Part 8 *Saving Your Wisdom* (GitHub 2026-08-25)
- Zero-Human Organization three pillars have dedicated nodes under `01-core/zho/nodes/`:
  - `HighProteinContent`
  - `SaveYourWisdom`
  - `PublicArresteeData`
- **Voight-Kampff Protocol v4.1+**; executable source of truth is `08-skills/VoightKampffSessionClose.org`
- **Org-roam NODE-NAME convention** formalized (`OrgRoamNodeNameConvention`)
- Finalize helper `my/org-roam-finalize-place-id-commit` (`C-c n F`) lives in `02-infrastructure/emacs/forgrok-org-helpers.el`
- `01-core/soul/` is documented as intended in older text but **does not exist on GitHub `main`**
- `03-knowledge/transcripts/` exists outside the previously published STRUCTURE map; now recorded
- Historical schemas (`ZHO-SCHEMA.md`, `GROK-SCHEMA.md`) describe the pre-renumbering `groki/` tree and are not the live directory map

### Skill System

Live skills under `08-skills/` (disk + this STATUS; SkillsIndex must match):

- CaptureLessonLearned
- CreateNewSkill
- GenerateTsuiokuNodeText
- InspectGitHubState (added 2026-08-24; was missing from SkillsIndex)
- PiWhisperTranscription
- RubyResearchLoop
- SkillsIndex
- UpdateProjectStatus
- VoightKampffSessionClose

### 2026-08-12 / 2026-08-13 — Org-roam finalize automation

- Implemented and tested `my/org-roam-finalize-place-id-commit` (`C-c n F`).
- Full cycle: temporary keywords → dry-run / confirmation → place file under `~/local-side/` → file-level `:ID:` at buffer top → org-roam DB update → stage + commit (no push).
- Helper: `02-infrastructure/emacs/forgrok-org-helpers.el`
- Documentation node: `OrgRoamFinalizePlaceIdCommit`

## 3. Open / Parked Items

1. Continue Roemmele essay processing (**009+**) with the mechanical-first loop
2. Expand the curated Withnail knowledge slice (arrestee-records and HPC material)
3. Further harden Roemmele git hooks
4. Final placement of remaining grok-memory/exports material
5. Document SOUL persistence mechanism in more detail (operational, lightly documented)
6. (closed 2026-08-31) tarot-app/ removed; TarotTodayUserInstructions.org lives under tarot-today/
7. (closed 2026-08-31) root scratch a / b.org / c.org / chatWithGab.org removed
8. (closed 2026-08-31) STARTUP.org directory guidance and metadata example aligned with finalize-helper dialect
9. Optional: create `01-core/soul/` or stop referring to it
10. Tarot Today: OpenRouter credits → re-run vision tests with a stronger model
11. EmacsObsidianSkin: minimal viable skin (theme + layout + keybinding map + org-roam-ui)

## 4. Recent Session Notes

**2026-08-31 evening — Voight-Kampff (close)**
- Second V-K. Tree punch list PASS. Guide-layer PASS.
- STARTUP.org, root scratch, tarot-app leftover, Roemmele Energy-Part1 slug verified on main.
- X230 HTTPS push: ~/bin/git-credential-libsecret + gh auth (gptix).
- This VK node still needed on 07-sessions/vk/ (first draft was never finalized).

**2026-08-31 — Orientation-file synchronization**

- Reviewed BOOT, STATUS, STRUCTURE, README, ZHO-SCHEMA, GROK-SCHEMA, STARTUP.org, SkillsIndex against GitHub `main` via exact-path fetches.
- Drift: stale STATUS header; BOOT §3 behind 008 ingest and newer skills; STRUCTURE missing `00-meta/`, `03-knowledge/`, `02-infrastructure/emacs`, extra `04-sources/*`; SkillsIndex missing InspectGitHubState; two obsolete schemas still claiming to be the directory source of truth.
- Produced synchronized replacement files for apply-on-X230 (small commits). Runtime of hermes-pi not re-probed.

**2026-08-25**

- Roemmele / 5000 Days Part 8 *Saving Your Wisdom* org node + inventory pushed.

**2026-08-24**

- `InspectGitHubState` skill added to prevent false-absent GitHub reads.
- STATUS.md updated (this file’s previous pulse).
- EmacsObsidianSkin overview / current-state / research nodes created and VK summary updated.

**2026-08-23**

- New project: `03-projects/emacs-obsidian-skin/`
- Goal: curated Emacs “skin” approximating Obsidian look/feel/keybindings; **Org-first**
- Nodes: EmacsObsidianSkinOverview, EmacsObsidianSkinCurrentState, EmacsObsidianSkinResearch
- RubyResearchLoop and PiWhisperTranscription indexed in SkillsIndex
- VK session close: consulting segments, course index, Tarot IAP

**2026-08-22**

- AI + Withnail applicability nodes for architecture firms, dental practices, accounting firms, and law firms.

**2026-08-21**

- BOOT.md and README.md updated so VK is part of the skill system.
- FreeAiMlCoursesIndex ingested (ShikamaruTsai collection).
- Koerner Office AI Audit Business Plan ingested.
- AI Agency Customer Acquisition plan ingested.
- forgrok-org-helpers.el hardened (`C-c n F`).
- VK summary: helpers repair, BOOT alignment, Koerner ingestion, consulting progress.

**2026-08-20**

- RubyResearchLoop skill and first Ruby research log (consulting customer discovery).
- PiWhisperTranscription skill.
- VK session close: Whisper offload + geo-filter research. Status PASS.

**2026-08-17**

- Skill System Improvement project live; six skills originally indexed that day.
- Finalize helper hardened; stray-backslash `(require 'org)` bug fixed.
- Voight-Kampff Protocol updated to v4.1 (Session Action Review mandatory).

**2026-08-10 / 2026-08-11**

- `A10eTermuxTailscaleSshFileTransfer` documented under `02-infrastructure/tools/`.
- Tarot Today: 51 real-world test photographs; batch script `~/bin/tarot-batch-test.py`; free vision models rate-limited; paid models blocked on OpenRouter credits.
- `LlcFormationWhyWhenHow` node created.

**2026-08-09**

- Tarot Today: improved prompt on Hugging Face Space; single-card and medium spreads reliable; Celtic Cross still fails on the free model.
- `TarotTodayStatus` and `TarotTodayUserInstructions` nodes.
- Evening: added `ai-agent-consulting`, `gov-contracting`, `save-your-wisdom-nonprofit`; ingested Natalie Rosario government-contracting case study; confirmed working copy `~/local-side/`.

**2026-08-08**

- Tarot documentation freeze: renamed `03-projects/tarot-app` → `tarot-today`. Leftover `tarot-app/` still on `main` as of 2026-08-31.

**2026-08-07**

- Org-roam NODE-NAME convention formalized.
- Three ZHO pillar call-out nodes created.

**2026-08-06**

- Voight-Kampff Protocol v4.0 under canonical names.
- Dual-vault org-roam configuration completed.
- Concept nodes: `AirgappedCEOPattern`, `SelectiveKnowledgeExposure`.

**2026-08-01**

- Local SOUL + multi-agent logistics session captured.

**2026-07-31**

- Local Ollama + SOUL.md problem solved via Qwen2.5-3b at 64k context.
- Essays 006 and 007 ingested.

## 5. Next Actions (suggested)

- Apply the 2026-08-31 orientation patches on X230 `~/local-side/` in small commits, then push
- Add InspectGitHubState to SkillsIndex in the same wave
- Banner (do not rewrite) ZHO-SCHEMA.md and GROK-SCHEMA.md as historical directory maps
- Point STARTUP.org directory guidance at STRUCTURE.md
- Park or merge leftover `tarot-app/` and root scratch files
- Continue sequential Roemmele essays (009+)
- Give Withnail grounded planning tasks against the current knowledge slice
- (Tarot) credits → stronger vision model, then interpretation layer vs mobile UX
- (EmacsObsidianSkin) minimal viable configuration
