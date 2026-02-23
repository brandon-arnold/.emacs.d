
(setq verilog-indent-level 2)

(use-package apheleia
  :hook (verilog-ext-mode . apheleia-mode))

(use-package verilog-ext
  :hook ((verilog-mode . verilog-ext-mode))
  :init
  ;; Can also be set through `M-x RET customize-group RET verilog-ext':
  ;; Comment out/remove the ones you do not need
  (setq verilog-ext-feature-list
        '(
          font-lock
          xref
          ;; capf
          hierarchy
          ;; eglot
          ;; lsp
          lsp-bridge
          ;; lspce
          flycheck
          beautify
          navigation
          template
          formatter
          compilation
          imenu
          which-func
          hideshow
          typedefs
          time-stamp
          block-end-comments
          ports
          ))
  :config
  (verilog-ext-mode-setup))

(use-package vhdl-ext
  :hook ((vhdl-mode . vhdl-ext-mode))
  :init
  ;; Can also be set through `M-x RET customize-group RET vhdl-ext':
  ;; Comment out/remove the ones you do not need
  (setq vhdl-ext-feature-list
        '(font-lock
          xref
          capf
          hierarchy
          ;; eglot
          ;; lsp
          lsp-bridge
          ;; lspce
          flycheck
          beautify
          navigation
          template
          compilation
          imenu
          which-func
          hideshow
          ;; time-stamp
          ports))
  :config
  (vhdl-ext-mode-setup))

(setq lsp-bridge-default-mode-hooks '(verilog-ext-mode-hook vhdl-ext-mode-hook))
(setq lsp-bridge-verilog-lsp-server "verible")
(setq lsp-bridge-diagnostic-tooltip t)
(setq lsp-bridge-diagnostic-inline t)
(global-lsp-bridge-mode)

;; lsp-bridge keybindings under C-c l prefix
(define-prefix-command 'lsp-bridge-map)
(global-set-key (kbd "C-c l") 'lsp-bridge-map)
(define-key lsp-bridge-map (kbd "n") 'lsp-bridge-diagnostic-jump-next)
(define-key lsp-bridge-map (kbd "p") 'lsp-bridge-diagnostic-jump-prev)
(define-key lsp-bridge-map (kbd "c") 'lsp-bridge-diagnostic-copy)
(define-key lsp-bridge-map (kbd "l") 'lsp-bridge-diagnostic-list)
(define-key lsp-bridge-map (kbd "d") 'lsp-bridge-find-def)
(define-key lsp-bridge-map (kbd "r") 'lsp-bridge-find-references)
(define-key lsp-bridge-map (kbd "a") 'lsp-bridge-code-action)
(define-key lsp-bridge-map (kbd "f") 'lsp-bridge-code-format)
(define-key lsp-bridge-map (kbd "h") 'lsp-bridge-show-documentation)
(define-key lsp-bridge-map (kbd "R") 'lsp-bridge-rename)

(provide 'init-dev-verilog)
