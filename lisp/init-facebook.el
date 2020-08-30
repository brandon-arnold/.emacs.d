(require 'flycheck)
(require 'lua-mode)

(flycheck-define-checker arc-lint
  "arc lint exposed as to flycheck."
  :command ("~tulloch/bin/flychecklint" source)
  :error-patterns
  ((error line-start line ":" column ":" (message) line-end))
  :modes (lua-mode c-mode c++-mode))

(flycheck-define-checker hh-client
  "arc lint exposed as to flycheck."
  :command ("~tulloch/bin/flycheckhh" source)
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ":" (message) line-end))
  :modes (xhp-mode php-mode))
(add-to-list 'flycheck-checkers 'hh-client)

(add-to-list 'flycheck-checkers 'arc-lint)

(setq vc-handled-backends ())
