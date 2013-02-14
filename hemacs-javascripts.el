(require 'js2-mode)
;; (require 'json-mode)

(autoload 'js2-mode "js2-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))

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
(define-key js-mode-map (kbd "s-{") 'open-brackets-newline-and-indent)
(define-key js-mode-map (kbd "RET") 'newline-and-indent)

(provide 'hemacs-javascripts)
