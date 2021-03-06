(provide 'functions)

;; In-place rename of file and buffer
;; http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; Random UUID generator by Christopher Wellons, 2011-11-18. Editted by Xah Lee.
;; Edited by Hideki Saito further to generate all valid variants for "N" in xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx format.
;; Src: http://ergoemacs.org/emacs/elisp_generate_uuid.html
(defun insert-uuid-internal ()
  "Insert a UUID. This uses a simple hashing of variable data."
  (interactive)
  (let ((myStr (md5 (format "%s%s%s%s%s%s%s%s%s%s"
                (user-uid)
                (emacs-pid)
                (system-name)
                (user-full-name)
                (current-time)
                (emacs-uptime)
                (garbage-collect)
                (buffer-string)
                (random)
                (recent-keys)))))

    (insert (format "%s-%s-4%s-%s%s-%s"
                    (substring myStr 0 8)
                    (substring myStr 8 12)
                    (substring myStr 13 16)
            (format "%x" (+ 8 (random 4)))
                    (substring myStr 17 20)
                    (substring myStr 20 32)))))

;; Author: Brandon
(defun sort-words (reverse beg end)
  "Sort words in region alphabetically; argument means descending order.
Called from a program, there are three arguments:
REVERSE (non-nil means reverse order), BEG and END (region to sort).
The variable `sort-fold-case' determines whether alphabetic case affects
the sort order."
  (interactive "P\nr")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (replace-regexp "\\(\\s-\\)+" "\n" nil (point-min) (point-max) nil)
      (goto-char (point-min))
      (let ;; To make `end-of-line' and etc. to ignore fields.
	  ((inhibit-field-text-motion t))
	(sort-subr reverse 'forward-line 'end-of-line))
      (replace-regexp "\n" " " nil (point-min) (point-max) nil))))

;; Restart Emacsclient
(defun launch-separate-emacs-in-terminal ()
  (suspend-emacs "fg ; emacs -nw"))

(defun launch-separate-emacs-under-x ()
  (call-process "sh" nil nil nil "-c" "emacs &"))

(defun restart-emacs ()
  (interactive)
  ;; We need the new emacs to be spawned after all kill-emacs-hooks
  ;; have been processed and there is nothing interesting left
  (let ((kill-emacs-hook (append kill-emacs-hook (list (if (display-graphic-p)
                                                           #'launch-separate-emacs-under-x
                                                         #'launch-separate-emacs-in-terminal)))))
    (save-buffers-kill-emacs)))
