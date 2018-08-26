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
  :config
  ;; see https://github.com/magit/magit/issues/2541
  ;; (defun magit-display-buffer-traditional (buffer)
  ;;   "Display BUFFER the way this has traditionally been done."
  ;;   (display-buffer
  ;;    buffer (if (and (derived-mode-p 'magit-mode)
  ;;                    (not (memq (with-current-buffer buffer major-mode)
  ;;                               '(magit-process-mode
  ;;                                 magit-revision-mode
  ;;                                 magit-diff-mode
  ;;                                 magit-stash-mode
  ;;                                 magit-status-mode))))
  ;;               '(display-buffer-same-window)
  ;;             nil))) ; display in another window
  ;; (setq magit-display-buffer-function
  ;;     (lambda (buffer)
  ;;       (display-buffer buffer '(display-buffer-same-window))))
  )

;; Projectile
(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  ;; superceded by counsel-projectile-switch-project
  ;; (setq projectile-switch-project-action #'projectile-dired)
  (setq projectile-completion-system 'ivy)
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1)
  (counsel-projectile-mode))

;; Yas
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
