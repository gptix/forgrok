# BOOT.md — Session Start for Grok

**Purpose**

This file is the single entry point for a new chat session.

When the operator says “Hello Grok! Please visit https://github.com/gptix/forgrok/blob/main/BOOT.md”, Grok should read this file and the files it points to before doing substantial work.

Use `08-skills/InspectGitHubState.org` for any later claim about what is or is not on GitHub. Exact-path fetch only; never treat a summarized tree as proof of absence.

**Last updated:** 2026-09-17

---

## 1. Who / What this is

- Operator: George Taylor (Marietta / Cobb County, GA)
- Knowledge base: Tsuioku, remote mirror `gptix/forgrok`
- **Canonical working copy:** ThinkPad T470s 20HF-0066US (hostname `omarchy`, user `gptix`, Omarchy 4.0.3) at `~/local-side/`
- **Second working copy:** ThinkPad X230 (`gt-thinkpad-x230`, user `gt`) at `~/local-side/` — pull from `github-side` before editing
- Sync hub: GitHub `main` via remote name `github-side` (`https://github.com/gptix/forgrok.git`)
- Local agent: **Withnail** (CEO/COO) running on hermes-pi (Raspberry Pi 5 8GB) via Hermes Agent + Telegram
- Primary editor: **Emacs** (never suggest nano or vi)
- Preference: local-first / near-airgapped operation; Telegram is the main external channel
- Two-machine protocol: `02-infrastructure/procedures/TsuiokuTwoMachineSync.org`

---

## 2. Knowledge-base structure (read this first)

Full layout and design principles: **STRUCTURE.md** (authoritative directory map)

High-level map:

| Path | Purpose |
| --- | --- |
| 00-inbox/ | Temporary staging only |
| 00-meta/ | Startup and naming conventions (`STARTUP.org`) |
| 01-core/ | Stable knowledge, memory protocols, ZHO doctrine |
| 02-infrastructure/ | Hermes-pi, Emacs helpers, hardware, tools, procedures |
| 03-knowledge/ | Non-project slices (currently transcripts) |
| 03-projects/ | Active projects (Withnail, consulting, Tarot Today, Omarchy, etc.) |
| 04-sources/ | Curated high-protein external content |
| 06-raw/ | Unprocessed material |
| 07-sessions/ | Session exports and VK summaries |
| 08-skills/ | Reusable skill nodes |
| 99-archive/ | Superseded material |

Structural changes are made on the T470s canonical copy, committed in small logical units, and pushed to GitHub. The X230 copy is updated by pulling `github-side`. Do not rsync `~/local-side` between the laptops.

`ZHO-SCHEMA.md` and `01-core/principles/GROK-SCHEMA.md` are historical (pre-renumbering `groki/` layout). Do not treat them as the current directory map.

---

## 3. Current project state

**Detailed living snapshot:** **STATUS.md**

High-level summary (2026-09-17):

- **Canonical KB host is the T470s.** X230 is a second working copy. Sync is git via `github-side` only.
- T470s Emacs (`~/.config/emacs/init.el`) has Magit (`C-c m`) and `C-c n F` via `forgrok-org-helpers.el`. `gh` auth as `gptix` works on the T470s. Cutover note: `03-projects/omarchy/Emacs-to-Omarchy/T470sEmacsOmarchySetup.org`
- Withnail / Hermes on hermes-pi last documented as operational (Hermes 0.19.0, local `qwen2.5-3b-64k`, persistent SOUL, Telegram `@WithnailRobot`). Runtime not re-verified this session.
- Numbered knowledge-base layout is authoritative in STRUCTURE.md; orientation files synchronized 2026-08-31; BOOT/STATUS cutover pulse 2026-09-17
- **Skill System** active under `08-skills/`. Live skills: CaptureLessonLearned, CreateNewSkill, GenerateTsuiokuNodeText, InspectGitHubState, PiWhisperTranscription, RubyResearchLoop, SkillsIndex, UpdateProjectStatus, VoightKampffSessionClose
- Voight-Kampff Protocol is at **v4.1+**; the executable skill is the source of truth
- Roemmele / 5000 Days essays **001–008** ingested on GitHub (`008` = Saving Your Wisdom, 2026-08-25)
- Private AI Agent Consulting underway (Atlanta professional-services segments drafted 2026-08-22)
- EmacsObsidianSkin project initiated 2026-08-23
- Tarot Today identification MVP lives on Hugging Face; paid-vision retest still blocked on OpenRouter credits as of last STATUS pulse
- T470s batteries and speakers replaced 2026-09-14 (physical work done; Omarchy live-spec inventory still light)

