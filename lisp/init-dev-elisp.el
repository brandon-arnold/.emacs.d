(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; Cause Eldoc to show first line of docstring
(defadvice eldoc-get-fnsym-args-string (after add-dacstring (sym)
                                                activate compile)
    "Add a doc string to ElDoc's modeline information."
    (let ((doc (eldoc-docstring-first-line
                (cdr (help-split-fundoc (documentation sym t) sym)))))
      (when (and doc (not (equal doc "")))
        (setq ad-return-value
              (concat ad-return-value
                      (if (> (+ (length ad-return-value) (length doc) 4)
                             (frame-width)) "\n" "    ")
                      doc))))
    ad-return-value)

(provide 'init-dev-elisp)
