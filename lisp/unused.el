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

