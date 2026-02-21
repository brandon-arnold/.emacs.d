(provide 'init-dev-verilog)


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
(setq lsp-bridge-verilog-lsp-server "verible")
(setq lsp-bridge-diagnostic-tooltip t)
(setq lsp-bridge-diagnostic-inline t)
;; (add-to-list 'lsp-bridge-lang-server-mode-list '(verilog-mode . "verilog"))
(global-lsp-bridge-mode)

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
