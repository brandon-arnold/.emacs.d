;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Windows settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'tsdh-dark t)

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
