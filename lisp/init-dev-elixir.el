(provide 'init-dev-elixir)

(use-package elixir-mode
  :mode "\\.exs?$"
  :config
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t))))

(use-package alchemist
  :defer 1
  :bind (:map alchemist-iex-mode-map
	      ("C-d" . windmove-right)
	 :map alchemist-mode-map
	      ("M-w" . alchemist-goto-list-symbol-definitions))
  :config
  (setq alchemist-key-command-prefix (kbd "C-c a"))
  (setq alchemist-hooks-test-on-save nil)
  (setq alchemist-hooks-compile-on-save t)
  (add-to-list 'purpose-user-mode-purposes '(elixir-mode . elixir))
  (add-to-list 'purpose-user-name-purposes '("*alchemist test report*" . elixir-test))
  (add-to-list 'purpose-user-name-purposes '("*alchemist mix*" . elixir-mix))
  (purpose-compile-user-configuration))
