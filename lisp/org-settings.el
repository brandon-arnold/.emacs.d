;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Org-mode macros and defaults
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "C-,")  'org-cycle-agenda-files)

(setq org-catch-invisible-edits t)
;; (setq org-startup-indented t)
;; if off, M-x org-indent-mode (as per http://orgmode.org/manual/Clean-view.html)
(setq org-archive-location "%s_archive::")
(setq org-directory "~/Dropbox/Documents/EmacsOrg")
(setq org-default-notes-file (concat org-directory "/agenda/captured-default.org"))
(setq org-agenda-files '("~/Dropbox/Documents/EmacsOrg/agenda"))

;; org capture templates
(setq org-capture-templates
      '(("t" "Personal Task" entry
         (file+headline "~/Dropbox/Documents/EmacsOrg/agenda/captured-personal-tasks.org" "Personal Tasks")
         "* TODO %?" :empty-lines 1)
        ("w" "Work Task" entry
         (file+headline "~/Dropbox/Documents/EmacsOrg/agenda/captured-work-tasks.org" "Work Tasks")
         "* TODO %?" :empty-lines 1)
        ("j" "Journal Thoughts" entry
         (file+olp+datetree "~/Dropbox/Documents/EmacsOrg/agenda/captured-thoughts.org")
         "* %?\nEntered on %U\n  %i\n  %a")))

;; clocking settings
(setq org-clock-into-drawer "CLOCKING")
(setq org-log-done 'time)

;; get rid of heavily weighted TODOs, breaking the org tables
(add-hook 'org-mode-hook
          (lambda ()
            (interactive)
            (set-face-attribute 'org-todo nil :weight 'normal)
            (set-face-attribute 'org-tag nil :weight 'normal)
            (set-face-attribute 'org-done nil :weight 'normal)))

(eval-after-load "org" '(require 'ox-md nil t))

;; Org-Mobile 
;; (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; (setq org-mobile-inbox-for-pull "~/Dropbox/Apps/MobileOrg/inbox.org")
