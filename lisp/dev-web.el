
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Web Goodies -- mainly Javascript
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; JS Indentation
(setq js-indent-level 2)
(setq js-switch-indent-offset 2)

;;; Web mode
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; Tern
(add-to-list 'load-path "~/opt/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;;; Code folding
;; (add-hook 'js2-mode-hook
;; 	  (lambda ()
;; 	    (imenu-add-menubar-index)
;; 	    (hs-minor-mode t)))
;; (add-hook 'web-mode-hook
;;       (lambda ()
;;         ;; short circuit js mode and just do everything in jsx-mode
;;         (if (equal web-mode-content-type "javascript")
;;             (web-mode-set-content-type "jsx")
;;           (message "now set to: %s" web-mode-content-type))))
;; (global-set-key (kbd "") 'hs-show-block)
;; (global-set-key (kbd "") 'hs-show-all)
;; (global-set-key (kbd "") 'hs-hide-block)
;; (global-set-key (kbd "") 'hs-hide-all)

(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(autoload 'web-mode "web-mode" "Web mode" t)
;; (setq web-mode-content-types-alist
;;       '(("jsx" . "\\.js[x]?\\'")))

;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;; 	  (lambda ()
;; 	    (slime-js-minor-mode 1)))
							
;; Indium, a Javascript IDE
(require 'indium)

;; Typescript
;; (add-to-list 'auto-mode-alist '("\\.ts\\'" . tide-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(setq typescript-indent-level 2
      typescript-expr-indent-offset 2)

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

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
