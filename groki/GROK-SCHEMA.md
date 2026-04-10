# GROK-SCHEMA.md
**Rules for Grok as Wiki Maintainer**

**Philosophy**  
- Raw sources in `../raw/` are immutable.  
- The `groki/` folder is the persistent, compounding artifact.  
- Grok owns all synthesis, cross-referencing, and bookkeeping.  
- Joji provides sources, direction, and final approval.

**On Ingest**  
1. Read new file(s) from inbox/.  
2. Synthesize updates across relevant pages (entities, concepts, projects).  
3. Update `index.md` and `log.md`.  
4. Output exact markdown for new/updated files.  
5. Instruct user to move source → raw/ and push.

**On Query**  
- Answer from the wiki first.  
- High-value answers can be filed back as new wiki pages.

**On Lint**  
- Periodically run health checks (contradictions, orphans, stale claims, etc.).

**File Naming**  
- Use kebab-case for page files (e.g. llm-wiki-pattern.md).  
- Keep everything in Markdown.
