(provide 'init-general)

;; Backups
(setq backup-directory-alist '(("." . "~/Documents/EmacsBackup")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; OSX key remappings
(when (eq system-type 'darwin)
  ;; Command key ~= PC keyboard Meta/Alt key
  (setq mac-option-key-is-meta nil)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil)
  ;; Fn key ~= PC keyboard Ctrl key
  (setq ns-function-modifier 'control))

;; Never insert tabs
(setq tab-width 2)
(setq-default indent-tabs-mode nil)

;; Default word wrapping to disabled (turn on via `toggle-truncate-lines`)
(setq-default truncate-lines t)

;; Show line numbers
(global-linum-mode)

;; Disable C-z for minimizing emacs
(global-unset-key (kbd "C-z"))

;; Replace selection with typed/yanked text.
(delete-selection-mode 1)

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

;; Highlight matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Turn off annoying windows ding
(if (eq system-type 'windows-nt)
    (setq ring-bell-function 'ignore))

;; Use 'string' mode for regexes, instead of 'read' mode
;;  causing backslash hell
(setq reb-re-syntax 'string)

