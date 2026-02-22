;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))

;; TODO Find alternative to MELPA for org-roam and org-roam-bibtex 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0c71e4d0b5ad79a7cb155f180adcc93f2fe5ae3d3a863de7d3a8c898087d890c"
     default))
 '(elfeed-feeds '("https://www.with-emacs.com/rss.xml"))
 '(menu-bar-mode nil)
 '(minimap-always-recenter nil)
 '(minimap-width-fraction 0.15)
 '(minimap-window-location 'right)
 '(scroll-bar-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "nil" :slant normal :weight normal :height 100 :width normal)))))

;; :height is 100 for the office monitors and 140 for the main laptop screen
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

;(when (memq window-system '(mac ns x))
;  (exec-path-from-shell-initialize))

(add-to-list 'exec-path (expand-file-name "~/.local/bin"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Uncomment to benchmark, then start emacs and M-x benchmark-init/show-durations-tabulated
;; (use-package benchmark-init
;;   :ensure t
;;   :config
;;   ;; To disable collection of benchmark data after init is done.
;;   (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package exec-path-from-shell
  :config
  (when (or (memq window-system '(x pgtk))  ; Linux GUI
            (daemonp))                       ; if using emacs --daemon
    (exec-path-from-shell-initialize)))

(setq dropbox-directory (file-name-as-directory "~/Dropbox"))
(setq dropbox-directory-exists? (file-exists-p dropbox-directory))
;; ignore package cl is deprecated warning
(setq byte-compile-warnings '(cl-functions))

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
;; (require 'init-dev-lisp)
;; (require 'init-dev-elisp)
;; (require 'init-dev-elixir)
;; (require 'init-dev-cpp)
(require 'functions)
(require 'toggle-window-split)
;; (require 'init-facebook)
(require 'init-dev-verilog)
(require 'init-claude)
