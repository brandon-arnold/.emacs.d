(provide 'init-dev-elixir)

(use-package elixir-mode
  :mode "\\.exs?$"
  :config
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t))))

(use-package alchemist
  :defer 1
  :bind (:map alchemist-iex-mode-map
	      ("C-d" . windmove-right))
  :init
  (setq alchemist-key-command-prefix (kbd "C-c a"))
  (setq alchemist-hooks-test-on-save nil)
  (setq alchemist-hooks-compile-on-save t)
  (setq alchemist-test-status-modeline t)
  :config
  (add-to-list 'purpose-user-mode-purposes '(elixir-mode . elixir))
  (add-to-list 'purpose-user-name-purposes '("*alchemist test report*" . elixir-test))
  (add-to-list 'purpose-user-name-purposes '("*alchemist mix*" . elixir-mix))
  (purpose-compile-user-configuration))

;;	 :map alchemist-mode-map
;;	      ("M-w" . alchemist-goto-list-symbol-definitions)

;; 1. Watchdog increase health check notification
;; 2. Better logging of pool connections on knex side and pg side
;; 3. Antonin increase knex max connections
