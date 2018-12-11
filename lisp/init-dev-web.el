(provide 'init-dev-web)

(use-package js2-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode))
  :config
  (use-package xref-js2)
  (define-key js2-mode-map (kbd "M-.") nil)
  (setq js-indent-level 2)
  (setq js-switch-indent-offset 2)
  (setq-default js2-strict-trailing-comma-warning nil)
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-r")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill))

(use-package rjsx-mode
  :mode ("\\.js$" . rjsx-mode)
  :config
  (use-package xref-js2)
  (add-hook 'rjsx-mode-hook #'indium-interaction-mode))

(use-package prettier-js
  :init
  (defun enable-minor-mode (my-pair)
    "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
    (if (buffer-file-name)
        (if (string-match (car my-pair) buffer-file-name)
            (funcall (cdr my-pair)))))
  (add-hook 'js-mode-hook #'(lambda ()
                              (enable-minor-mode
                               '("\\.jsx?\\'" . prettier-js-mode)))))

(use-package flycheck
  :defer 2
  :init
  (add-hook 'js-mode-hook 'flycheck-mode))

(use-package flycheck-popup-tip
  :init
  (with-eval-after-load 'flycheck
    (flycheck-popup-tip-mode)))

(use-package flycheck-color-mode-line
  :init
  (eval-after-load "flycheck"
    '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :config
  (setq typescript-indent-level 2
        typescript-expr-indent-offset 2)
  (setq company-tooltip-align-annotations t)
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(use-package js2-refactor
  :init
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  :config
  (setq js2-skip-preprocessor-directives t)
  (js2r-add-keybindings-with-prefix "C-c C-m"))

(add-to-list 'load-path "~/opt/tern/emacs")
(use-package company-tern
  :init
  (add-to-list 'company-backends 'company-tern)
  (add-hook 'js-mode-hook (lambda ()
                             (tern-mode)
                             (company-mode))))

(use-package web-mode
  :mode ("\\.\\(html\\|s?css\\)\\'" . web-mode)
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t))

(use-package indium)
