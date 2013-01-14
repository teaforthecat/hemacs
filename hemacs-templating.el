(vendor 'slim-mode)
(vendor 'rhtml-mode)
(vendor 'haml-mode)
(vendor 'yaml-mode)
(vendor 'handlebars-mode)
(vendor 'jade-mode)

(add-to-list 'auto-mode-alist '("\\.hamlbars$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . handlebars-mode))
(add-to-list 'auto-mode-alist '("\\.mustache$" . handlebars-mode))

(define-key haml-mode-map (kbd "s-{") 'pad-brackets)
(define-key haml-mode-map (kbd "s->") 'arrow)
(define-key slim-mode-map (kbd "s-{") 'pad-brackets)

(provide 'hemacs-templating)
