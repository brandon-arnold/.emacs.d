(provide 'init-org)

(require 'sa-org-functions)
(require 'jt-org-split-time)

(defun concat-all (prefix-list suffix)
  "Concatenates all in prefix-list with suffix."
  (mapcar (function (lambda (prefix) (concat prefix suffix)))
          prefix-list))

(setq personal-dropbox-directory (file-name-as-directory "~/Dropbox"))
(setq work-directory-exists (f-exists-p "~/Dropbox (Facebook)"))
(if work-directory-exists
    (progn
      (setq work-dropbox-directory (file-name-as-directory "~/Dropbox (Facebook)"))
      (setq primary-dropbox-directory work-dropbox-directory)
      (setq dropbox-directories (list work-dropbox-directory personal-dropbox-directory))
      (setq org-agenda-text-search-extra-files
            (append
             (append (sa-find-org-file-recursively (concat work-dropbox-directory "Documents/EmacsOrg/agenda/")))
             (append (sa-find-org-file-recursively (concat personal-dropbox-directory "Documents/EmacsOrg/agenda/")))))
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
                      (org-agenda-start-with-clockreport-mode t))))))
(unless work-directory-exists
  (progn
    (setq primary-dropbox-directory personal-dropbox-directory)
    (setq dropbox-directories (list personal-dropbox-directory))
    (setq org-agenda-text-search-extra-files
          (append (sa-find-org-file-recursively (concat personal-dropbox-directory "Documents/EmacsOrg/agenda/"))))))

(use-package org
  :ensure t
  :mode ("\\.org\\(_archive\\)?\\(_[0-9]\\{6\\}\\)?\\'" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-," . org-cycle-agenda-files)
         ("C-c b" . org-iswitchb)
         ("C-c j" . org-clock-goto)
         ("C-c C-x C-o" . org-clock-out)
         ("C-c C-x C-r" . org-clock-report))
  :config
  (progn
    (org-super-agenda-mode)
    (setq org-agenda-clockreport-parameter-plist (plist-put org-agenda-clockreport-parameter-plist :fileskip0 t))
    (setq org-agenda-clockreport-parameter-plist (org-plist-delete org-agenda-clockreport-parameter-plist :link))
    (setq org-archive-location "%s_archive::")
    (setq org-directory (file-name-as-directory (concat primary-dropbox-directory "Documents/EmacsOrg")))
    (setq org-default-notes-file (concat org-directory "agenda/refile.org"))
    (setq org-agenda-files (concat-all dropbox-directories "Documents/EmacsOrg/agenda"))
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
    (setq org-capture-templates
          `(
            ;; ("r" "Refile Later" entry
            ;;  (file ,(concat work-dropbox-directory "Documents/EmacsOrg/agenda/refile.org"))
            ;;  "* %?\n  %a" :empty-lines 1)
            ;; ("f" "Uncategorized Work TODO" entry
            ;;  (file+headline ,(concat work-dropbox-directory "Documents/EmacsOrg/agenda/facebook.org") "Uncategorized")
            ;;  "** TODO %?\n  %i\n  %a")
            ("p" "Uncategorized Personal TODO" entry
             (file+headline ,(concat personal-dropbox-directory "Documents/EmacsOrg/agenda/personal.org") "Uncategorized")
             "** TODO %?\n  %i\n  %a")
            ;; ("c" "Computing Notes" entry
            ;;  (file+olp+datetree ,(concat work-dropbox-directory "Documents/EmacsOrg/agenda/computing.org"))
            ;;  "* %?\nEntered on %U\n  %i\n  %a")
            ;; ("1" "Work Daily Goals" entry
            ;;  (file+olp+datetree ,(concat work-dropbox-directory "Documents/EmacsOrg/agenda/fb-daily.org"))
            ;;  "* %?\nEntered on %U\n%[~/.emacs.d/lisp/org-capture-templates/daily.txt]")
            ;; ("2" "Work Weekly Goals" entry
            ;;  (file+olp+datetree ,(concat work-dropbox-directory "Documents/EmacsOrg/agenda/fb-weekly.org"))
            ;;  "* %?\nEntered on %U\n%[~/.emacs.d/lisp/org-capture-templates/weekly.txt]" :tree-type week)
            ;; ("3" "Work Monthly Goals" entry
            ;;  (file+olp+datetree ,(concat work-dropbox-directory "Documents/EmacsOrg/agenda/fb-monthly.org"))
            ;;  "* %?\nEntered on %U\n  %i\n" :tree-type month)
            ("4" "Personal Daily Goals" entry
             (file+olp+datetree ,(concat personal-dropbox-directory "Documents/EmacsOrg/agenda/p-daily.org"))
             "* %?\nEntered on %U\n%[~/.emacs.d/lisp/org-capture-templates/daily.txt]")
            ("5" "Personal Weekly Goals" entry
             (file+olp+datetree ,(concat personal-dropbox-directory "Documents/EmacsOrg/agenda/p-weekly.org"))
             "* %?\nEntered on %U\n%[~/.emacs.d/lisp/org-capture-templates/weekly.txt]" :tree-type week)
            ("6" "Personal Monthly Goals" entry
             (file+olp+datetree ,(concat personal-dropbox-directory "Documents/EmacsOrg/agenda/p-monthly.org"))
             "* %?\nEntered on %U\n  %i\n" :tree-type month)
            ("7" "Personal Journal/Capture" entry
             (file+olp+datetree ,(concat personal-dropbox-directory "Documents/EmacsOrg/agenda/journal.org"))
             "* %?\n  Entered on %U\n  %i\n  %a")))))

(use-package org-archive
  :config
  (progn
    (setq org-archive-paths (directory-files-recursively (concat personal-dropbox-directory "Documents/EmacsOrg/agenda/archive") "[.]org_archive$"))
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

(use-package org-crypt
  :after (org)
  :config
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  (setq org-crypt-key nil)
  (setq auto-save-default nil))

(use-package ox-md
  :after (org))

(use-package org-projectile
  :bind (("C-c n p" . org-projectile-project-todo-completing-read))
  :config
  (progn
    (setq org-projectile-projects-file
          (concat dropbox-directory "Documents/EmacsOrg/agenda/projects.org"))
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates)))

(if (eq system-type 'windows-nt)
    (setq markdown-open-command "C:\\Program Files (x86)\\MarkdownPad 2\\MarkdownPad2.exe"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (js . t)))

