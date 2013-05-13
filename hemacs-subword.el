(defun right-subword (&optional n)
  "Move point N subwords to the right (to the left if N is negative)."
  (interactive "^p")
  (if (eq (current-bidi-paragraph-direction) 'left-to-right)
      (subword-forward n)
    (subword-backward n)))

(defun left-subword (&optional n)
  "Move point N subwords to the left (to the right if N is negative)."
  (interactive "^p")
  (if (eq (current-bidi-paragraph-direction) 'left-to-right)
      (subword-backward n)
    (subword-forward n)))

(defun kill-subword (arg)
  "Do the same as `kill-word' but on subwords.
Optional argument ARG is the same as for `kill-word'."
  (interactive "p")
  (kill-region (point) (subword-forward arg)))

(defun backward-kill-subword (arg)
  "Do the same as `backward-kill-word' but on subwords.
Optional argument ARG is the same as for `backward-kill-word'."
  (interactive "p")
  (kill-subword (- arg)))

;; add underscores to subword
(setq subword-forward-regexp "\\W*\\(\\([_[:upper:]]*\\W?\\)[[:lower:][:digit:]]*\\)"
      subword-backward-regexp "\\(\\(\\W\\|[[:lower:][:digit:]]\\)\\([_[:upper:]]+\\W*\\)\\|\\W\\w+\\)")

;; treat camelcasing and underscoring as stop points
(global-subword-mode 1)

(provide 'hemacs-subword)
