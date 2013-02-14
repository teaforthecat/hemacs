(require 'dired)
(require 'dired-details)

(setq-default dired-details-hidden-string "- ")
(setq dired-use-ls-dired nil)
(dired-details-install)

(setq dired-auto-revert-buffer t)
(put 'dired-find-alternate-file 'disabled nil) ;; reuse current buffer by pressing 'a'
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  (define-key dired-mode-map (kbd "C-x C-k") 'dired-do-delete)
  ; up directory binding uses same buffer
  ))

;; (!!each '(dired-do-rename          
;;           dired-create-directory
;;           wdired-abort-changes)
;;         (eval `(defadvice ,it (after revert-buffer activate)
;;                  (revert-buffer))))

(provide 'hemacs-dired)
