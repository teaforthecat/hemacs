;; suppress "complete, but not unique" popup
(setq completion-cycle-threshold t)

;; don't output the expansion function used
(setq hippie-expand-verbose nil)

;; hippie expand match order
(setq hippie-expand-try-functions-list '(try-expand-dabbrev-visible
                                         try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol
                                         try-expand-all-abbrevs
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-whole-kill))

(defadvice hippie-expand (around hippie-expand-case-fold)
  "Try to do case-sensitive matching (not effective with all functions)."
  (let ((case-fold-search nil))
    ad-do-it))
(ad-activate 'hippie-expand)

(defun hippie-expand-lines ()
  (interactive)
  (let ((hippie-expand-try-functions-list '(try-expand-line
                                            try-expand-line-all-buffers)))
    (hippie-expand nil)))

(defun he-string-beg ()
  "A helper function to return the point at the beginning of the symbol to be completed."
  (let ((p))
    (save-excursion
      (backward-word 1)
      (setq p (point)))
    p))

(defun try-expand-from-string-in-list (old)
  "Try to hippie expand from a string in `he-string-list`"
  (unless old
    (he-init-string (he-string-beg) (point))
    (setq he-expand-list (sort
                          (all-completions he-search-string (mapcar 'list he-string-list))
                          'string-lessp)))
  (while (and he-expand-list
              (he-string-member (car he-expand-list) he-tried-table))
    (setq he-expand-list (cdr he-expand-list)))
  (if (null he-expand-list)
      (progn
        (when old (he-reset-string))
        ())
    (he-substitute-string (car he-expand-list))
    (setq he-expand-list (cdr he-expand-list))
    t))

(defun tab-dwim ()
  "Complete with hippie expand or indent current line or active region"
  (interactive)
  (if mark-active
      (indent-region (region-beginning) (region-end))
    (if (looking-at "\\_>")
        (hippie-expand nil)
      (indent-for-tab-command))))

;; bindings
(global-set-key (kbd "TAB") 'tab-dwim)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-?") 'hippie-expand-lines)

(provide 'hemacs-hippie)
