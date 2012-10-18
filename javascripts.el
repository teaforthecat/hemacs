(vendor 'coffee-mode)
(vendor 'mustache-mode)
(vendor 'jade-mode)

(eval-after-load 'coffee-mode
  '(progn

     (define-key coffee-mode-map (kbd "C-c s-r") 'coffee-compile-buffer)
     ;; (define-key coffee-mode-map (kbd "RET") 'newline)
     ;; (electric-pair-mode 0)
     (define-key coffee-mode-map (kbd "C-l") 'js-insert-console)
     ))

(add-hook 'js-mode-hook
          '(lambda ()
             (setq js-indent-level 2)
             ))

(eval-after-load 'js-mode
  '(progn
     (define-key javascript-mode-map (kbd "C-l") 'js-insert-console)
     ))

(provide 'javascripts)
