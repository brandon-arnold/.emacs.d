
;; install required inheritenv dependency:
(use-package inheritenv
  :vc (:url "https://github.com/purcell/inheritenv" :rev :newest))

;; for eat terminal backend:
(use-package eat)

;; for vterm terminal backend:
(use-package vterm)

(use-package monet
  :vc (:url "https://github.com/stevemolitor/monet" :rev :newest))

;; install claude-code.el
(use-package claude-code
  :vc (:url "https://github.com/stevemolitor/claude-code.el" :rev :newest)
  :init
  (setq claude-code-terminal-backend 'vterm)
  ;; https://github.com/anthropics/claude-code/issues/15875
  (setq claude-code-vterm-buffer-multiline-output nil)
  ;; Focus the Claude buffer when starting a session
  (setq claude-code-display-window-fn
        (lambda (buffer)
          (let ((window (display-buffer buffer '((display-buffer-below-selected)))))
            (when window (select-window window))
            window)))
  :config
  ;; Disable line numbers in Claude session buffers
  (add-hook 'claude-code-start-hook (lambda () (display-line-numbers-mode -1)))
  ;; optional IDE integration with Monet
  (add-hook 'claude-code-process-environment-functions #'monet-start-server-function)
  (monet-mode 1)
  (claude-code-mode)
  :bind-keymap ("C-c c" . claude-code-command-map)

  ;; Optionally define a repeat map so that "M" will cycle thru Claude auto-accept/plan/confirm modes after invoking claude-code-cycle-mode / C-c M.
  :bind
  (:repeat-map my-claude-code-map ("M" . claude-code-cycle-mode)))

(provide 'init-claude)
