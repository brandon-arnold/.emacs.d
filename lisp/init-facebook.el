(require 'flycheck)
(require 'lua-mode)
(require 'button-lock)

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

(defconst diff-task-sev-re  "[tTdDsS][0-9]\\{4,\\}"
  "Regex matching Tasks, SEVs and Diffs links")

(defun set-up-intern-button ()
  (interactive)
  (button-lock-set-button
   diff-task-sev-re
   (lambda ()
     (interactive)
     (save-excursion
       (backward-word)
       (let* ((beg (point))
              (end (re-search-forward diff-task-sev-re nil t 1))
              (item (s-trim (buffer-substring-no-properties beg end))))
         (browse-url-default-browser (format "https://www.internalfb.com/intern/bunny/?q=%s" item)))))
   :face (list 'org-link)
   :keyboard-binding "RET"))

(add-hook 'org-mode-hook 'set-up-intern-button)
(global-button-lock-mode)

(provide 'init-facebook)
