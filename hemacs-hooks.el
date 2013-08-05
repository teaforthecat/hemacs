(defun nice-scrolling ()
  "Turn on smooth buffered scrolling"
  (interactive)
  (set (make-local-variable 'line-spacing) 0.12)
  (set (make-local-variable 'scroll-margin) 24)
  (set (make-local-variable 'scroll-conservatively) 100000)
  (set (make-local-variable 'scroll-preserve-screen-position) t))

(defun maybe-turn-on-rainbow-mode ()
  (when (and (stringp buffer-file-name)
             (string-match ".*theme.el" buffer-file-name))
    (rainbow-mode)))

(defun maybe-delete-trailing-whitespace ()
  (unless (eq major-mode 'markdown-mode)
    (delete-trailing-whitespace)))

;; remove trailing whitespace and deactivate the mark on save
(add-hook 'before-save-hook 'maybe-delete-trailing-whitespace)
(add-hook 'before-save-hook 'maybe-deactivate-mark)

;; writing helpers
(add-hook 'markdown-mode-hook 'visual-line-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)

(add-hook 'magit-log-edit-mode-hook 'flyspell-mode)

;; (add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; turn on rainbow mode when editing themes
(add-hook 'find-file-hook 'maybe-turn-on-rainbow-mode)
(--each '(css-mode-hook stylus-mode-hook) (add-hook it 'rainbow-mode))

;; text scale down one for shell-ish modes
(add-hook 'comint-mode-hook '(lambda ()
                               (text-scale-decrease 1)))

;; preserve scrolling buffer for programming modes
(--each '(prog-mode-hook css-mode-hook sgml-mode-hook magit-mode-hook) (add-hook it 'nice-scrolling))

;; show linum-mode for programming modes
(--each '(prog-mode-hook less-css-mode-hook sgml-mode-hook) (add-hook it 'linum-mode))

(provide 'hemacs-hooks)
