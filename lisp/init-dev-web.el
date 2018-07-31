(provide 'init-dev-web)

(use-package js2-mode
  :mode "\\.js\\'"
  :config
  (use-package js2-refactor
    :ensure t)
  (use-package xref-js2
    :ensure t)
  (use-package prettier-js
    :ensure t)
  (setq js-indent-level 2)
  (setq js-switch-indent-offset 2)
  (setq-default js2-strict-trailing-comma-warning nil)
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-r")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode))

;; tide, a Typescript IDE
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :config
  (setq typescript-indent-level 2
        typescript-expr-indent-offset 2)
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)
  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))
;; (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

;; Tern
;; (add-to-list 'load-path "~/opt/tern/emacs/")
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;; Web mode
(use-package web-mode
  :mode ("\\.\\(html\\|s?css\\)\\'" . web-mode)
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t))

;; (use-package web-beautify
;;   :commands (web-beautify-css
;;              web-beautify-css-buffer
;;              web-beautify-html
;;              web-beautify-html-buffer
;;              web-beautify-js
;;              web-beautify-js-buffer))

;; (autoload 'web-mode "web-mode" "Web mode" t)
;; (setq web-mode-content-types-alist
;;       '(("jsx" . "\\.js[x]?\\'")))
;; (defun my-web-mode-hook ()
;;   "Hooks for Web mode."
;;   )
;; (add-hook 'web-mode-hook  'my-web-mode-hook)

;; Slime
;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;; 	  (lambda ()
;; 	    (slime-js-minor-mode 1)))
