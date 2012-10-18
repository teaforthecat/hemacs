(vendor 'rinari)
(vendor 'bundler)
(vendor 'foreman)
(vendor 'heroku)
(vendor 'slim-mode)
(vendor 'rhtml-mode)
(vendor 'haml-mode)
(vendor 'yaml-mode)

(eval-after-load 'ruby-mode
  '(progn

     (ruby-end-mode +1)
     (subword-mode +1)
     ;; (define-key ruby-mode-map (kbd "<s-return>") 'insert-empty-line)
     ;; (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
     (define-key ruby-mode-map (kbd "C-l") 'ruby-insert-console)
     ))

(provide 'ruby)
