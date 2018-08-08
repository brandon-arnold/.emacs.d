(provide 'init-org)

(require 'sa-org-functions)

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
         ;;("C-'" . org-cycle-agenda-files)
         ("C-c b" . org-iswitchb)
         ("C-c j" . org-clock-goto)
         ("C-c C-x C-o" . org-clock-out)
         ("C-c C-x C-r" . org-clock-report))
  :config
  (progn
    (org-super-agenda-mode)
    (setq org-archive-location "%s_archive::")
    (setq org-directory (file-name-as-directory (concat dropbox-directory "Documents/EmacsOrg")))
    (setq org-default-notes-file (concat org-directory "agenda/captured-default.org"))
    (setq org-agenda-files (list (concat dropbox-directory "Documents/EmacsOrg/agenda")))
    (setq org-agenda-window-setup 'only-window)
    (setq org-catch-invisible-edits t)
    (setq org-agenda-text-search-extra-files
          (append
           (sa-find-org-file-recursively "~/Dropbox/Documents/EmacsOrg/agenda/" ".org_archive")
           ))
    (setq org-super-agenda-groups
      '((:name "Landdox Deadlines Today"
               :and (:deadline today :category "work"))
        (:name "Landdox Scheduled Today"
               :and (:scheduled today :category "work"))
        (:name "Personal Due Today"
               :and (:category "personal" :scheduled today)
               :and (:category "personal" :deadline today))
        (:name "HCSG Due Today"
               :and (:category "hcsg" :scheduled today)
               :and (:category "hcsg" :deadline today))
        (:name none :anything)))
    ;; (setq org-startup-indented t)
    ;; if off, M-x org-indent-mode (as per http://orgmode.org/manual/Clean-view.html)
    ;; org capture templates
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
         "* %?\nEntered on %U\n  %i\n  %a")))
    ;; org refile settings
    (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
    (setq org-refile-use-outline-path 'file)
    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-allow-creating-parent-nodes 'confirm)
    ;; clocking settings
    (setq org-clock-into-drawer "CLOCKING")
    (setq org-log-done 'time)))

;; get rid of heavily weighted TODOs, breaking the org tables
(add-hook 'org-mode-hook
          (lambda ()
            (interactive)
            (set-face-attribute 'org-todo nil :weight 'normal)
            (set-face-attribute 'org-tag nil :weight 'normal)
            (set-face-attribute 'org-done nil :weight 'normal)))

;; Ox-md for markdown
;;(eval-after-load "org" '(require 'ox-md nil t))
;;(eval-after-load "org" '(use-package ox-md))
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

;; Org babel evaluators
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (js . t)))

;; Org-Mobile 
;; (setq org-mobile-directory (concat dropbox-directory "Apps/MobileOrg")
;; (setq org-mobile-inbox-for-pull (concat dropbox-directory "Apps/MobileOrg/inbox.org")

