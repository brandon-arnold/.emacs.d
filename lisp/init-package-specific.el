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


;; Ivy, Counsel, Swiper
(use-package ivy
  :defer 0.1
  :diminish (ivy-mode . "")
  :bind (("C-c C-r" . ivy-resume)
         ;;(:map ivy-mode-map)
         ("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (ivy-use-virtual-buffers t)
  (ivy-height 10)
  (ivy-count-format "(%d/%d) ")
  (ivy-display-style 'fancy)
  ;; no regexp by default
  ;; (ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (ivy-re-builders-alist
   ;; allow input not in order
   '((t   . ivy--regex-ignore-order)))
  :config
  (ivy-mode 1))

(use-package counsel
  :after ivy
  :bind (("C-x C-f" . counsel-find-file)
         ("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop)
         ("C-h f" . counsel-describe-function)))

(use-package ivy-rich
  :after ivy
  :custom
  (ivy-virtual-abbreviate 'full
                          ivy-rich-switch-buffer-align-virtual-buffer t)
  (ivy-rich-path-style 'abbrev)
  :config
  (ivy-rich-mode 1)
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

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
