;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Org-mode macros and defaults
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-catch-invisible-edits t)
(setq org-startup-indented t) ;; if off, M-x org-indent-mode (as per http://orgmode.org/manual/Clean-view.html)
(setq org-archive-location "ARCHIVE_%s::")
(setq org-todo-keywords
  '((sequence "TODO" "WAITING" "|" "DONE" "DELEGATED")))

(setq org-directory "~/.emacs.d/org")
;; (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; (setq org-agenda-files '("~/.emacs.d/org/personal.org" "~/.emacs.d/org/work.org"))
;;(setq org-agenda-files ('("~/Dropbox/Apps/MobileOrg/personal.org" "~/Dropbox/Apps/MobileOrg/work.org")))
;; (setq org-mobile-inbox-for-pull "~/Dropbox/Apps/MobileOrg/inbox.org")
;; (require 'org-depend) ;; for non-sibling dependent tasks
