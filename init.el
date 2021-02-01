(require 'server)
(unless (server-running-p)
  (server-start))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0c71e4d0b5ad79a7cb155f180adcc93f2fe5ae3d3a863de7d3a8c898087d890c" default))
 '(elfeed-feeds '("https://www.with-emacs.com/rss.xml"))
 '(menu-bar-mode nil)
 '(minimap-always-recenter nil)
 '(minimap-width-fraction 0.15)
 '(minimap-window-location 'right)
 '(package-selected-packages
   '(ace-window ag ample-regexps auctex auto-compile avy benchmark-init button-lock circe cmake-font-lock cmake-ide cmake-project color-theme-modern company company-lsp company-solidity counsel counsel-projectile cpputils-cmake docker dockerfile-mode eglot elfeed elixir-mode emacsql-sqlite3 exec-path-from-shell expand-region flycheck flycheck-color-mode-line flycheck-credo flycheck-dialyxir flycheck-dogma flycheck-elixir flycheck-popup-tip flymake flymake-solidity flymd free-keys gitconfig-mode gitlab haskell-mode helm helm-css-scss helm-flycheck helm-flyspell hide-lines htmlize hydra ivy ivy-bibtex ivy-hydra ivy-rich js2-mode js2-refactor json-mode less-css-mode lsp-haskell lsp-java lsp-mode lsp-ui lua-mode macrostep magit markdown-mode markdown-mode+ mmm-mode monky multiple-cursors night-owl-theme ob-elixir ob-typescript omnisharp org-pomodoro org-projectile org-projectile-helm org-ql org-ref org-roam org-roam-bibtex org-super-agenda org-tree-slide paredit php-mode powershell prettier-js projectile rainbow-delimiters realgud realgud-lldb restclient rjsx-mode rtags sass-mode slime smartparens solidity-flycheck solidity-mode sublimity swiper tern tide toc-org typescript-mode use-package visual-fill-column web-mode wgrep wgrep-ag xref-js2 yaml-mode yasnippet yasnippet-snippets zoom))
 '(scroll-bar-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "nil" :slant normal :weight normal :height 90 :width normal)))))
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

;(when (memq window-system '(mac ns x))
;  (exec-path-from-shell-initialize))

;; Figure out why the above exec-path-from-shell-initialize isn't finding nvm's node and get rid of the following
(setq exec-path (append exec-path '("~/.nvm/versions/node/v10.13.0/bin")))

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
;; TODO cause this to fail silently
(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package package-selected-packages)
    (unless (package-installed-p package)
      (package-install package))))
(install-packages)

(setq dropbox-directory (file-name-as-directory "~/Dropbox"))
(setq dropbox-directory-exists? (file-exists-p dropbox-directory))

(setq load-path (cons "~/.emacs.d/lisp/lib" load-path))
(setq load-path (cons "~/.emacs.d/lisp" load-path))
(setq load-path (cons "~/.emacs.d/lisp/emacswiki" load-path))
;; (setq load-path (cons "~/fbsource/fbcode/emacs_config" load-path))
(setq load-path (cons "~/.emacs.d/lisp/ed-mode/" load-path))
(require 'ed "ed-mode")
(require 'init-general)
(require 'init-visual)
(require 'init-ivy)
(require 'init-package-specific)
(require 'init-dired)
(if dropbox-directory-exists? (require 'init-org))
;; (require 'init-dev-web)
(require 'init-dev-lisp)
(require 'init-dev-elisp)
;; (require 'init-dev-elixir)
;; (require 'init-dev-cpp)
(require 'functions)
(require 'toggle-window-split)
;; (require 'init-facebook)
