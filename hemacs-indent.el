;; indent shifting textmate-like bindings
(defun shift-right (&optional arg)
  "Shift the line or region to the ARG places to the right.
  A place is considered `tab-width' character columns."
  (interactive)
  (let ((deactivate-mark nil)
        (beg (or (and mark-active (region-beginning))
                 (line-beginning-position)))
        (end (or (and mark-active (region-end)) (line-end-position))))
    (indent-rigidly beg end (* (or arg 1) tab-width))))

(defun shift-left (&optional arg)
  "Shift the line or region to the ARG places to the left."
  (interactive)
  (shift-right (* -1 (or arg 1))))

(defun end-of-line-then-newline-and-indent ()
  "Insert an empty line after the current line and positon
the curson at its beginning, according to the current mode."
  (interactive)
  (end-of-line)
  (newline-and-indent))

;; auto-indent pasted texted
(defvar yank-indent-modes '(prog-mode
                            sgml-mode
                            js2-mode)
  "Modes in which to indent regions that are yanked (or yank-popped)")

(defvar yank-advised-indent-threshold 1000
  "Threshold (# chars) over which indentation does not automatically occur.")

(defun yank-advised-indent-function (beg end)
  "Do indentation, as long as the region isn't too large."
  (if (<= (- end beg) yank-advised-indent-threshold)
      (indent-region beg end nil)))

(defadvice yank (after yank-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (--any? (derived-mode-p it) yank-indent-modes))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(defadvice yank-pop (after yank-pop-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(defun yank-unindented ()
  (interactive)
  (yank 1))


(global-set-key (kbd "s-]") 'shift-right)
(global-set-key (kbd "s-[") 'shift-left)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "<s-return>") 'end-of-line-then-newline-and-indent)

(global-set-key (kbd "s-V") 'yank-unindented)

(provide 'hemacs-indent)