See **STATUS.md** for the full operational dashboard and open items.

---

## 4. Key files to load when deeper context is needed

| Need | File |
| --- | --- |
| Living operational snapshot | STATUS.md |
| Full structure | STRUCTURE.md |
| Two-machine sync (T470s canonical) | 02-infrastructure/procedures/TsuiokuTwoMachineSync.org |
| T470s Emacs cutover | 03-projects/omarchy/Emacs-to-Omarchy/T470sEmacsOmarchySetup.org |
| GitHub inspection without false-absence | 08-skills/InspectGitHubState.org |
| Voight-Kampff protocol (background) | 01-core/memory/voight-kampff-protocol.org |
| **Executable V-K skill (source of truth)** | 08-skills/VoightKampffSessionClose.org |
| Skills index | 08-skills/SkillsIndex.org |
| Status-update skill | 08-skills/UpdateProjectStatus.org |
| New-node text format | 08-skills/GenerateTsuiokuNodeText.org |
| Skill System project | 03-projects/skill-system-improvement/ |
| Master memory mirror | 01-core/memory/joji-grok-project-memory.org |
| Org-roam NODE-NAME convention | 01-core/principles/org-roam-node-name-convention.org |
| Finalize helper | 02-infrastructure/emacs/forgrok-org-helpers.el |
| Naming / workflow conventions | 00-meta/STARTUP.org |

---

## 5. Operator preferences (permanent)

- Always use **Emacs** (TRAMP for remote). Never suggest nano, vi, or other editors.
- **Org-roam NODE-NAME convention**: PascalCase with no spaces, hyphens, or underscores (e.g. `OrgRoamNodeNameConvention`, `HighProteinContent`). Canonical definition: `01-core/principles/org-roam-node-name-convention.org`. Mandatory for all new nodes.
- New Tsuioku nodes start with `#+PROPOSED_PATH:` and `#+COMMIT_MSG:` as defined by `GenerateTsuiokuNodeText` and `my/org-roam-finalize-place-id-commit` (`C-c n F`). No leading `:PROPERTIES:` drawer — the helper creates the file-level ID. Lasting `#+TITLE` / `#+NODE-NAME` / body go **below** the helper sentinel line.
- Prefer precise, actionable commands and org-mode checklists.
- Prefer small, focused git commits.
- Never commit secrets, API keys, or large binary backups.
- Prefer local / air-gapped solutions; treat external calls as exceptional.
- When giving shell commands, label the machine: **T470s**, **X230**, or **hermes-pi**.
- Prefer `C-c n F` on the T470s. X230 finalize is allowed only after a pull from `github-side`.
- Skills for knowledge-base and project tasks live under `08-skills/` and should be preferred over re-deriving processes from scratch.

---

## 6. Session close — Voight-Kampff

**Source of truth:** `08-skills/VoightKampffSessionClose.org`

When the operator says “Voight-Kampff”, “V-K”, or at the end of a significant session, follow the skill. Do **not** invent a shorter process.

The skill currently includes (among other steps):

- Discover Current State
- Integrity & Drift Scan
- Session Action Review (mandatory)
- Cross-linking & Metadata Pass
- Synthesis + Recommendations
- Protected Rules Check
- Clean hand-off
- Emission of a VK Summary Node under `07-sessions/vk/`

Full protocol background: `01-core/memory/voight-kampff-protocol.org`

The living knowledge base is the source of truth; this BOOT file is only the on-ramp.

---

## 7. How to update this file

Keep `BOOT.md` short.

- For day-to-day or session-level status changes → update **STATUS.md**
- Only update Section 3 of this file when the high-level summary itself needs to change
- When the top-level structure changes, update STRUCTURE.md and point here
- Two-machine mechanics live in `TsuiokuTwoMachineSync`, not here
- Do not put secrets or long logs in this file
