(vendor 'coffee-mode)
(vendor 'handlebars-mode)
(vendor 'jade-mode)
(vendor 'js2-mode)
(vendor 'json-mode)

(autoload 'js2-mode "js2-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . handlebars-mode))
(add-to-list 'auto-mode-alist '("\\.mustache$" . handlebars-mode))

(eval-after-load 'coffee-mode
  '(progn

     (define-key coffee-mode-map (kbd "C-c s-r") 'coffee-compile-buffer)
     (define-key coffee-mode-map (kbd "C-l") 'js-insert-console)
     (define-key coffee-mode-map (kbd "#") 'string-interpolate)
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

(define-key js-mode-map (kbd "C-l") 'js-insert-console)
(define-key js-mode-map (kbd "s-{") 'open-curlies-and-indent)

(provide 'hemacs-javascripts)
