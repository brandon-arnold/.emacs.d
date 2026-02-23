(provide 'init-general)

(require 'move-line)

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
;; (global-linum-mode)
;; (line-number-mode)
(global-display-line-numbers-mode)

;; Disable C-z for minimizing emacs
(global-unset-key (kbd "C-z"))

;; Remove selected text on backspace, and replace selection with typed/yanked text.
(delete-selection-mode 1)

;; Automatically update buffers when the corresponding file changes on disk
(global-auto-revert-mode t)

;; Narrow and widen
(put 'narrow-to-region 'disabled nil)

;; Allow the ability to convert text in a region to upper/lower case
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;; Page Scrolling
(global-set-key "\M-n" "\C-u1\C-v")
(global-set-key "\M-p" "\C-u1\M-v")

;; Highlight matching parens (show-paren-mode is on by default in Emacs 29+)
(setq show-paren-delay 0)

;; Turn off annoying windows ding
(setq ring-bell-function 'ignore)

;; Use 'string' mode for regexes, instead of 'read' mode
;;  causing backslash hell
(setq reb-re-syntax 'string)

;; ability to move a line up and down (with appropriate tab-indent)
(global-set-key [(meta shift up)]  'move-line-up)
(global-set-key [(meta shift down)]  'move-line-down)

(use-package elfeed
  :bind ("C-x w" . elfeed))

;; Occur
 (global-set-key (kbd "C-c o") 'occur)

;; Highlight the row containing the cursor
(global-hl-line-mode 1)

;; Show the column number containing the cursor in the modeline
(column-number-mode 1)

;; Default C-x f directory
(setq default-directory "~/")
(setq command-line-default-directory "~/")


;; save files in progress
(setq auto-save-default t)

(use-package sudo-edit)

(use-package ag)

(use-package free-keys)

;; Persist minibuffer history across sessions
(savehist-mode 1)

;; Track recently opened files
(recentf-mode 1)

;; Show available keybindings after prefix key (built-in since Emacs 30)
(which-key-mode 1)

;; Allow repeating certain key sequences (e.g. C-x o o o to keep switching windows)
(repeat-mode 1)

;; Smooth pixel scrolling for mouse/trackpad
(pixel-scroll-precision-mode 1)

;; make lsp-bridge only work on specific modes
(setq lsp-bridge-default-mode-hooks '(verilog-ext-mode vhdl-ext-mode))
