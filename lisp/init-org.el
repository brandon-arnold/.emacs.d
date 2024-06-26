(provide 'init-org)

(require 'sa-org-functions)
(require 'jt-org-split-time)

(defun concat-all (prefix-list suffix)
  "Concatenates all in prefix-list with suffix."
  (mapcar (function (lambda (prefix) (concat prefix suffix)))
          prefix-list))

(setq org-agenda-text-search-extra-files
      (append (sa-find-org-file-recursively (concat dropbox-directory "Documents/EmacsOrg/agenda/"))))

(use-package org
  :ensure t
  :mode ("\\.org\\(_archive\\)?\\(_[0-9]\\{6\\}\\)?\\'" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-," . org-cycle-agenda-files)
         ("C-c b" . org-switchb)
         ("C-c j" . org-clock-goto)
         ("C-c C-x C-o" . org-clock-out)
         ("C-c C-x C-r" . org-clock-report))
  :config
  (progn
    (org-super-agenda-mode)
    (setq org-catch-invisible-edits 'show-and-error)
    (setq org-agenda-clockreport-parameter-plist (plist-put org-agenda-clockreport-parameter-plist :fileskip0 t))
    (setq org-agenda-clockreport-parameter-plist (org-plist-delete org-agenda-clockreport-parameter-plist :link))
    (setq org-archive-location "%s_archive::")
    (setq org-directory (file-name-as-directory (concat dropbox-directory "Documents/EmacsOrg")))
    (setq org-default-notes-file (concat org-directory "agenda/refile.org"))
    (setq org-agenda-files (concat-all (list dropbox-directory) "Documents/EmacsOrg/agenda"))
    (setq org-agenda-window-setup 'only-window)
    (setq org-catch-invisible-edits t)
    (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
    (setq org-refile-use-outline-path 'file)
    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-allow-creating-parent-nodes 'confirm)
    (setq org-clock-into-drawer "CLOCKING")
    (setq org-clock-idle-time 15)
    (setq org-log-done 'time)
    (org-clock-persistence-insinuate)
    (setq org-clock-in-resume t)
    (setq org-clock-out-remove-zero-time-clocks t)
    (setq org-clock-persist t)
    (setq org-clock-persist-query-resume nil)
    (setq org-agenda-span 'day)
    (setq org-link-file-path-type 'relative)
    (add-to-list 'org-agenda-custom-commands
                 '("W" "Weekly review"
                   agenda ""
                   ((org-agenda-span 'week)
                    (org-agenda-start-on-weekday 0)
                    (org-agenda-start-with-log-mode t)
                    (org-agenda-skip-function
                     '(org-agenda-skip-entry-if 'nottodo 'done)))))
    (add-to-list 'org-agenda-custom-commands
                 '("D" "EOD"
                   agenda ""
                   ((org-agenda-span 'day)
                    (org-agenda-start-with-log-mode t)
                    (org-agenda-skip-function
                     '(org-agenda-skip-entry-if 'nottodo 'done))
                    (org-agenda-start-with-clockreport-mode t)))))
  (setq org-capture-templates
        `(("r" "Refile Later" entry
           (file ,(concat dropbox-directory "Documents/EmacsOrg/agenda/inbox.org"))
           "* %?\n  " :empty-lines 1)
          ("f" "Uncategorized Work TODO" entry
           (file+headline ,(concat dropbox-directory "Documents/EmacsOrg/agenda/facebook.org") "Uncategorized")
           "** TODO %?\n  ")
          ("p" "Uncategorized Personal TODO" entry
           (file+headline ,(concat dropbox-directory "Documents/EmacsOrg/agenda/personal.org") "Uncategorized")
           "** TODO %?\n  ")
          ("w" "Work Computing Notes" entry
           (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/journal/fb-computing.org"))
           "* %?\nEntered on %U\n  %i\n  %a")
          ("m" "Work Discussion" entry
           (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/journal/fb-discussion.org"))
           "* %?\n  Entered on %U\n  ")
          ("c" "Personal Computing Notes" entry
           (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/journal/computing.org"))
           "* %?\nEntered on %U\n  %i\n  %a")
          ("1" "Work Daily Journal" entry
           (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/journal/fb-daily.org"))
           "* %?\nEntered on %U\n%[~/.emacs.d/lisp/org-capture-templates/daily.txt]")
          ("2" "Work Weekly Goals" entry
           (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/journal/fb-weekly.org"))
           "* %?\nEntered on %U\n%[~/.emacs.d/lisp/org-capture-templates/weekly.txt]" :tree-type week)
          ("3" "Work Monthly Goals" entry
           (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/journal/fb-monthly.org"))
           "* %?\nEntered on %U\n  %i\n" :tree-type month)
          ("4" "Personal Daily Journal" entry
           (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/journal/p-daily.org"))
           "* %?\nEntered on %U\n%[~/.eqmacs.d/lisp/org-capture-templates/daily.txt]")
          ("5" "Personal Weekly Goals" entry
           (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/journal/p-weekly.org"))
           "* %?\nEntered on %U\n%[~/.emacs.d/lisp/org-capture-templates/weekly.txt]" :tree-type week)
          ("6" "Personal Monthly Goals" entry
           (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/journal/p-monthly.org"))
           "* %?\nEntered on %U\n  %i\n" :tree-type month))))

(use-package org-archive
  :config
  (progn
    (setq org-archive-paths (directory-files-recursively (concat dropbox-directory "Documents/EmacsOrg/agenda/archive") "[.]org_archive$"))
    (defun org-add-archive-files-from-agenda-files (files)
      "Splice the archive files into the list of files.
This implies visiting all these files and finding out what the
archive file is."
      (apply
       'append
       (mapcar
        (lambda (f)
          (if (not (file-exists-p f))
	      nil
	    (with-current-buffer (org-get-agenda-file-buffer f)
	      (cons f (org-all-archive-files)))))
        files)))    
    (defun org-add-archive-files (agenda-files)
      "Splice the archive files into the agenda files by visiting
each agenda file and finding out all the corresponding archive files
for it. If matching filenames exist in org-archive-paths, include those,
too."
      (org-uniquify
       (apply
        'append
        (mapcar
         (lambda (file)
           (cons file
                 (seq-filter
                  (lambda (path) (equal (file-name-nondirectory file) (file-name-nondirectory path)))
                  org-archive-paths)))
         (org-add-archive-files-from-agenda-files agenda-files)))))
    ))

;; (use-package org-tempo
;;   :after (org))

;; (use-package org-crypt
;;   :after (org)
;;   :config
;;   (org-crypt-use-before-save-magic)
;;   (setq org-tags-exclude-from-inheritance (quote ("crypt")))
;;   (setq org-crypt-key nil)
;;   (setq auto-save-default nil))

;; (use-package ox-md
;;   :after (org))

;; (use-package org-projectile
;;   :bind (("C-c n p" . org-projectile-project-todo-completing-read))
;;   :config
;;   (progn
;;     (setq org-projectile-projects-file
;;           (concat dropbox-directory "Documents/EmacsOrg/agenda/projects.org"))
;;     (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
;;     (push (org-projectile-project-todo-entry) org-capture-templates)))

;; (if (eq system-type 'windows-nt)
;;     (setq markdown-open-command "C:\\Program Files (x86)\\MarkdownPad 2\\MarkdownPad2.exe"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (js . t)
   (shell . t)))

;; (use-package org-roam
;;   :ensure t
;;   :after (org)
;;   :hook
;;   (after-init . org-roam-mode)
;;   :init
;;   (if (memq window-system '(mac ns))
;;       (setq org-roam-graph-viewer "/usr/bin/open")
;;     (setq org-roam-graph-viewer "google-chrome-stable"))
;;   (setq org-roam-index-file "20201201230242-index.org")
;;   ;; See Graphviz docs here:
;;   ;;  https://graphviz.org/doc/info/attrs.html
;;   ;; and related roam graph config doc here:
;;   ;;  https://www.orgroam.com/manual.html#Graph-Options
;;   (setq org-roam-graph-extra-config '(("rankdir" . "RL")))
;;   (setq org-roam-graph-node-extra-config
;;         '(("color" . "black")
;;           ("fillcolor" . "lightgrey")
;;           ("style" . "filled")
;;           ("shape" . "box")))
;;   (setq org-roam-graph-edge-extra-config '(("dir" . "back")))
;;   (setq org-roam-graph-edge-cites-extra-config '(("color" . "red")))
;;   (setq org-roam-db-location "~/temp/org-roam.db")
;;   (setq org-roam-dailies-directory "daily/")
;;   ;; (concat dropbox-directory "Documents/EmacsOrg/roam/daily")
;;   (setq org-roam-dailies-capture-templates
;;    `(("d" "default" entry
;;       #'org-roam-capture--get-point
;;       "* %?"
;;       :file-name "daily/%<%Y-%m-%d>"
;;       :head "#+title: %<%Y-%m-%d>\n\n")))
;;   :config
;;   (require 'org-roam-protocol)
;;   :custom
;;   (org-roam-directory (concat dropbox-directory "Documents/EmacsOrg/roam"))
;;   :bind (("C-c n z" . org-roam-jump-to-index)
;;          :map org-roam-mode-map
;;          (("C-c n l" . org-roam)
;;           ("C-c n f" . org-roam-find-file)
;;           ("C-c n g" . org-roam-graph-show)
;;           ("C-c n c" . org-roam-dailies-capture-today)
;;           ("C-c n d" . org-roam-dailies-capture-date))
;;          :map org-mode-map
;;          (("C-c n i" . org-roam-insert)
;;           ("C-c n I" . org-roam-insert-immediate))
;;          ))

;; (defun my-org-protocol-focus-advice (orig &rest args)
;;   (x-focus-frame nil)
;;   (apply orig args))

;; (advice-add 'org-roam-protocol-open-ref :around
;;             #'my-org-protocol-focus-advice)
;; (advice-add 'org-roam-protocol-open-file :around
;;             #'my-org-protocol-focus-advice)

;; (setq bibtex-completion-bibliography
;;       `(,(concat dropbox-directory "Documents/EmacsOrg/roam/ref/default.bib")
;;         ,(concat dropbox-directory "Documents/EmacsOrg/roam/ref/zotero.bib"))
;;       bibtex-completion-library-path "~/temp/pdf"
;;       bibtex-completion-notes-path "~/Dropbox/Documents/EmacsOrg/ref-notes")


;; ;; ivy-bibtex for looking up and bibs and opening the corresponding URI/PDF
;; (autoload 'ivy-bibtex "ivy-bibtex" "" t)
;; (setq ivy-re-builders-alist
;;       '((ivy-bibtex . ivy--regex-ignore-order)
;;         (t . ivy--regex-plus)))

;; (use-package org-ref
;;   :ensure t
;;   :config
;;   (progn
;;     (setq reftex-default-bibliography
;;           `(,(concat dropbox-directory "Documents/EmacsOrg/roam/ref/default.bib")
;;             ,(concat dropbox-directory "Documents/EmacsOrg/roam/ref/zotero.bib")))
;;     (setq org-ref-default-bibliography
;;           `(,(concat dropbox-directory "Documents/EmacsOrg/roam/ref/default.bib")
;;             ,(concat dropbox-directory "Documents/EmacsOrg/roam/ref/zotero.bib"))
;;           org-ref-bibliography-notes (concat dropbox-directory "Documents/EmacsOrg/roam/ref-notes/default.org")
;;           org-ref-pdf-directory "~/temp/pdf")
;;     ))

;; (use-package org-roam-bibtex
;;   :hook (org-roam-mode . org-roam-bibtex-mode)
;;   :bind (:map org-mode-map
;;               (("C-c ) a" . orb-note-actions)
;;                ("C-c ) i" . orb-insert)))
;;   :config
;;   (progn
;;     (setq orb-note-actions-interface 'hydra))
;;   :custom
;;   (orb-templates
;;       '(("r" "ref" plain (function org-roam-capture--get-point) "%?"
;;          :file-name "ref-notes/${citekey}"
;;          :head "#+TITLE: ${title}\n#+ROAM_KEY: ${ref}\n#+CREATED: %U\n#+EDITED: %U\n#+ROAM_TAGS: \n* Notes on ${citekey}\n :PROPERTIES:\n :Custom_ID:  ${citekey}\n :END:\n"
;;         :unnarrowed t
;;         :immediate-finish t))))
