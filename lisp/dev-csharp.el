;; ;; Omnisharp-mode for Csharp development
;; (add-hook 'csharp-mode-hook 'omnisharp-mode)
;; ;;(setq omnisharp--curl-executable-path "C:/Program Files/cURL/bin/curl.exe")
;; (add-hook 'after-init-hook 'global-company-mode)
;; (eval-after-load 'company '(add-to-list 'company-backends 'company-omnisharp))

(yas/load-directory "~/Documents/yasnippet-snippets/csharp-mode")
