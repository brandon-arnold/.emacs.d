(provide 'init-shell)

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
(add-hook 'shell-mode-hook 'buffer-disable-undo)

;; Define powershell command
(if (eq system-type 'windows-nt)
    (autoload 'powershell "powershell" "Run powershell as a shell within emacs." t))
