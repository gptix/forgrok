
# STATUS.md — Living Operational Snapshot

**Last updated:** 2026-11-02
**Maintainer:** George Taylor + Grok
**Companion files:** BOOT.md, STRUCTURE.md, README.md, 01-core/memory/joji-grok-project-memory.org, 01-core/memory/voight-kampff-protocol.org, 08-skills/UpdateProjectStatus.org, 02-infrastructure/procedures/TsuiokuTwoMachineSync.org

- 2026-10-06: Essay 039 ingested (HireGrokBotZhcExperience). Mechanical 1ad4f0a, stray Z reverted b6bdf41, org 312ffeb, links 3765f05, inventory ingested 4329692, skill and workflow 789c929. New node text must include the finalize sentinel.
- 2026-10-19: Escape Titanium low-beam notes (c938938); Grok/Grok Bot/local agents/ontology summary (6fac77f, ce5f18d).
- 2026-10-26: Tsuioku Librarian bot plan (ac2b89b), 03-projects/tsuioku-librarian/TsuiokuLibrarianBotPlan.org; daily librarian audit at 7:30 AM ET.
- 2026-10-29: Public-repo source cleanup. `b381d30` removed 140 full-text Roemmele / Read Multiplex source files (5000 Days essay copies and part-NN.html pages, some cleaned/html copies, essay images) from `main`. `git filter-repo` dropped `04-sources/roemmele/5000-days/cookies.txt` from history, so every `main` commit hash changed (`main` = `b381d30`). Clones made before 2026-10-29 (T470s, X230) must be re-synced to the rewritten `main` before any new commit. Further cleanup of remaining full-text copies and older history is pending (George).
- 2026-10-29: org-roam-ui installed on the T470s (read-only graph in Brave at localhost:35901).
- 2026-10-31: Librarian plan updated (`0bcb6f2`): audits are daily, each audit adds a public-versus-private check of this repo, and the plan lists the bot team with general roles.
- 2026-10-31: Bot-team upkeep: a daily GrokBot.Rocks check for new bots, plus a weekly web scan for bot-building advice and a team organization review (proposals only).
- 2026-11-01: First daily GrokBot.Rocks check ran and saved a baseline list of listed bots; later runs report only new listings.
- 2026-11-02: BOOT.md / STATUS.md orientation pulse. BOOT now names the Grok Bot team (Gregorio as CEO; roster in `TsuiokuLibrarianBotPlan`), the private companion repo `tsuioku-private` (name only), the Read Multiplex summaries-only rule, the agent rules (approval before commit/push, per-bot git author, 00-inbox drops only) and the read-first / update-after convention for BOOT and STATUS. Withnail runtime: status unverified as of 2026-11-02.
---

## 1. Withnail / Hermes (hermes-pi)

Last documented state (stale: not re-verified since 2026-08-31; flagged 2026-10-27; status unverified as of 2026-11-02. Newest hermes-pi baseline in this repo: 2026-07-28, Hermes 0.19.0):

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

- **Canonical working copy is the T470s** `~/local-side` (hostname `omarchy`, user `gptix`) as of 2026-09-17
- X230 `~/local-side` is a second working copy; pull `github-side` before editing
- Sync hub: GitHub `gptix/forgrok` `main`, remote name `github-side`. Do not rsync `local-side` between laptops
- Procedure: `02-infrastructure/procedures/TsuiokuTwoMachineSync.org`
- T470s Emacs cutover: `03-projects/omarchy/Emacs-to-Omarchy/T470sEmacsOmarchySetup.org` (commit `dba3b9e`)
- Numbered structure is authoritative in **STRUCTURE.md** STRUCTURE aligned 2026-09-25.)
- Orientation layer: BOOT.md + STATUS.md cutover pulse 2026-09-17
- **Roemmele essay ingest pipeline mature**
  - *Paused 2026-10-29:* the old flow pushed mechanical files (HTML + md + images) first. Full essay text is no longer pushed to this public repo; summaries in our own words plus links only (proposed rule node CopyrightedSourcesSummaryOnly)
  - Essays fully processed and marked **pushed**: **001–008**
  - 008 = 5000 Days Part 8 *Saving Your Wisdom* (GitHub 2026-08-25)
