(provide 'init-visual)

(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq frame-title-format "%b - Emacs")
(setq-default cursor-type 'box)

;; (load-theme 'tsdh-dark t)
(load-theme 'night-owl t)
;; (load-theme 'charcoal-black t)

(if (find-font (font-spec :name "Fira Code Symbol"))
    (require 'fira-code-ligatures))
