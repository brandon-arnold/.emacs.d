;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visual defaults - important to do this first, so no flickering
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq frame-title-format "%b - Emacs")
(setq-default cursor-type 'box)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Platform-specific configs
(if (eq system-type 'cygwin)
    (load-library "platform-init-windows")
  (if (eq system-type 'windows-nt)
      (load-library "platform-init-windows")
    (if (eq system-type 'darwin)
	(load-library "platform-init-osx")
      (load-library "platform-init-linux"))))

