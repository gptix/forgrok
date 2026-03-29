
# Table of Contents



1.  [Tsuioku Master Memory - Current State](#org4fb6e5f)
2.  [Voight-Kampff Full Cycle Checklist](#org9a37f9c)
3.  [End of Checklist](#org7cf175c)

<a id="org4fb6e5f"></a>

********Establishment Note********
We established this clean, up-to-date memory system on 26 March 2026. Last Voight-Kampff sync: 29 March 2026.

********Memory System Standards********

-   Dedicated local Git repo: ~/forgrok/
-   Authoritative file: joji-grok-project-memory.org (always at repo root)
-   Exported Markdown: grok-memory/exports/joji-grok-project-memory.md
-   .org file remains the single source of truth at all times.

********Honorific Rule********
When addressing the user (Captain), always capitalize “Captain” exactly as “Mr.” or “Mister” (per explicit instruction).

********Active Projects (updated 29 March 2026)********

-   Project 1: Tsuioku (追憶) – Housecleaning archived and complete
-   Project 2: Withnail – Hermes v0.4.0 autonomous CEO on hermes-pi  
    Status: Fully operational on Raspberry Pi 5 (Debian 13 trixie, aarch64). Skills fully mapped (25 categories including research, productivity, software-development, media, autonomous-ai-agents, etc.). ZHC Security Override permanently baked into SOUL.md. First local PDF synthesis completed on 2002.pdf using 4-step Knowledge Synthesis from 1952.pdf. Telegram + autonomous 10-minute CEO cycle active and 100% local/air-gapped.
-   Project 3: BrandCo – Low-cost Georgia Brand Consulting Company (seeded)
-   Project 4: Make BSV Transaction – SBCL tutorial fully integrated
-   Project 5: Build List of Interesting Videos – seeded and ready
-   Project 6: Gather High-Protein Content  
    Inspired by Brian Roemmele’s work on collecting High-Protein Content from libraries, laboratories, universities, retirees, and companies that have dissolved and released IP. Local cache on Pi now actively used.
-   Project 7: Knowledge Acquisition System  
    Automated pipeline that ingests a file (or pulls one over the network), then outputs: exact original copy + cover page (Précis + longer summary) + expandable nodes on key points.  
    Progress: Original workflow (weeks ago) recovered and compared side-by-side with Withnail’s live execution. Withnail has successfully run the first local test (Précis + 5–7 expandable nodes + concrete local ZHO suggestion). Ready for full reusable Python implementation.

<a id="org9a37f9c"></a>

********1. Preparation (Terminal)********

-   [ ] Open a terminal and \`cd\` into your local \`forgrok\` repository root directory
-   [ ] Confirm you are in the directory containing \`joji-grok-project-memory.org\` and the \`.git\` folder

********2. Update Authoritative Source (Emacs)********

-   [ ] Launch Emacs
-   [ ] Open the authoritative file:  
    \`joji-grok-project-memory.org\`

********3. Edit the Master Memory********

-   [ ] Add / update all new content from the current chat (new projects, notes, summaries, etc.)
-   [ ] Save the file (\`C-x C-s\`)

********4. Export to Markdown (Emacs)********

-   [ ] Run the export command:  
    \`M-x org-md-export-to-markdown\`  
    (or \`M-x org-export-dispatch\` then choose Markdown)
-   [ ] Confirm the exported file has been overwritten at:  
    \`grok-memory/exports/joji-grok-project-memory.md\`

********5. Cleanup Backup Files (Terminal)********

-   [ ] Remove all Emacs tilde backup files:  
    \`find . -name "\*~" -delete\`

********6. Stage Changes (Terminal)********

-   [ ] Stage the updated files:  
    \`git add joji-grok-project-memory.org grok-memory/exports/joji-grok-project-memory.md .gitignore\`

********7. Commit Changes (Terminal)********

-   [ ] Commit with a clear message:  
    \`git commit -m "Tsuioku: Voight-Kampff sync — checklist + new projects added"\`

********8. Push to GitHub (Terminal)********

-   [ ] Push to the remote:  
    \`git push origin main\`

********9. Verify on GitHub********

-   [ ] Refresh <https://github.com/gptix/forgrok> and confirm both the \`.org\` and the exported \`.md\` contain the latest changes

********10. Start New Web-Based Chat Session********

-   [ ] Open a completely ****new**** web-based Grok chat (do not continue this thread)
-   [ ] Type this exact prompt:  
    \`Hello, Grok! Please receive the attachment, and follow instructions therein.\`
-   [ ] Attach the freshly exported file:  
    \`grok-memory/exports/joji-grok-project-memory.md\`

<a id="org7cf175c"></a>

Once step 10 is complete, the new chat will load the fully-synced memory and we will continue from there, Captain.

