;; (add-to-list 'load-path "~/.emacs.d/lisp/stef-elisp")
;; (require 'stef-elisp)

;; Useful for configuring emacs
;; (require 'free-keys)

;;Winner mode, a global minor mode that allows "undo" and "redo" of changes to the window
;; configuration, via the key commands 'C-c left' and C-c right'.
;; (when (fboundp 'winner-mode) (winner-mode 1))

;;
;; Enable CUA-mode for rectangle searches, but
;;  disable the Windows editing keybindings
;;
;;(setq cua-enable-cua-keys nil)
;;(setq cua-highlight-region-shift-only t) ;; no transient mark mode
;;(setq cua-toggle-set-mark nil)           ;; original set-mark behavior
;;(cua-mode)

;;(require 'org-latex)

;; (setq url-proxy-services
;;   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;     ("http" . "iss-americas-pitc-alpharettaz.proxy.corporate.ge.com:80")
;;     ("https" . "iss-americas-pitc-alpharettaz.proxy.corporate.ge.com:80")))

;; Purpose
;; (use-package window-purpose
;;   :config
;;   (purpose-mode))
;; (use-package window-purpose-x
;;   :config
;;   (purpose-x-magit-multi-on))

;; ;; Artist Mode
;; (add-hook 'artist-mode-init-hook 
;; 	  (lambda ()
;; 	    (define-key artist-mode-map (kbd "C-c C-a C-o") 'artist-ido-select-operation)
;; 	    (define-key artist-mode-map (kbd "C-c C-a C-c") 'artist-ido-select-settings)))

;; ;; make sure headers in org-mode are not collapsed
;; ;; (global-set-key (kbd "C-<f1>") (lambda()
;; ;; 			        (interactive)
;; ;; 			        (show-all)
;; ;; 			        (artist-mode)))

;; (defun artist-ido-select-operation (type)
;;   "Use ido to select a drawing operation in artist-mode"
;;   (interactive (list (ido-completing-read "Drawing operation: " 
;;                                           (list "Pen" "Pen Line" "line" "straight line" "rectangle" 
;;                                                 "square" "poly-line" "straight poly-line" "ellipse" 
;;                                                 "circle" "text see-thru" "text-overwrite" "spray-can" 
;;                                                 "erase char" "erase rectangle" "vaporize line" "vaporize lines" 
;;                                                 "cut rectangle" "cut square" "copy rectangle" "copy square" 
;;                                                 "paste" "flood-fill"))))
;;   (artist-select-operation type))

;; (defun artist-ido-select-settings (type)
;;   "Use ido to select a setting to change in artist-mode"
;;   (interactive (list (ido-completing-read "Setting: " 
;;                                           (list "Set Fill" "Set Line" "Set Erase" "Spray-size" "Spray-chars" 
;;                                                 "Rubber-banding" "Trimming" "Borders"))))
;;   (if (equal type "Spray-size") 
;;       (artist-select-operation "spray set size")
;;     (call-interactively (artist-fc-get-fn-from-symbol 
;; 			 (cdr (assoc type '(("Set Fill" . set-fill)
;; 					    ("Set Line" . set-line)
;; 					    ("Set Erase" . set-erase)
;; 					    ("Rubber-banding" . rubber-band)
;; 					    ("Trimming" . trimming)
;; 					    ("Borders" . borders)
;; 					    ("Spray-chars" . spray-chars))))))))
;; ;; (add-hook 'artist-mode-hook
;; ;; 	  (lambda ()
;; ;; 	    (local-set-key (kbd "<f1>") 'org-mode)
;; ;; 	    (local-set-key (kbd "<f2>") 'artist-select-op-pen-line) ; f2 = pen mode
;; ;;             (local-set-key (kbd "<f3>") 'artist-select-op-line)     ; f3 = line
;; ;; 	    (local-set-key (kbd "<f4>") 'artist-select-op-square)   ; f4 = rectangle
;; ;; 	    (local-set-key (kbd "<f5>") 'artist-select-op-ellipse)  ; f5 = ellipse
;; ;; 	    (local-set-key (kbd "C-z") 'undo)
;; ;;             ))

;; ;; Helm
;; (use-package helm
;;   :ensure t
;;   :init
;;   (setq helm-M-x-fuzzy-match t
;; 	helm-mode-fuzzy-match t
;; 	helm-buffers-fuzzy-matching t
;; 	helm-recentf-fuzzy-match t
;; 	helm-locate-fuzzy-match t
;; 	helm-semantic-fuzzy-match t
;; 	helm-imenu-fuzzy-match t
;; 	helm-completion-in-region-fuzzy-match t
;; 	helm-candidate-number-list 150
;; 	helm-split-window-in-side-p t
;; 	helm-move-to-line-cycle-in-source t
;; 	helm-echo-input-in-header-line t
;; 	helm-autoresize-max-height 0
;; 	helm-autoresize-min-height 20)
;;   :config
;;   (helm-mode 1)
;;   :bind
;;   ("M-x" . helm-M-x)
;;   :bind*
;;   ("C-x C-f" . helm-find-files))
;; ;;(global-set-key (kbd "M-x") 'helm-M-x)

;;; Autocomplete
;; (require 'auto-complete-config)
;; (setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
;; (global-auto-complete-mode t)
;; (setq ac-auto-start 2)
;; (setq ac-ignore-case nil)

;; cygwin gives more unixy options to Windows,
;;  but there is a weird formatting issue at present.
;; (when (eq system-type 'windows-nt)
;;   (setq shell-file-name "C:/cygwin64/cygwin.bat")
;;   (setq explicit-shell-file-name shell-file-name)
;;   (setenv "PATH"
;;     (concat ".:/usr/local/bin:/mingw/bin:/bin:"
;;         (replace-regexp-in-string " " "\\\\ "
;;             (replace-regexp-in-string "\\\\" "/"
;;                 (replace-regexp-in-string "\\([A-Za-z]\\):" "/\\1"
;;                     (getenv "PATH"))))))
;;   ;; Define new `cygwin-shell` command
;;   (defun cygwin-shell ()
;;     "Run cygwin bash in shell mode."
;;     (interactive)
;;     (let ((explicit-shell-file-name "C:/cygwin/bin/bash"))
;;       (call-interactively 'shell))))



;; Shell-mode hook to disable the buffer overrun error message that pops up
;; (see http://stackoverflow.com/questions/16732844/emacs-buffer-undo-limit)
;; (add-hook 'shell-mode-hook 'buffer-disable-undo)

;; Define powershell command
;; (if (eq system-type 'windows-nt)
;;     (autoload 'powershell "powershell" "Run powershell as a shell within emacs." t))

  ;; see https://github.com/magit/magit/issues/2541
  ;; (defun magit-display-buffer-traditional (buffer)
  ;;   "Display BUFFER the way this has traditionally been done."
  ;;   (display-buffer
  ;;    buffer (if (and (derived-mode-p 'magit-mode)
  ;;                    (not (memq (with-current-buffer buffer major-mode)
  ;;                               '(magit-process-mode
  ;;                                 magit-revision-mode
  ;;                                 magit-diff-mode
  ;;                                 magit-stash-mode
  ;;                                 magit-status-mode))))
  ;;               '(display-buffer-same-window)
  ;;             nil))) ; display in another window
  ;; (setq magit-display-buffer-function
  ;;     (lambda (buffer)
  ;;       (display-buffer buffer '(display-buffer-same-window))))

    ;; (setq org-super-agenda-groups
    ;;   '((:name "Landdox Deadlines Today"
    ;;            :and (:deadline today :category "work"))
    ;;     (:name "Landdox Scheduled Today"
    ;;            :and (:scheduled today :category "work"))
    ;;     (:name "Personal Due Today"
    ;;            :and (:category "personal" :scheduled today)
    ;;            :and (:category "personal" :deadline today))
    ;;     (:name "HCSG Due Today"
    ;;            :and (:category "hcsg" :scheduled today)
    ;;            :and (:category "hcsg" :deadline today))
    ;;     (:name none :anything)))
    ;; (setq org-startup-indented t)
    ;; if off, M-x org-indent-mode (as per http://orgmode.org/manual/Clean-view.html)
    ;; org capture templates

;; get rid of heavily weighted TODOs, breaking the org tables
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (interactive)
;;             (set-face-attribute 'org-todo nil :weight 'normal)
;;             (set-face-attribute 'org-tag nil :weight 'normal)
;;             (set-face-attribute 'org-done nil :weight 'normal)))

;; Ox-md for markdown
;;(eval-after-load "org" '(require 'ox-md nil t))
;;(eval-after-load "org" '(use-package ox-md))

;; Org-Mobile 
;; (setq org-mobile-directory (concat dropbox-directory "Apps/MobileOrg")
;; (setq org-mobile-inbox-for-pull (concat dropbox-directory "Apps/MobileOrg/inbox.org")

;; (use-package magithub
;;   :after magit
;;   :config
;;   (magithub-feature-autoinject t)
;;   (setq magithub-clone-default-directory "~/Projects"))

  ;; superceded by counsel-projectile-switch-project
  ;; (setq projectile-switch-project-action #'projectile-dired)

;;alchemist
  ;; (add-to-list 'purpose-user-mode-purposes '(elixir-mode . elixir))
  ;; (add-to-list 'purpose-user-name-purposes '("*alchemist test report*" . elixir-test))
  ;; (add-to-list 'purpose-user-name-purposes '("*alchemist mix*" . elixir-mix))
  ;; (purpose-compile-user-configuration)

;; C/++ Tags
;; http://www.emacswiki.org/emacs/BuildTags
;; ETAGS build command (from cygwin, the final dash is important):
;; find . -type f -name "*.el" | etags -
;; find . -type f -name "*.el" -o -name "*.c" -o -name "*.cpp" | etags -

;(require 'init-dev-csharp)
;; ;; Omnisharp-mode for Csharp development
;; (add-hook 'csharp-mode-hook 'omnisharp-mode)
;; ;;(setq omnisharp--curl-executable-path "C:/Program Files/cURL/bin/curl.exe")
;; (add-hook 'after-init-hook 'global-company-mode)
;; (eval-after-load 'company '(add-to-list 'company-backends 'company-omnisharp))



;; (use-package swiper
;;   :after ivy
;;   :bind (("C-s" . swiper)
;;          ("C-r" . swiper)))
