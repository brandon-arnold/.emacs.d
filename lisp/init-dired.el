(provide 'init-dired)

(setq load-path (cons "~/.emacs.d/lisp/dired-hacks" load-path))

(require 'dired-avfs)
(require 'dired-collapse)
(require 'dired-filter)
(require 'dired-list)
(require 'dired-narrow)
(require 'dired-open)
(require 'dired-subtree)

(use-package dired+
  :ensure nil
  :load-path "~/.emacs.d/packages/dired+"
  :config
  (setq diredp-hide-details-initially-flag t))

(use-package find-dired
  :ensure nil
  :disabled t
  :config (setq find-ls-option '("-print0 | xargs -0 ls -ld" . "-ld")))

(setq wdired-allow-to-change-permissions t)

