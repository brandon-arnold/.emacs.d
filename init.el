(package-initialize)

(require 'server)
(unless (server-running-p)
  (server-start))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(minimap-always-recenter nil)
 '(minimap-width-fraction 0.15)
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
    (magit typescript-mode yasnippet yaml-mode writeroom-mode web-mode visual-fill-column sublimity slime rtags powershell org macrostep dired+ w3 stylus-mode shorten sass-mode org-plus-contrib omnisharp mmm-mode minimap markdown-mode+ lui less-css-mode lcs jsx-mode json-mode js2-mode jade-mode iy-go-to-char hide-lines helm-flyspell helm-flycheck helm-css-scss haskell-mode gitlab gitconfig-mode fullscreen-mode free-keys emacs-eclim dockerfile-mode cpputils-cmake company color-theme coffee-mode cmake-project cmake-ide cmake-font-lock circe auto-compile auctex ace-window)))
 '(scroll-bar-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code Retina" :foundry "outline" :slant normal :weight normal :height 100 :width normal))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.7 :line-height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5 :line-height 0.7))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1 :line-height 0.3)))))

(add-to-list 'load-path "~/.emacs.d/lisp")
(load-library "visual")
(load-library "general")
(load-library "system")
(load-library "package-specific")
(load-library "org-settings")
;; (load-library "dev-web")
;; (load-library "dev-cpp")
;; (load-library "dev-csharp")
;; (load-library "dev-lisp")
;; (load-library "functions")
