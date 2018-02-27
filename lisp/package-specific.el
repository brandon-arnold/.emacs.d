(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Dired+
(require 'dired+)
(setq diredp-hide-details-initially-flag t)

;; WDired
(setq wdired-allow-to-change-permissions t)

;; Use 'string' mode for regexes, instead of 'read' mode
;;  causing backslash hell
(require 're-builder)
(setq reb-re-syntax 'string)

;;; Window switching (ace-window)
(global-set-key (kbd "C-x o") 'ace-window)

;; Shell-mode hook to disable the buffer overrun error message that pops up
;; (see http://stackoverflow.com/questions/16732844/emacs-buffer-undo-limit)
(add-hook 'shell-mode-hook 'buffer-disable-undo)

;;; Autocomplete
(require 'auto-complete-config)
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
(setq ac-auto-start 2)
(setq ac-ignore-case nil)

;; yasnippet
;; (require 'yasnippet)
;; (yas/initialize)
;; (add-to-list 'ac-sources 'ac-source-yasnippet)

;; Magit
(require 'magit)
