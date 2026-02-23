;; Sourced from suvayu's Github: https://raw.githubusercontent.com/suvayu/.emacs.d/master/lisp/nifty.el
(defun sa-transpose-lines (arg)
  "More intuitive `transpose-lines'.  `arg' number of lines are
\"dragged\" up.  If `arg' is -ve, they are dragged down instead.
The relative cursor position is restored after the move.

IMO, this is a more natural and graphical way of transposing.
The idea is you want to operate on the current object you are
editing.  The current cursor position is preserved to continue
editing after the operation."
  (interactive "*p")
  ;; Thanks to Jambunathan for the bookmark trick
  (add-text-properties (point) (1+ (point)) '(bookmark t))
  ;; save arg for repeat
  (setq sa-transpose-lines--last-arg arg)
  (if (< arg 0) (forward-line (- 1 arg)))
  (transpose-lines arg)
  (goto-char (1- (previous-single-property-change (point) 'bookmark)))
  (remove-text-properties (point) (1+ (point)) '(bookmark)))

;; just for convenience
(defalias 'sa-transpose-lines-up 'sa-transpose-lines)
(defun sa-transpose-lines-down (&optional arg)
  "Move `arg' lines down (including current line)."
  (interactive "*p")
  ;; (message "arg: %s, %s" arg (- (or arg 1)))
  (sa-transpose-lines (- (or arg 1))))

(provide 'sa-transpose-lines)
