(vendor 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

(defun yank-indented ()
  (interactive)
  (let ((start (point)))
    (yank)
    (indent-region start (point))
    (indent-according-to-mode)
    ))

(defun maybe-delete-selection-and-yank ()
  (interactive)
  (if (region-active-p)
      (delete-region (region-beginning)
                     (region-end)))
  (yank))


(defun copy-line (arg)
  "Copy to end of line, or as many lines as prefix argument"
  (interactive "P")
  (if (null arg)
      (copy-to-end-of-line)
    (copy-whole-lines (prefix-numeric-value arg))))

(defun copy-to-end-of-line ()
  (interactive)
  (kill-ring-save (point)
                  (line-end-position))
  (message "Copied to end of line"))

(defun copy-whole-lines (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defun save-region-or-current-line (arg)
  (interactive "P")
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (copy-line arg)))

;; define as yank-command for delsel.el
(put 'yank-indented 'delete-selection 'yank-indented)

(defun kill-and-join-forward (&optional arg)
  "If at end of line, join with following; otherwise kill line. Deletes whitespace at join."
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (delete-indentation t)
    (kill-line arg)))

(defun copy-whole-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defun dupe-line ()
  (interactive)
  (beginning-of-line)
  (copy-region-as-kill (point) (progn (end-of-line) (point)))
  (newline)
  (beginning-of-line)
  (yank))

;; !! overrides
(global-set-key (kbd "C-k") 'kill-and-join-forward)
(global-set-key (kbd "M-w") 'save-region-or-current-line)
(global-set-key (kbd "s-v") 'maybe-delete-selection-and-yank)

(global-set-key (kbd "s-V") 'yank-indented)
(global-set-key (kbd "s-u") 'dupe-line)
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'copy-whole-line)
(global-set-key (kbd "C-c C-k") 'kill-whole-line)

(provide 'hemacs-yankill)
