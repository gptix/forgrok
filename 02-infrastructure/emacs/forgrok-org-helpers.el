;;; forgrok-org-helpers.el --- Org-roam finalize + place + ID + DB + git helpers -*- lexical-binding: t; -*-

(require 'org)
(require 'org-id)
(require 'org-roam)
(require 'magit nil t)

(defconst my/forgrok-repo-root (expand-file-name "~/local-side/")
  "Canonical working copy root of the forgrok knowledge base.")

(defun my/--extract-keyword (keyword &optional delete)
  "Extract value of a top-level #+KEYWORD: line.
If DELETE is non-nil, remove the line. Return the trimmed value or nil."
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward
           (format "^[ \t]*#\\+%s:[ \t]*\\(.*\\)$" (upcase keyword))
           nil t)
      (let ((val (string-trim (match-string 1))))
        (when delete
          (delete-region (line-beginning-position)
                         (min (point-max) (1+ (line-end-position)))))
        (if (string-empty-p val) nil val)))))

(defun my/org-roam-finalize-place-id-commit (&optional dry-run)
  "Finalize the current Org buffer for the forgrok knowledge base.

Expects two temporary keywords near the top of the buffer:

  #+PROPOSED_PATH: 02-infrastructure/tools/SomeNodeName.org
  #+COMMIT_MSG: Short commit message

With a prefix argument (C-u) perform a dry-run only: show what would
happen and leave the buffer untouched.

On a normal call:
1. Extract the two keywords (they are removed only after confirmation).
2. Show a confirmation dialog with the final path and commit message.
3. Ensure the target directory exists and write/move the file.
4. Ensure a file-level :ID: exists.
5. Save and update the org-roam DB for this file.
6. Stage and commit (does NOT push).

Signals an error if the keywords are missing or the buffer is not Org."
(interactive "P")
(unless (derived-mode-p 'org-mode)
  (org-mode))

  (let* ((proposed-path (my/--extract-keyword "PROPOSED_PATH"))
         (commit-msg    (my/--extract-keyword "COMMIT_MSG"))
         (full-path     (and proposed-path
                             (expand-file-name proposed-path my/forgrok-repo-root)))
         (rel-path      proposed-path))

    (unless proposed-path
      (user-error "Missing #+PROPOSED_PATH: keyword"))
    (unless commit-msg
      (user-error "Missing #+COMMIT_MSG: keyword"))
    (unless (string-suffix-p ".org" proposed-path t)
      (user-error "PROPOSED_PATH must end in .org"))

;; Cleaner dry-run restructure ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; Dry-run path – just report and stop
    (if dry-run
        (message "DRY-RUN\n  Would place at: %s\n  Commit msg: %s\n  (buffer left unchanged)"
                 full-path commit-msg)

      ;; ── Real run ────────────────────────────────────────────────────────
      ;; Confirmation
      (unless (yes-or-no-p
               (format "Finalize and commit?\n  Path: %s\n  Msg:  %s\n"
                       full-path commit-msg))
        (user-error "Aborted by user"))

      ;; Now remove the temporary keywords
      (my/--extract-keyword "PROPOSED_PATH" t)
      (my/--extract-keyword "COMMIT_MSG" t)

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

      ;; Optional extra safety (especially useful on first creation of a new node):
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'forgrok-org-helpers)
