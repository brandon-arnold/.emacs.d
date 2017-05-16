(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  )

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Use 'string' mode for regexes, instead of 'read' mode
;;  causing backslash hell
(require 're-builder)
(setq reb-re-syntax 'string)

;;; Window switching (ace-window)
(global-set-key (kbd "C-x o") 'ace-window)

;; Shell-mode hook to disable the buffer overrun error message that pops up
;; (see http://stackoverflow.com/questions/16732844/emacs-buffer-undo-limit)
(add-hook 'shell-mode-hook 'buffer-disable-undo)

