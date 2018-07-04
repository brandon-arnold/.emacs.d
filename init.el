(require 'server)
(unless (server-running-p)
  (server-start))

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0c71e4d0b5ad79a7cb155f180adcc93f2fe5ae3d3a863de7d3a8c898087d890c" default)))
 '(menu-bar-mode nil)
 '(minimap-always-recenter nil)
 '(minimap-width-fraction 0.15)
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
    (ace-window alchemist auctex auto-compile circe cmake-font-lock cmake-ide cmake-project color-theme company company-tern cpputils-cmake dired+ docker dockerfile-mode elixir-mode elixir-yasnippets expand-region flycheck-credo flycheck-demjsonlint flycheck-dialyxir flycheck-dogma flycheck-elixir flycheck-mix flymd free-keys gitconfig-mode gitlab haskell-mode helm-css-scss helm-flycheck helm-flyspell hide-lines indium iy-go-to-char js2-mode js2-refactor json-mode less-css-mode macrostep magit markdown-mode+ mmm-mode night-owl-theme ob-elixir ob-typescript omnisharp org org-projectile-helm powershell prettier-js projectile rainbow-delimiters rtags sass-mode slime sublimity tide treemacs typescript-mode use-package visual-fill-column web-mode window-purpose xref-js2 yaml-mode yasnippet)))
 '(scroll-bar-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "outline" :slant normal :weight normal :height 110 :width normal)))))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package package-selected-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

(add-to-list 'load-path "~/.emacs.d/lisp")
(load-library "general")
(load-library "visual")
(load-library "system")
(load-library "package-specific")
(load-library "org-settings")
(load-library "dev-web")
(load-library "dev-elisp")
(load-library "dev-elixir")
;; (load-library "dev-python")
;; (load-library "dev-cpp")
;; (load-library "dev-csharp")
;; (load-library "dev-lisp")
;; (load-library "functions")
