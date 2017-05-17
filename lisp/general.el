;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc editor behavior
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default truncate-lines t)
(global-linum-mode)

;; Automatically update buffers
(global-auto-revert-mode t)

;; Narrow and widen
(put 'narrow-to-region 'disabled nil)

;; Allow the ability to convert text in a region to upper/lower case
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;; Page Scrolling
(global-set-key "\M-n" "\C-u1\C-v")
(global-set-key "\M-p" "\C-u1\M-v")
(global-set-key "\M-m" 'iy-go-to-char)

;; Backups
(setq backup-directory-alist '(("." . "~/Documents/EmacsBackup")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

