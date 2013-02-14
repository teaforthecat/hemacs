(require 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(eval-after-load 'coffee-mode
  '(progn
     (electric-indent-mode -1)
     (setq coffee-tab-width 2)
     (define-key coffee-mode-map (kbd "C-:") 'pad-colon-function-arrow)
     (define-key coffee-mode-map (kbd "M-:") 'pad-colon-function-arrow-arguments)
     (define-key coffee-mode-map (kbd "C-c C-c") 'coffee-compile-buffer)
     (define-key coffee-mode-map (kbd "C-l") 'js-insert-console)
     (define-key coffee-mode-map (kbd "M-#") 'string-interpolate)
     ))

(provide 'hemacs-coffee)
