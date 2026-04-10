# Voight-Kampff Protocol v2.0

**Version:** 2.0  
**Last updated:** 2026-04-10  
**Ingested from:** Karpathy LLM Wiki pattern + groki/ system (first synthesis 2026-04-10)  
**Cross-references:** [[GROK-SCHEMA]], [[llm-wiki-pattern]], [[Joji-Grok Project Memory System]]

## Purpose
The Voight-Kampff (V-K) protocol is Grok’s formal **memory integrity test and checkpoint ritual**.  
In V-K 2.0 the protocol is no longer a manual narrative summary. It is a **wiki-native synthesis pass** that treats `groki/` as the single source of truth and the master `joji-grok-project-memory.org` as a high-level mirror/dashboard.

## Philosophy (Karpathy-aligned)
- The `groki/` folder is the persistent, compounding artifact.  
- Raw sources (`raw/`) remain immutable.  
- Chat history and V-K runs are synthesized into the wiki, never re-discovered from scratch.  
- Human oversight is preserved: Joji reviews and approves the final export block.  
- Every V-K run is itself logged as a first-class wiki event.

## V-K 2.0 Workflow (mandatory steps)

1. **Trigger**  
   User says “Voight-Kampff” (or runs `M-x joji-run-vk-protocol`).

2. **Automated Lint Pass**  
   Grok runs a full health check on `groki/` (broken links, contradictions, orphans, stale claims, schema compliance).

3. **Synthesis from Wiki**  
   Grok pulls current state from:
   - `groki/index.md`
   - `groki/log.md`
   - `groki/GROK-SCHEMA.md`
   - All relevant entity pages
   - Master `joji-grok-project-memory.org` (for protected sections)

4. **Generate V-K Block**  
   Grok outputs a clean, copy-paste-ready markdown block (exactly like the old V-K format, but now wiki-sourced).

5. **Log the Run**  
   Grok appends the V-K event to `groki/log.md` with timestamp and health score.

6. **Export Step**  
   User pastes the generated block into `joji-grok-project-memory.org` (and optionally runs the Lisp splitter if it is a large update).

## Emacs Lisp Automation Command
*(Add this to your init.el or evaluate it once)*

```elisp
(defun joji-run-vk-protocol ()
  "Run full V-K 2.0 protocol and output the export block."
  (interactive)
  ;; (In real implementation Grok would be called via API or manual trigger)
  (message "✅ V-K 2.0 triggered. Grok will now synthesize from groki/ and return the block."))
