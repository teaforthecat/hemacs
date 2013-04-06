(require 'dired)
(require 'dired-details)

(setq-default dired-details-hidden-string "- ")
(setq dired-use-ls-dired nil)
(dired-details-install)

(setq dired-auto-revert-buffer t)
(put 'dired-find-alternate-file 'disabled nil) ;; reuse current buffer by pressing 'a'

(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "C-x C-k") 'dired-do-delete)
  ))

(defadvice dired-create-directory (after revert-buffer-after-create activate)
  "Reload dired after creating a directory."
  (revert-buffer))

(defadvice dired-find-file (around dired-find-file-single-buffer activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer))
        (filename (dired-get-file-for-visit)))
    ad-do-it
    (when (and (file-directory-p filename)
               (not (eq (current-buffer) orig)))
      (kill-buffer orig))))

(defadvice dired-up-directory (around dired-up-directory-single-buffer activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer)))
    ad-do-it
    (kill-buffer orig)))

(provide 'hemacs-dired)
