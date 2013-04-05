;; (require 'rinari)
(require 'bundler)

;; indentation fixing
(setq ruby-deep-indent-paren nil)

(defun ruby-insert-console ()
  (interactive)
  (insert "logger.info "))

(eval-after-load 'ruby-mode
  '(progn

     ;; (define-key ruby-mode-map (kbd "RET") 'newline-and-indent)
     (define-key ruby-mode-map (kbd "M-RET") 'make-ruby-block)
     (define-key ruby-mode-map (kbd "<C-return>") 'indent-and-ruby-end)
     (define-key ruby-mode-map (kbd "C-l") 'ruby-insert-console)
     (define-key ruby-mode-map (kbd "M-#") 'string-interpolate)
     (define-key ruby-mode-map (kbd "s->") 'arrow)
     (define-key ruby-mode-map (kbd "s-{") 'pad-brackets)

     ))


;; bundler bindings
(global-set-key (kbd "C-c b i") 'bundle-install)
(global-set-key (kbd "C-c b u") 'bundle-update)
(global-set-key (kbd "C-c b o") 'bundle-open)
(global-set-key (kbd "C-c b c") 'bundle-console)

(provide 'hemacs-ruby)