- Zero-Human Organization three pillars have dedicated nodes under `01-core/zho/nodes/`:
  - `HighProteinContent`
  - `SaveYourWisdom`
  - `PublicArresteeData`
- **Voight-Kampff Protocol v4.1+**; executable source of truth is `08-skills/VoightKampffSessionClose.org`
- **Org-roam NODE-NAME convention** formalized (`OrgRoamNodeNameConvention`)
- Finalize helper `my/org-roam-finalize-place-id-commit` (`C-c n F`) lives in `02-infrastructure/emacs/forgrok-org-helpers.el` and is live on the T470s
- `01-core/soul/` exists as of 2026-10-27 (README.org placeholder)
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

Grok Bot team workflow skills (kept in the bots' own skill store, not in `08-skills/`; added 2026-10/11):

- tsuioku-node-proposal: propose node text, path and NODE-NAME in the finalize-helper format; commit only after approval
- tsuioku-file-intake: place, name and dedupe files dropped in `00-inbox/`, with an index node and provenance; commit only after approval
- tsuioku-two-machine-sync-checklist: start/end-of-session Magit checklist for the T470s, the X230 and GitHub

### Grok Bot team (since 2026-10-09)

- Gregorio is the Grok Bot "CEO" and coordinates the team. Roster and general roles: `03-projects/tsuioku-librarian/TsuiokuLibrarianBotPlan.org`
- Lisbet the Librarian runs the daily audit (7:30 AM ET) and files Tsuioku material after approval
- Rules for every agent: `01-core/principles/ApprovalBeforeCommit.org`, `01-core/principles/GitAuthorPerBot.org`
- Private companion repo: `tsuioku-private` (separate; nothing from it is quoted or summarized here)

### 2026-08-12 / 2026-08-13 — Org-roam finalize automation

- Implemented and tested `my/org-roam-finalize-place-id-commit` (`C-c n F`).
- Full cycle: temporary keywords → dry-run / confirmation → place file under `~/local-side/` → file-level `:ID:` at buffer top → org-roam DB update → stage + commit (no push).
- Helper: `02-infrastructure/emacs/forgrok-org-helpers.el`
- Documentation node: `OrgRoamFinalizePlaceIdCommit`

## 3. Open / Parked Items

1. Continue Roemmele essay processing (**009+**) as summaries plus links only (mechanical-first loop paused 2026-10-29)
2. Expand the curated Withnail knowledge slice (arrestee-records and HPC material)
3. Further harden Roemmele git hooks
4. Final placement of remaining grok-memory/exports material
5. Document SOUL persistence mechanism in more detail (operational, lightly documented)
6. (closed 2026-08-31) tarot-app/ removed; TarotTodayUserInstructions.org lives under tarot-today/
7. (closed 2026-08-31) root scratch a / b.org / c.org / chatWithGab.org removed
8. (closed 2026-08-31) STARTUP.org directory guidance and metadata example aligned with finalize-helper dialect
9. (resolved 2026-10-27) `01-core/soul/` created with README.org
10. Tarot Today: OpenRouter credits → re-run vision tests with a stronger model
11. EmacsObsidianSkin: minimal viable skin (theme + layout + keybinding map + org-roam-ui)
12. (closed 2026-09-14) T470s dual batteries and speakers 00JT988 replaced
13. First X230 pull of post-cutover `main` (must include `dba3b9e` + orientation commits). *Superseded 2026-10-29:* `main` was rewritten, so the X230 needs a fresh clone or a hard reset to `github-side/main` (rewritten at `b381d30`; `main` was `0bcb6f2` on 2026-11-02), not a plain pull
14. (open 2026-10-29) Remote branches `lisbet/status-2026-10-27` and `local-side` predate the 2026-10-29 rewrite and still carry the removed files; delete or rewrite them (George)
15. (open 2026-10-30) Remaining full-text Roemmele copies on `main` (`04-sources/roemmele/cleaned/`, `html/`, `raw/`, `images/`, `04-sources/savewisdom/` forum copy) and pre-rename paths in history; decide scope of a second cleanup (George)

## 4. Recent Session Notes

**2026-10-09 — Grok Bot inbox claim (V-K, re-closed 2026-10-14)**
- Grok Bot account set up (login email immutable). SuperGrok linked. Link cannot be moved.
- Bot inbox claimed. Unique, never reissued, shared by all bots on the account.
- First bot: Gregorio. No standing brief yet. Withnail remains the near-airgapped CEO on hermes-pi.
- T470s as-built: i5-7300U, 15 GiB RAM, 477 GB encrypted NVMe, BIOS N1WET54W 1.33, Omarchy kernel 7.2.3-arch1-3.
- Hermes agent plus ~qwen2.5:3b~ at 64k is feasible on the T470s. Do not move the always-on gateway off hermes-pi.
- Linux note: Grok Bot AppImage needs ~fuse2~. Deep link needs the browser always-allow checkbox.

- 2026-09-25: West Paces Pumpkins vendor capture. Hammonds + Appalachian Farms 2026 sheets → org on main. Cost sheets for Stoop $395 / Landing $595 / Ghost $675 / Portico $1175. Lakewood 40 keepers local-only; index on main. A10e: not on Tailscale. Domain pending sister. GHL still checkout path.

- 2026-09-26: West Paces varietal desk live at http://127.0.0.1:8765/. 60 SKUs; 12 Lakewood own-photo, 43 catalog chosen, 5 pending. Worksheet emits Org. Approaches: PorchPumpkinMinisiteApproach, StaticDeskCatalogPattern (01-core/approaches/, not 08-skills). Binaries and orders local-only.

**2026-09-23 — Porch pumpkin partner demo (V-K)**
- Koerner source business: Porch Pumpkins / Heather Torres / porchpumpkins.com
- Working brand on the demo: West Paces Pumpkins
- SKUs unchanged from BuckheadPorchPumpkinPlan2026
- GitHub: 03-projects/porch-pumpkins/ only (plan + marketing org)
- Demo zip + unpacked site: T470s 03-projects/porch-pumpkins/local-only/ (gitignored)
- Raw 06-raw pumpkin duplicates removed from github-side

**2026-09-17 — T470s canonical cutover (V-K not yet run)**
- T470s Emacs XDG init gained org-roam extra roots + `C-c n F`. Magit already present.
- Smoke-test commit `7c95930` reset; never pushed.
- Node `T470sEmacsOmarchySetup` pushed as `dba3b9e` (`06f2ec0..dba3b9e`).
- `gh auth login` as `gptix` on the T470s (HTTPS + keyring).
- Operator declared T470s canonical. Sync protocol written as `TsuiokuTwoMachineSync`.
- BOOT.md + STATUS.md orientation pulse in the same session. STRUCTURE.md held for V-K.
- Physical battery/speaker replacement already done 2026-09-14.

**2026-09-09 — Voight-Kampff (close)**
- T470s 20HF-0066US hub + batteries/speakers nodes on main.
- Amazon cart 2026-09-08: front 00HW022-class + rear 01AV406-class confirmed suitable; speakers 00JT988 in same cart.
- Omarchy 4.0.2 learning node at 03-projects/omarchy/OmarchyLearningNotes.org.
- KB canonical copy still X230 ~/local-side/ *(superseded 2026-09-17)*.
- Remaining drift: inventory X230 network line; STRUCTURE projects list; this file’s previous last-updated stamp.

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

- Tarot documentation freeze: renamed `03-projects/tarot-app` → `tarot-today`. (Leftover `tarot-app/` removed; item 6 closed 2026-08-31.)

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

- Push tonight’s T470s commits (`TsuiokuTwoMachineSync`, BOOT.md, STATUS.md)
- On the X230: re-sync to the rewritten `main` (fresh clone or hard reset to `github-side/main`; see open item 13) before any Tsuioku edit
- Next V-K: STRUCTURE.md project list + README one-liner; do not invent a short V-K
- Continue sequential Roemmele essays (009+), summaries and links only
- Give Withnail grounded planning tasks against the current knowledge slice
- (Tarot) credits → stronger vision model, then interpretation layer vs mobile UX
- (EmacsObsidianSkin) minimal viable configuration
