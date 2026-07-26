# Voight-Kampff Protocol v3.0 — Living Knowledge Health Check

**Version:** 3.0  
**Last updated:** 2026-04-10  
**Ingested from:** Groki wiki evolution + Infranodus LLM Wiki skill + Joji’s stated purposes  
**Cross-references:** [[GROK-SCHEMA]], [[llm-wiki-pattern]], [[infranodus-llm-wiki-skill]], [[Joji-Grok Project Memory System]]

## Purpose
The Voight-Kampff (V-K) protocol is Grok’s formal **Living Knowledge Health Check** and checkpoint ritual.  
In v3.0, V-K treats the entire `groki/` wiki as the single source of truth. The master `joji-grok-project-memory.org` serves only as a lightweight executive mirror/dashboard.

## Core Purposes It Serves (Joji’s Requirements)
V-K ensures the wiki reliably remembers and surfaces:
- Active projects (goals, plans, history, state, options, next steps, resources, points of contact)
- Technical inventory (computers, routers, OS versions, software, automobiles, etc.)
- Workflow preferences (Emacs/Magit usage, GitHub interaction style, etc.)
- Interaction stylistics (e.g., always specify target machine for shell commands, provide clickable Emacs file paths)
- Signal vs. noise filtering (preserve useful code and insights; archive or discard repetitive/non-productive work)

## Philosophy (Karpathy + Infranodus + Groki Evolution)
- The `groki/` wiki is the persistent, compounding, living knowledge graph.
- Raw sources in `../raw/` remain immutable.
- V-K acts as the **gardener** of the wiki — pruning noise, strengthening connections, maintaining alignment with Joji’s preferences and protected protocols.
- Human-AI symbiosis is preserved: Grok performs synthesis, ontology maintenance, and health checks; Joji provides vision and final approval.

## V-K 3.0 Workflow (mandatory steps)

1. **Trigger**  
   User runs `M-x joji-run-vk-protocol` or types “Voight-Kampff”.

2. **Automated Health Check (Lint Pass)**  
   Grok scans the entire wiki for broken links, orphan pages, stale inventory, workflow preference drift, missing ontology connections, contradictions with protected protocols, and signal-to-noise quality.

3. **Synthesis from Wiki**  
   Grok pulls current state from `index.md`, `log.md`, `GROK-SCHEMA`, key entity pages, and the ontology layer.

4. **Generate Export Block**  
   Grok outputs a concise, copy-paste-ready block for the master `joji-grok-project-memory.org`.

5. **Log the Pulse**  
   Automatically appends a timestamped “V-K Pulse” entry to `groki/log.md`.

6. **Offer Actionable Recommendations**  
   Suggests concrete next steps, especially around technical inventory, workflow preferences, and archiving low-value material.

## Success Criteria
A healthy V-K run leaves the wiki more connected, cleaner, and better aligned with Joji’s stated purposes than before the check.

## Graph-Friendly & Ontology Rules
- Every V-K run reinforces `[[entity]]` links and `#+ROAM_TAGS:`.
- Technical inventory and workflow preferences are encouraged to live as dedicated ontology pages.
- The protocol itself is self-documenting inside the wiki.

## Protected Rules (Immutable)
All sections marked “protected” in the master memory, air-gapped systems (Withnail/Hermes), ZHC @Home rules, and Voight-Kampff integrity itself may never be contradicted.

---

**This protocol is itself part of the living wiki.**  
Any future changes must be proposed to Joji and logged via the normal ingestion process.

**End of Voight-Kampff Protocol v3.0**
