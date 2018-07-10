(require 'server)
(unless (server-running-p)
  (server-start))

;; System-specific auto-generated custom files
(cond ((eq system-type 'windows-nt) (setq custom-file "~/.emacs.d/lisp/custom-file-windows.el"))
      ((eq system-type 'darwin) (setq custom-file "~/.emacs.d/lisp/custom-file-osx.el"))
      (t (setq custom-file "~/.emacs.d/lisp/custom-file-linux.el")))
(load custom-file)

;; Emacs packages setup
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

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
(require 'init-package-specific)
(require 'init-org)
(require 'init-dev-web)
(require 'init-dev-elisp)
(require 'init-dev-elixir)
(require 'functions)
(require 'toggle-window-split)

;; (require 'init-shell)
;; (require 'init-dev-python)
;; (require 'init-dev-cpp)
;; (require 'init-dev-csharp)
;; (require 'init-dev-lisp)
