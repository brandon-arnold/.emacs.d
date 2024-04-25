(defun my-flymd-browser-function (url)
  (let ((browse-url-browser-function 'browse-url-firefox))
    (browse-url url)))
(setq flymd-browser-open-function 'my-flymd-browser-function)

(add-hook 'markdown-mode-hook #'auto-fill-mode)
(setq-default fill-column 80)
