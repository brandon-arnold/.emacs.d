(require 'server)
(unless (server-running-p)
  (server-start))

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
    (ace-window ag alchemist auctex auto-compile avy benchmark-init circe cmake-font-lock cmake-ide cmake-project color-theme company company-tern counsel counsel-projectile cpputils-cmake dired+ docker dockerfile-mode elixir-mode exec-path-from-shell expand-region flycheck flycheck-color-mode-line flycheck-credo flycheck-demjsonlint flycheck-dialyxir flycheck-dogma flycheck-elixir flycheck-mix flycheck-popup-tip flymd free-keys gitconfig-mode gitlab haskell-mode helm helm-core helm-css-scss helm-flycheck helm-flyspell hide-lines hydra indium ivy ivy-hydra ivy-rich iy-go-to-char js2-mode js2-refactor json-mode less-css-mode macrostep magit markdown-mode markdown-mode+ mmm-mode multiple-cursors night-owl-theme ob-elixir ob-typescript omnisharp org org-projectile org-projectile-helm org-super-agenda org-tree-slide paredit powershell prettier-js projectile rainbow-delimiters rjsx-mode rtags sass-mode slime smartparens sublimity swiper tern tide treemacs typescript-mode use-package visual-fill-column web-mode xref-js2 yaml-mode yasnippet yasnippet-snippets)))
 '(scroll-bar-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "outline" :slant normal :weight normal :height 110 :width normal)))))
;; OSX font:
;; '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight normal :height 140 :width normal))))
;; Windows font:
;; '(default ((t (:family "Fira Code" :foundry "outline" :slant normal :weight normal :height 110 :width normal))))

;; Emacs packages setup
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; JWiegley's use-package macro setup
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Uncomment to benchmark, then start emacs and M-x benchmark-init/show-durations-tabulated
;; (use-package benchmark-init
;;   :ensure t
;;   :config
;;   ;; To disable collection of benchmark data after init is done.
;;   (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; Uncomment to ensure packages are installed on a new system's emacs setup
;; (defun install-packages ()
;;   "Install all required packages."
;;   (interactive)
;;   (unless package-archive-contents
;;     (package-refresh-contents))
;;   (dolist (package package-selected-packages)
;;     (unless (package-installed-p package)
;;       (package-install package))))
;; (install-packages)

(setq load-path (cons "~/.emacs.d/lisp/lib" load-path))
(setq load-path (cons "~/.emacs.d/lisp" load-path))
(require 'init-general)
(require 'init-visual)
(require 'init-ivy)
(require 'init-package-specific)
(require 'init-dired)
(require 'init-org)
(require 'init-dev-web)
(require 'init-dev-elisp)
(require 'init-dev-elixir)
(require 'functions)
(require 'toggle-window-split)
;; (require 'init-dev-python)
;; (require 'init-dev-cpp)
;; (require 'init-dev-csharp)
;; (require 'init-dev-lisp)
