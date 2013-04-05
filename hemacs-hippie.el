(require 'smart-tab)

;; smart tab
(setq smart-tab-using-hippie-expand t)
(global-smart-tab-mode 1)

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

;; suppress "complete, but not unique" popup
(setq completion-cycle-threshold t)

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

(global-set-key (kbd "M-TAB") 'hippie-expand)
(global-set-key (kbd "C-/") 'hippie-expand-lines)

(provide 'hemacs-hippie)
