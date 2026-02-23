(use-package ivy
  :defer 0.1
  :diminish (ivy-mode . "")
  :bind-keymap ()
  :bind (("C-c C-r" . ivy-resume)
         ("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-height 10)
  (ivy-count-format "(%d/%d) ")
  (ivy-display-style 'fancy)
  (ivy-re-builders-alist
   '((t   . ivy--regex-ignore-order)))
  :config
  (ivy-mode 1))

(use-package ivy-hydra
  :after ivy)

(use-package counsel
  :after ivy
  :bind (("C-x C-f" . counsel-find-file)
         ("C-x C-r" . counsel-recentf)
         ("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop)
         ("C-h f" . counsel-describe-function)))

(use-package ivy-rich
  :after ivy
  :custom
  (ivy-virtual-abbreviate
   'full
   ivy-rich-switch-buffer-align-virtual-buffer t)
  (ivy-rich-path-style 'abbrev)
  :config
  (ivy-rich-mode 1))

(provide 'init-ivy)
