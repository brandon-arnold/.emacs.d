(provide 'init-dev-cpp)

(setq tags-table-list 
      '( "~/.emacs.d/TAGS" ))
(if (eq system-type 'windows-nt)
    (add-to-list 'tags-table-list "C:/Program Files (x86)/emacs/TAGS"))
