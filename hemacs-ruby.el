;; (vendor 'inf-ruby)
(vendor 'ruby-tools)
(vendor 'ruby-end)
(vendor 'rinari)
(vendor 'bundler)
(vendor 'foreman)
(vendor 'heroku)
(vendor 'slim-mode)
(vendor 'rhtml-mode)
(vendor 'haml-mode)
(vendor 'yaml-mode)

;; (autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
;; (autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t)
;; (eval-after-load 'ruby-mode
;;   '(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings))

(add-to-list 'auto-mode-alist '("\\.hamlbars$" . haml-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Procfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gems" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))

(setq ruby-deep-indent-paren nil
      ruby-end-insert-newline nil)

(defun foreman-start ()  
  (interactive)
  (let ((process-connection-type nil))
    (defvar *process-buffer-name* (concat "*" (persp-name persp-curr) " Foreman*"))
    (cd (shell-quote-argument (textmate-project-root)))
    (start-process *process-buffer-name* nil "foreman" "start")
    ;; (pop-to-buffer (get-buffer *process-buffer-name*))
    ;; (comint-mode)
    ;; (nice-log-scrolling)
    ;; (get-buffer *process-buffer-name*)
    ))

(eval-after-load 'ruby-mode
  '(progn

     (ruby-end-mode +1)
     (subword-mode +1)
     (define-key ruby-mode-map (kbd "C-l") 'ruby-insert-console)
     (define-key ruby-mode-map (kbd "#") 'string-interpolate)
     (define-key ruby-mode-map (kbd "s->") 'arrow)
     (define-key ruby-mode-map (kbd "s-{") 'open-curlies-and-indent)
     
     ))

(provide 'hemacs-ruby)
