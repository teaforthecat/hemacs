(require 'less-css-mode)
(require 'sass-mode)
(require 'stylus-mode)

(add-to-list 'auto-mode-alist '("\\.styl$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . less-mode))

;; add try-expand-css to hippie expand function list for tab completion

(defun try-expand-css (old)
  (try-expand-with-ac-completion old 'css-mode))

(defun css-mode-hook ()
  (set (make-local-variable 'hippie-expand-try-functions-list) hippie-expand-try-functions-list)
  (add-to-list 'hippie-expand-try-functions-list 'try-expand-css))

(add-hook 'css-mode-hook 'css-mode-hook)

(setq css-indent-offset 2
      scss-compile-at-save nil)

(eval-after-load 'css-mode
  '(progn
     (define-key css-mode-map (kbd "RET") 'newline-and-indent)
     (define-key css-mode-map (kbd "s-:") 'pad-colon-and-maybe-semicolon)
     (define-key css-mode-map (kbd "s-{") 'open-brackets-newline-and-indent)
     (define-key css-mode-map (kbd "<s-return>") 'insert-empty-line)
     ;; (define-key css-mode-map "\M-\C-x" 'slime-js-refresh-css)
     ;; (define-key css-mode-map "\C-c\C-r" 'slime-js-embed-css)
     ))

(define-key sass-mode-map (kbd "RET") 'newline-indent-relative)

(provide 'hemacs-stylesheets)
