(vendor 'less-css-mode)
(vendor 'sass-mode)
(vendor 'scss-mode)

(setq css-indent-offset 2
      scss-compile-at-save nil)

(eval-after-load 'css-mode
  '(progn
     (define-key css-mode-map (kbd "RET") 'newline-and-indent)
     (define-key css-mode-map (kbd "s-:") 'pad-colon-and-maybe-semicolon)
     (define-key css-mode-map (kbd "s-{") 'open-brackets-newline-and-indent)
     (define-key css-mode-map (kbd "<s-return>") 'insert-empty-line)
     (define-key css-mode-map "\M-\C-x" 'slime-js-refresh-css)
     (define-key css-mode-map "\C-c\C-r" 'slime-js-embed-css)
     ))


(provide 'hemacs-stylesheets)
