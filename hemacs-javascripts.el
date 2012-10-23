(vendor 'coffee-mode)
(vendor 'mustache-mode)
(vendor 'jade-mode)
(vendor 'js2-mode)

(autoload 'js2-mode "js2-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . mustache-mode))

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

(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)
            (setq js2-basic-offset 2)
            (setq js2-strict-missing-semi-warning nil)
            ))

(eval-after-load 'js2-mode
  '(progn
     (define-key js2-mode-map (kbd "C-l") 'js-insert-console)
     ))

(provide 'hemacs-javascripts)
