;;; forgrok-org-helpers.el --- Helpers for finalizing org-roam nodes in the forgrok knowledge base -*- lexical-binding: t; -*-

;;; Commentary:
;; Provides my/org-roam-finalize-place-id-commit and supporting helpers.
;; Used to turn temporary draft nodes (with #+PROPOSED_PATH / #+COMMIT_MSG)
;; into permanent org-roam files with IDs, correct location, and a git commit.

;;; Code:

(defvar my/forgrok-repo-root
  (expand-file-name "~/local-side/")
  "Absolute path to the root of the forgrok / Tsuioku repository.
Adjust this if your canonical working copy lives elsewhere.")

(defun my/--extract-keyword (keyword)
  "Extract the value of #+KEYWORD: from the current buffer.

KEYWORD should be the name without the leading '#+' (e.g. \"PROPOSED_PATH\").

Handles:
- Leading/trailing whitespace
- Case-insensitive matching of the keyword
- Values that continue on subsequent lines (until the next #+KEYWORD or blank line)
- Returns nil if the keyword is not found

The search is limited to the first 200 lines of the buffer for safety."
  (save-excursion
    (goto-char (point-min))
    (let ((case-fold-search t)          ; case-insensitive
          (limit (save-excursion
                   (forward-line 200)
                   (point)))
          (re (format "^#\\+%s:[ \t]*\\(.*\\)$" (regexp-quote keyword))))
      (when (re-search-forward re limit t)
        (let ((value (match-string-no-properties 1))
              (start (match-end 0)))
          ;; Collect continuation lines (non-blank, non-keyword lines)
          (goto-char start)
          (while (and (not (eobp))
                      (looking-at-p "^[ \t]*\\([^#[:space:]].*\\)$"))
            (setq value (concat value " " (match-string-no-properties 1)))
            (forward-line 1))
          (string-trim value))))))

(defun my/org-roam-finalize-place-id-commit (&optional dry-run)
  "Finalize the current Org buffer for the forgrok knowledge base.

Expects these keywords near the top of the buffer:

  #+PROPOSED_PATH: 02-infrastructure/tools/SomeNodeName.org
  #+COMMIT_MSG: Short commit message
  #+EXECUTIVE_SUMMARY: One-paragraph summary of the node (recommended)

Also expects the standard instructional block ending with the sentinel line:

  ############ THIS LINE AND ALL ABOVE WILL BE DELETED, WITH NEW :PROPERTIES: DRAWER STARTING AT VERY BEGINNING OF FILE ###################

With a prefix argument (C-u) perform a dry-run only: show what would
happen and leave the buffer untouched.

On a normal call:
1. Extract the temporary keywords.
2. Show a confirmation dialog with path, commit message, and executive summary.
3. Delete the temporary headers + entire instructional block (up to and including the sentinel).
4. Ensure the target directory exists and write/move the file.
5. Ensure a file-level :ID: exists.
6. Save and update the org-roam DB for this file.
7. Stage and commit (does NOT push).

Signals an error if the required keywords are missing or the buffer is not Org."
  (interactive "P")
  (unless (derived-mode-p 'org-mode)
    (org-mode))

  (let* ((proposed-path (my/--extract-keyword "PROPOSED_PATH"))
         (commit-msg    (my/--extract-keyword "COMMIT_MSG"))
         (exec-summary  (my/--extract-keyword "EXECUTIVE_SUMMARY")) ; kept, not deleted
         (full-path     (and proposed-path
                             (expand-file-name proposed-path my/forgrok-repo-root)))
         (rel-path      proposed-path))

    (unless proposed-path
      (user-error "Missing #+PROPOSED_PATH: keyword"))
    (unless commit-msg
      (user-error "Missing #+COMMIT_MSG: keyword"))
    (unless (string-suffix-p ".org" proposed-path t)
      (user-error "PROPOSED_PATH must end in .org"))

    ;; Dry-run path
    (if dry-run
        (message "DRY-RUN\n  Would place at: %s\n  Commit msg: %s\n  Executive summary: %s\n  (buffer left unchanged)"
                 full-path commit-msg (or exec-summary "(none)"))

      ;; Confirmation – includes executive summary
      (unless (yes-or-no-p
               (format "Finalize and commit?\n  Path: %s\n  Msg:  %s\n  Summary: %s\n"
                       full-path commit-msg (or exec-summary "(none)")))
        (user-error "Aborted by user"))

      ;; ---------------------------------------------------------------
      ;; Delete temporary headers + entire instructional block
      ;; Everything from point-min up to and including the sentinel line
      ;; ---------------------------------------------------------------
      (goto-char (point-min))
      (when (re-search-forward
             "^############ THIS LINE AND ALL ABOVE WILL BE DELETED.*$"
             nil t)
        (delete-region (point-min) (min (point-max) (1+ (line-end-position)))))

      ;; Ensure parent directory
      (make-directory (file-name-directory full-path) t)

      ;; Write / move
      (let ((current (buffer-file-name)))
        (cond
         ((null current)
          (write-file full-path))
         ((not (string-equal (expand-file-name current) full-path))
          (write-file full-path))
         (t
          (save-buffer))))

      ;; Guarantee file-level ID (must be at the very top of the file)
      (goto-char (point-min))
      (org-id-get-create)
      (save-buffer)

      ;; Update roam DB
      (if (fboundp 'org-roam-db-update-file)
          (org-roam-db-update-file)
        (org-roam-db-sync))
      (org-roam-db-sync)

      ;; Stage + commit
      (let ((default-directory my/forgrok-repo-root))
        (cond
         ((fboundp 'magit-run-git)
          (magit-run-git "add" rel-path)
          (magit-run-git "commit" "-m" commit-msg))
         (t
          (call-process "git" nil nil nil "add" rel-path)
          (call-process "git" nil nil nil "commit" "-m" commit-msg))))

      (message "Finalized → %s | ID ready | DB updated | committed (push manually)"
               proposed-path))))

(provide 'forgrok-org-helpers)
;;; forgrok-org-helpers.el ends here
