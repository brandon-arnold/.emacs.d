;; Dired+
(require 'dired+)
(setq diredp-hide-details-initially-flag t)

;; WDired
(setq wdired-allow-to-change-permissions t)

;; Use 'string' mode for regexes, instead of 'read' mode
;;  causing backslash hell
(require 're-builder)
(setq reb-re-syntax 'string)

;; Expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;; Window switching (ace-window)
(global-set-key (kbd "C-x o") 'ace-window)

;; Shell-mode hook to disable the buffer overrun error message that pops up
;; (see http://stackoverflow.com/questions/16732844/emacs-buffer-undo-limit)
(add-hook 'shell-mode-hook 'buffer-disable-undo)

;;; Autocomplete
;; (require 'auto-complete-config)
;; (setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
;; (global-auto-complete-mode t)
;; (setq ac-auto-start 2)
;; (setq ac-ignore-case nil)

(require 'avy)
;; (global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)

;; Magit
(require 'magit)

;; Purpose
(require 'window-purpose)
(purpose-mode)
(require 'window-purpose-x)
(purpose-x-magit-multi-on)

;; Artist Mode
(add-hook 'artist-mode-init-hook 
	  (lambda ()
	    (define-key artist-mode-map (kbd "C-c C-a C-o") 'artist-ido-select-operation)
	    (define-key artist-mode-map (kbd "C-c C-a C-c") 'artist-ido-select-settings)))

;; make sure headers in org-mode are not collapsed
;; (global-set-key (kbd "C-<f1>") (lambda()
;; 			        (interactive)
;; 			        (show-all)
;; 			        (artist-mode)))

(defun artist-ido-select-operation (type)
  "Use ido to select a drawing operation in artist-mode"
  (interactive (list (ido-completing-read "Drawing operation: " 
                                          (list "Pen" "Pen Line" "line" "straight line" "rectangle" 
                                                "square" "poly-line" "straight poly-line" "ellipse" 
                                                "circle" "text see-thru" "text-overwrite" "spray-can" 
                                                "erase char" "erase rectangle" "vaporize line" "vaporize lines" 
                                                "cut rectangle" "cut square" "copy rectangle" "copy square" 
                                                "paste" "flood-fill"))))
  (artist-select-operation type))

(defun artist-ido-select-settings (type)
  "Use ido to select a setting to change in artist-mode"
  (interactive (list (ido-completing-read "Setting: " 
                                          (list "Set Fill" "Set Line" "Set Erase" "Spray-size" "Spray-chars" 
                                                "Rubber-banding" "Trimming" "Borders"))))
  (if (equal type "Spray-size") 
      (artist-select-operation "spray set size")
    (call-interactively (artist-fc-get-fn-from-symbol 
			 (cdr (assoc type '(("Set Fill" . set-fill)
					    ("Set Line" . set-line)
					    ("Set Erase" . set-erase)
					    ("Rubber-banding" . rubber-band)
					    ("Trimming" . trimming)
					    ("Borders" . borders)
					    ("Spray-chars" . spray-chars))))))))
;; (add-hook 'artist-mode-hook
;; 	  (lambda ()
;; 	    (local-set-key (kbd "<f1>") 'org-mode)
;; 	    (local-set-key (kbd "<f2>") 'artist-select-op-pen-line) ; f2 = pen mode
;;             (local-set-key (kbd "<f3>") 'artist-select-op-line)     ; f3 = line
;; 	    (local-set-key (kbd "<f4>") 'artist-select-op-square)   ; f4 = rectangle
;; 	    (local-set-key (kbd "<f5>") 'artist-select-op-ellipse)  ; f5 = ellipse
;; 	    (local-set-key (kbd "C-z") 'undo)
;;             ))

;; Helm
(use-package helm
  :ensure t
  :init
  (setq helm-M-x-fuzzy-match t
	helm-mode-fuzzy-match t
	helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t
	helm-locate-fuzzy-match t
	helm-semantic-fuzzy-match t
	helm-imenu-fuzzy-match t
	helm-completion-in-region-fuzzy-match t
	helm-candidate-number-list 150
	helm-split-window-in-side-p t
	helm-move-to-line-cycle-in-source t
	helm-echo-input-in-header-line t
	helm-autoresize-max-height 0
	helm-autoresize-min-height 20)
  :config
  (helm-mode 1))

;; Projectile
(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

