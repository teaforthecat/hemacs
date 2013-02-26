;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))
(add-hook 'emacs-lisp-mode-hook 'remove-elc-on-save)

(defun eval-region-and-maybe-deactivate-mark ()
  (interactive)
  (eval-region (region-beginning)
               (region-end))
  (if (region-active-p)
      (deactivate-mark t))
  (minibuffer-message "Lisp evaluated")
)

(define-key emacs-lisp-mode-map (kbd "C-c e") 'eval-region-and-maybe-deactivate-mark)

(defun remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))))

(provide 'hemacs-lisp)
