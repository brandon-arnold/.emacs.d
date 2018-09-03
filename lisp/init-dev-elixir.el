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
  :config)
