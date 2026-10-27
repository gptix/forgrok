;;; porch-pumpkins-promote-lakewood-images.el --- Copy keepers to pretty names -*- lexical-binding: t; -*-
;;
;; Lakewood 2026-09-24 keepers → local-only/images + minisite/site/images
;; Copies. Does not delete the camera files.
;;
;; Load:
;;   M-x load-file  RET  .../porch-pumpkins-promote-lakewood-images.el
;; Then:
;;   M-x porch-pumpkins-promote-lakewood-images
;; Dry run first:
;;   M-x porch-pumpkins-promote-lakewood-images-dry-run

(require 'cl-lib)

(defgroup porch-pumpkins-images nil
  "Promote Lakewood keeper photos to catalog pretty names."
  :group 'files)

(defcustom porch-pumpkins-root
  (expand-file-name "~/local-side/03-projects/porch-pumpkins")
  "Project root on the canonical T470s working copy."
  :type 'directory
  :group 'porch-pumpkins-images)

(defcustom porch-pumpkins-keepers-dir
  (expand-file-name "local-only/market-2026-09-24/keepers" porch-pumpkins-root)
  "Directory of camera-named keepers."
  :type 'directory
  :group 'porch-pumpkins-images)

(defcustom porch-pumpkins-local-images-dir
  (expand-file-name "local-only/images" porch-pumpkins-root)
  "Canonical pretty-name store. Gitignored."
  :type 'directory
  :group 'porch-pumpkins-images)

(defcustom porch-pumpkins-site-images-dir
  (expand-file-name "varietal-minisite/site/images" porch-pumpkins-root)
  "Minisite images dir. Desk reads ./images/{pretty}."
  :type 'directory
  :group 'porch-pumpkins-images)

(defcustom porch-pumpkins-overwrite nil
  "If non-nil, overwrite an existing pretty file."
  :type 'boolean
  :group 'porch-pumpkins-images)

;; slug is catalog id; pretty must match existing local_image basename.
(defconst porch-pumpkins-lakewood-bindings
  '(("fireball"            "20260924_102133.jpg" "fireball.jpg")
    ("jarrahdale"          "20260924_101223.jpg" "jarrahdale.jpg")
    ("hay-bale"            "20260924_100648.jpg" "hay-bale.jpg")
    ("corn-stalks"         "20260924_100702.jpg" "corn-stalks.jpg")
    ("mini-tiger-stripe"   "20260924_100657.jpg" "mini-tiger-stripe.jpg")
    ("gladiator"           "20260924_101012.jpg" "gladiator.jpg")
    ("casperia"            "20260924_102024.jpg" "casperia.jpg")
    ("flat-white-stacker"  "20260924_102042.jpg" "flat-white-stacker.jpg")
    ("porcelain-doll"      "20260924_102110.jpg" "porcelain-doll.jpg")
    ("peanut-squash"       "20260924_102427.jpg" "peanut-squash.jpg")
    ("field-trip"          "20260924_102126.jpg" "field-trip.jpg")
    ("white-blanco"        "20260924_102117.jpg" "white-blanco.jpg"))
  "List of (slug ugly pretty). Slugs match varietals.json.")

(defun porch-pumpkins--copy-one (src dest dry)
  "Copy SRC to DEST. Return a status symbol."
  (cond
   ((not (file-exists-p src)) 'missing-src)
   ((and (file-exists-p dest) (not porch-pumpkins-overwrite)) 'exists)
   (dry 'would-copy)
   (t
    (make-directory (file-name-directory dest) t)
    (copy-file src dest t t)
    'copied)))

(defun porch-pumpkins--promote (dry)
  (let ((lines '("slug | ugly | pretty | local-only | site")))
    (dolist (row porch-pumpkins-lakewood-bindings)
      (cl-destructuring-bind (slug ugly pretty) row
        (let* ((src (expand-file-name ugly porch-pumpkins-keepers-dir))
               (dst-local (expand-file-name pretty porch-pumpkins-local-images-dir))
               (dst-site (expand-file-name pretty porch-pumpkins-site-images-dir))
               (a (porch-pumpkins--copy-one src dst-local dry))
               (b (porch-pumpkins--copy-one src dst-site dry)))
          (push (format "%s | %s | %s | %s | %s" slug ugly pretty a b) lines))))
    (with-current-buffer (get-buffer-create "*porch-pumpkins-images*")
      (let ((inhibit-read-only t))
        (erase-buffer)
        (insert (if dry "DRY RUN — no files written\n\n" "PROMOTE — copies written\n\n"))
        (insert "keepers: " porch-pumpkins-keepers-dir "\n")
        (insert "local:   " porch-pumpkins-local-images-dir "\n")
        (insert "site:    " porch-pumpkins-site-images-dir "\n\n")
        (insert (mapconcat #'identity (nreverse lines) "\n"))
        (insert "\n\nmissing-src = keeper not found at that path\n")
        (insert "exists      = pretty name already there (set porch-pumpkins-overwrite to replace)\n")
        (insert "copied      = wrote the pretty file\n")
        (insert "would-copy  = dry-run would write\n")
        (goto-char (point-min))
        (special-mode))
      (display-buffer (current-buffer)))))

;;;###autoload
(defun porch-pumpkins-promote-lakewood-images-dry-run ()
  "Show what would be copied. Writes nothing."
  (interactive)
  (porch-pumpkins--promote t))

;;;###autoload
(defun porch-pumpkins-promote-lakewood-images ()
  "Copy the 12 Lakewood keepers to pretty names in local-only and the minisite."
  (interactive)
  (unless (file-directory-p porch-pumpkins-keepers-dir)
    (user-error "Keepers dir missing: %s" porch-pumpkins-keepers-dir))
  (porch-pumpkins--promote nil))

(provide 'porch-pumpkins-promote-lakewood-images)
;;; porch-pumpkins-promote-lakewood-images.el ends here
