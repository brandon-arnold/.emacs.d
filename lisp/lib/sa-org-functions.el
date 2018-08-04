(provide 'sa-org-functions)

(defun sa-org-table-cell-to-left ()
  "Move current field in row to the left."
  (interactive)
  (sa-org-table-cell-transpose-horizontal 'left))

(defun sa-org-table-cell-to-right ()
  "Move current field in row to the right."
  (interactive)
  (sa-org-table-cell-transpose-horizontal nil))

(defun sa-org-table-cell-transpose-horizontal (&optional left)
  "Move current field in row to the right.
  With arg LEFT, move to the left.  For repeated invocation the
  point follows the moved field.  Does not fix formulas."
  ;; Derived from `org-table-move-column'
  (interactive "P")
  (if (not (org-at-table-p))
      (error "Not at a table"))
  (org-table-find-dataline)
  (org-table-check-inside-data-field)
  (let* ((col (org-table-current-column))
	 (col1 (if left (1- col) col))
	 ;; Current cursor position
	 (colpos (if left (1- col) (1+ col))))
    (if (and left (= col 1))
	(error "Cannot move column further left"))
    (if (and (not left) (looking-at "[^|\n]*|[^|\n]*$"))
	(error "Cannot move column further right"))
    (org-table-goto-column col1 t)
    (and (looking-at "|\\([^|\n]+\\)|\\([^|\n]+\\)|")
	 (replace-match "|\\2|\\1|"))
    (org-table-goto-column colpos)
    (org-table-align)))

(defun sa-org-table-rotate-rest-of-row-left ()
  "Rotate rest of row to the left."
  (interactive)
  (sa-org-table-rotate-rest-of-row 'left))

(defun sa-org-table-rotate-rest-of-row-right ()
  "Rotate rest of row to the right."
  (interactive)
  (sa-org-table-rotate-rest-of-row nil))

(defun sa-org-table-rotate-rest-of-row (&optional left)
  "Rotate rest of row to the right.
  With arg LEFT, rotate to the left.  For both directions the
  boundaries of the rotation range are the current field and the
  field at the end of the row.  For repeated invocation the point
  stays on the original current field.  Does not fix formulas."
  ;; Derived from `org-table-move-column'
  (interactive "P")
  (if (not (org-at-table-p))
      (error "Not at a table"))
  (org-table-find-dataline)
  (org-table-check-inside-data-field)
  (let ((col (org-table-current-column)))
    (org-table-goto-column col t)
    (and (looking-at (if left
			 "|\\([^|\n]+\\)|\\([^\n]+\\)|$"
		       "|\\([^\n]+\\)|\\([^|\n]+\\)|$"))
	 (replace-match "|\\2|\\1|"))
    (org-table-goto-column col)
    (org-table-align)))

(defun sa-org-table-open-cell-horizontal ()
  "Open field in row, move fields to the right by growing table."
  (interactive)
  (insert "|")
  (backward-char)
  (org-table-align))

(defun sa-org-table-open-cell-vertical ()
  "Open field in column, move all fields downwards by growing table."
  (interactive)
  (let ((col (org-table-current-column))
	(p   (point)))
    ;; Cut all fields downwards in same column
    (goto-char (org-table-end))
    (forward-line -1)
    (while (org-at-table-hline-p) (forward-line -1))
    (org-table-goto-column col)
    (org-table-cut-region p (point))
    ;; Paste at one field below
    (goto-char p)
    (forward-line)
    (org-table-goto-column col)
    (org-table-paste-rectangle)
    (goto-char p)
    (org-table-align)))

;; Source: Liam Healy on the org-mode mailing list
;; <http://mid.gmane.org/CADe9tL7xL8Oci9k4BsiOs_sH3b2N4ormAojDwJ1smF8J3yZGLA@mail.gmail.com>
(defun sa-org-datetree-goto-date (&optional siblings)
  "Go to and show the date in the date tree. With optional argument
SIBLINGS, on each level of the hierarchy all
siblings are shown. If no entry exists for the date, it will be created."
  (interactive "P")
  (let ((date (decode-time (org-read-date nil t))))
    (org-datetree-find-date-create (list (nth 4 date) (nth 3 date)
					 (nth 5 date))))
  (outline-show-heading)
  (show-subtree)
  (org-reveal siblings)
  (beginning-of-line))

;; Function to add custom based on headline
(defun sa-org-hl-to-custom-id ()
  "Generate and add custom id from headline text.

Ignores special characters except `_' and `-', and converts
spaces to `-'."
  (interactive)
  (let ((head (downcase (nth 4 (org-heading-components)))))
    (save-match-data
      (while (or (string-match " " head)
		 (string-match "[^a-zA-Z0-9_-]\+" head))
	(if (equal " " (match-string 0 head))
	    (set 'head (replace-match "-" nil t head))
	  (set 'head (replace-match "" nil t head)))))
    (org-set-property "CUSTOM_ID" head)))

;; Function to add duplicate org-mode properties
(defun sa-org-entry-put-dupe (pom property value)
  "Set PROPERTY to VALUE for entry at point-or-marker POM.

Original function: `org-entry-put'.

NB: Allows duplicate properties.  In case of duplicates, they are inserted
before the existing entry.  Use with caution."
  (org-with-point-at pom
    (org-back-to-heading t)
    (let ((beg (point)) (end (save-excursion (outline-next-heading) (point)))
	  range)
      (let ((buffer-invisibility-spec (org-inhibit-invisibility))) ; Emacs 21
	(setq range (org-get-property-block beg end 'force))
	(goto-char (car range))
	(progn
	  (if (re-search-forward
	       (org-re-property-keyword property) (cdr range) t)
	      (goto-char (match-beginning 0))
	    (goto-char (cdr range)))
	  (insert "\n")
	  (backward-char 1)
	  (org-indent-line))
	(insert ":" property ":")
	(and value (insert " " value))
	(org-indent-line)))
    (run-hook-with-args 'org-property-changed-functions property value)))
;; recursively find .org files in provided directory
;; modified from an Emacs Lisp Intro example
(defun sa-find-org-file-recursively (&optional directory filext)
  "Return .org and .org_archive files recursively from DIRECTORY.
If FILEXT is provided, return files with extension FILEXT instead."
  (interactive "DDirectory: ")
  (let* (org-file-list
	 (case-fold-search t)	      ; filesystems are case sensitive
	 (file-name-regex "^[^.#].*") ; exclude dot, autosave, and backup files
	 (filext (or filext "org$\\\|org_archive"))
	 (fileregex (format "%s\\.\\(%s$\\)" file-name-regex filext))
	 (cur-dir-list (directory-files directory t file-name-regex)))
    ;; loop over directory listing
    (dolist (file-or-dir cur-dir-list org-file-list) ; returns org-file-list
      (cond
       ((file-regular-p file-or-dir) ; regular files
	(if (string-match fileregex file-or-dir) ; org files
	    (add-to-list 'org-file-list file-or-dir)))
       ((file-directory-p file-or-dir)
	(dolist (org-file (sa-find-org-file-recursively file-or-dir filext)
			  org-file-list) ; add files found to result
	  (add-to-list 'org-file-list org-file)))))))
