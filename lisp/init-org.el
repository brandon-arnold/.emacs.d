(provide 'init-org)

(require 'sa-org-functions)
;(require 'jt/org-split-time)

(if (eq system-type 'windows-nt)
    (setq dropbox-directory (file-name-as-directory "~/Dropbox (Personal)"))
  (setq dropbox-directory (file-name-as-directory "~/Dropbox")))

(use-package org
  :ensure t
  :mode ("\\.org\\(_archive\\)?\\'" . org-mode)
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
    (setq org-directory (file-name-as-directory (concat dropbox-directory "Documents/EmacsOrg")))
    (setq org-default-notes-file (concat org-directory "agenda/captured-default.org"))
    (setq org-agenda-files (list (concat dropbox-directory "Documents/EmacsOrg/agenda")))
    (setq org-agenda-window-setup 'only-window)
    (setq org-catch-invisible-edits t)
    (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
    (setq org-refile-use-outline-path 'file)
    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-allow-creating-parent-nodes 'confirm)
    (setq org-clock-into-drawer "CLOCKING")
    (setq org-log-done 'time)
    (setq org-agenda-text-search-extra-files
          (append
           (sa-find-org-file-recursively "~/Dropbox/Documents/EmacsOrg/agenda/" ".org_archive")
           ))
    (add-to-list 'org-agenda-custom-commands
             '("W" "Weekly review"
               agenda ""
               ((org-agenda-span 'week)
                (org-agenda-start-on-weekday 0)
                (org-agenda-start-with-log-mode t)
                (org-agenda-skip-function
                 '(org-agenda-skip-entry-if 'nottodo 'done))
                )))
    (add-to-list 'org-agenda-custom-commands
             '("D" "EOD"
               agenda ""
               ((org-agenda-span 'day)
                (org-agenda-start-with-log-mode t)
                (org-agenda-skip-function
                 '(org-agenda-skip-entry-if 'nottodo 'done))
                (org-agenda-start-with-clockreport-mode t)
                )))
    (setq org-capture-templates
      `(("t" "Personal Task" entry
         (file+headline ,(concat dropbox-directory "Documents/EmacsOrg/agenda/rand-personal.org") "Personal Tasks")
         "* TODO %?" :empty-lines 1)
        ("w" "Work Task" entry
         (file+headline ,(concat dropbox-directory "Documents/EmacsOrg/agenda/rand-work.org") "Work Tasks")
         "* TODO %?" :empty-lines 1)
        ("h" "HCSG Task" entry
         (file+headline ,(concat dropbox-directory "Documents/EmacsOrg/agenda/rand-hcsg.org") "HCSG Tasks")
         "* TODO %?" :empty-lines 1)
        ("d" "Dev Meeting Topic" entry
         (file+headline ,(concat dropbox-directory "Documents/EmacsOrg/agenda/dev-meeting.org") "Dev Meeting Topic")
         "* TODO %?" :empty-lines 1)
        ("j" "Journal Thoughts" entry
         (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/journal.org"))
         "* %?\nEntered on %U\n  %i\n  %a")
        ("s" "Sleep Journal" entry
         (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/sleep.org"))
         "* %?\nEntered on %U\n  %i\n  %a")
        ("e" "EmacsATX notes" entry
         (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/emacs-atx.org"))
         "* %?\nEntered on %U\n  %i\n  %a")
        ("c" "Computing captures" entry
         (file+olp+datetree ,(concat dropbox-directory "Documents/EmacsOrg/agenda/computing.org"))
         "* %?\nEntered on %U\n  %i\n  %a")))))

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
