
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Web Goodies -- mainly Javascript
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; JS Indentation
(setq js-indent-level 2)

;; Typescript
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl\\'" . sws-mode))

;;; Web mode
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;;; Code folding
(add-hook 'js-mode-hook
	  (lambda ()
	    (imenu-add-menubar-index)
	    (hs-minor-mode t)))
(global-set-key (kbd "") 'hs-show-block)
(global-set-key (kbd "") 'hs-show-all)
(global-set-key (kbd "") 'hs-hide-block)
(global-set-key (kbd "") 'hs-hide-all)

(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(autoload 'web-mode "web-mode" "Web mode" t)
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;; 	  (lambda ()
;; 	    (slime-js-minor-mode 1)))
							
