;; remove trailing whitespace and deactivate the mark on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'maybe-deactivate-mark)

;; writing helpers
(add-hook 'markdown-mode-hook 'visual-line-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)

;; symbolism
(add-hook 'prog-mode-hook 'pretty-lambdas)

;; (add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; turn on rainbow mode when editing themes
(add-hook 'find-file-hook 'maybe-turn-on-rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)

;; nice scrolling for most modes
;; (dolist (hook '(prog-mode-hook
;;                 html-mode-hook
;;                 css-mode-hook
;;                 sass-mode-hook
;;                 magit-log-mode-hook
;;                 magit-mode-hook
;;                 slim-mode-hook
;;                 ;; coffee-mode-hook
;;                 haml-mode-hook
;;                 markdown-mode-hook
;;                 js2-mode-hook))
;;   (add-hook hook 'nice-scrolling))

;; text scale down one and turn off smart tab for shell-ish modes
(add-hook 'comint-mode-hook '(lambda ()
                               (text-scale-decrease 1)
                               (smart-tab-mode 0)))

;; force utf8 on I/O
;; (defun exec-use-utf8 ()
;;   (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))

;; (add-hook 'comint-exec-hook 'exec-use-utf8)
;; (add-hook 'shell-mode-hook 'turn-off-auto-fill)

(provide 'hemacs-hooks)
