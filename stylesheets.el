(vendor 'less-css-mode)
(vendor 'sass-mode)
(vendor 'scss-mode)
(setq scss-compile-at-save nil)

(eval-after-load 'css-mode
  '(progn
     (define-key css-mode-map (kbd "s-:") 'insert-space-and-semicolon)
     (define-key css-mode-map (kbd "<s-return>") 'insert-empty-line)
     ;; (define-key css-mode-map (kbd "RET") 'newline-and-indent)
     ;; (add-hook 'css-mode-hook '(lambda () (electric-pair-mode)))
     ))

(setq css-indent-offset 2)
(add-hook 'css-mode-hook
          (lambda ()
            (define-key css-mode-map "\M-\C-x" 'slime-js-refresh-css)
            (define-key css-mode-map "\C-c\C-r" 'slime-js-embed-css)))
;; (setq css-electric-keys (quote (125 59 0)))

(provide 'stylesheets)
