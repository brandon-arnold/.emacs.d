;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Org-mode macros and defaults
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-catch-invisible-edits t)
;; (setq org-startup-indented t) ;; if off, M-x org-indent-mode (as per http://orgmode.org/manual/Clean-view.html)
(setq org-archive-location "ARCHIVE_%s::")

(setq org-directory "~/Dropbox/Documents/EmacsOrg")
(setq org-agenda-files '("~/Dropbox/Documents/EmacsOrg/personal.org" "~/Dropbox/Documents/EmacsOrg/work.org"))
(setq org-clock-into-drawer "CLOCKING")

(add-hook 'org-mode-hook
          (lambda ()
            (interactive)
            (set-face-attribute 'org-todo nil :weight 'normal)
            (set-face-attribute 'org-tag nil :weight 'normal)
            (set-face-attribute 'org-done nil :weight 'normal)))

;; Org-Depend
;; (require 'org-depend) ;; for non-sibling dependent tasks

;; Org-Mobile 
;; (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; (setq org-mobile-inbox-for-pull "~/Dropbox/Apps/MobileOrg/inbox.org")

