;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Windows settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'tsdh-dark t)
(global-linum-mode)

;; Emacs auto-generated
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(minimap-always-recenter nil)
 '(minimap-width-fraction 0.15)
 '(minimap-window-location (quote right))
 '(scroll-bar-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(default ((t (:family "Envy Code R" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))) 
 '(default ((t (:family "Fira Code Retina" :foundry "outline" :slant normal :weight normal :height 100 :width normal)))) 
 '(org-level-1 ((t (:inherit outline-1 :height 1.7 :line-height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5 :line-height 0.7))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1 :line-height 0.3)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Markdown previewer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq markdown-open-command "C:\\Program Files (x86)\\MarkdownPad 2\\MarkdownPad2.exe")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Full-screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; full screen
;; (defun toggle-full-screen ()
;;  (interactive)
;;  (shell-command "emacs_fullscreen.exe")
;;  )
;;(global-set-key [f11] 'toggle-full-screen)

;;(w32-send-sys-command 61488)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Windows Alternative Shells
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cygwin gives more unixy options to Windows,
;;  but there is a weird formatting issue at present.
;; (setq shell-file-name "C:/cygwin64/cygwin.bat")
;; (setq explicit-shell-file-name shell-file-name)
;; (setenv "PATH"
;;     (concat ".:/usr/local/bin:/mingw/bin:/bin:"
;;         (replace-regexp-in-string " " "\\\\ "
;;             (replace-regexp-in-string "\\\\" "/"
;;                 (replace-regexp-in-string "\\([A-Za-z]\\):" "/\\1"
;;                     (getenv "PATH"))))))

;;(defun cygwin-shell ()
;;  "Run cygwin bash in shell mode."
;;  (interactive)
;;  (let ((explicit-shell-file-name "C:/cygwin/bin/bash"))
;;    (call-interactively 'shell)))

(autoload 'powershell "powershell" "Run powershell as a shell within emacs." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Eclim
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'flymake)
;;(defun my-flymake-init ()
;;  (list "my-java-flymake-checks"
;;  (list (flymake-init-create-temp-buffer-copy
;;  'flymake-create-temp-with-folder-structure))))
;;(add-to-list 'flymake-allowed-file-name-masks
;;'("\\.java$" my-flymake-init flymake-simple-cleanup))

(setq ring-bell-function 'ignore)
