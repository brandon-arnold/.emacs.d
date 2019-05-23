(provide 'init-package-specific)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package ace-window
  :bind ("C-x o" . ace-window))

(use-package avy
  :bind (("C-;" . avy-goto-char-2)
         ("C-:" . avy-goto-char)))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit))
  :config)

(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1)
  (counsel-projectile-mode)
  (counsel-projectile-modify-action
   'counsel-projectile-switch-project-action
   '((move counsel-projectile-switch-project-action-dired 1)
     (setkey counsel-projectile-switch-project-action-dired "D")
     (setkey counsel-projectile-switch-project-action " "))))

(use-package wgrep
  :config
  (setq wgrep-auto-save-buffer t))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(defun my-flymd-browser-function (url)
  (let ((browse-url-browser-function 'browse-url-firefox))
    (browse-url url)))
(setq flymd-browser-open-function 'my-flymd-browser-function)

(use-package company
  :init
  (global-company-mode))

;; (use-package lsp-mode
;;   :commands lsp
;;   :init)

;; (use-package lsp-ui :commands lsp-ui-mode)
;; (use-package company-lsp :commands company-lsp)
