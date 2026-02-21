(provide 'init-dev-cpp)

(setq tags-table-list 
      '( "~/.emacs.d/TAGS" ))
(if (eq system-type 'windows-nt)
    (add-to-list 'tags-table-list "C:/Program Files (x86)/emacs/TAGS"))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c++ mode c-mode) . "/usr/local/bin/ccls"))
  (setq-default tab-width 4))

(setq-default c-basic-offset 4)
