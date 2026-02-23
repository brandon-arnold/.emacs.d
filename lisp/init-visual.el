(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq frame-title-format "%b - Emacs")
(setq-default cursor-type 'box)

(use-package night-owl-theme)

;; (load-theme 'tsdh-dark t)
(load-theme 'night-owl t)
;; (load-theme 'charcoal-black t)
;; (load-theme 'ld-dark t)
;; (load-theme 'lawrence t)
;; (load-theme 'jsc-dark t)
;; (load-theme 'jedit-grey t)
;; (load-theme 'desert t)
;; (load-theme 'deep-blue t)
;; (load-theme 'dark-blue2 t)
;; (load-theme 'cobalt t)
;; (load-theme 'billw t)
;; (load-theme 'wombat t)
;; (load-theme 'xemacs t)

(use-package visual-fill-column)

(if (find-font (font-spec :name "Fira Code Symbol"))
    (require 'fira-code-ligatures))

(provide 'init-visual)
