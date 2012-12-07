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

(dolist (regex '("\\.rake$" "\\.gemspec$" "\\.ru$" "Guardfile$" "Vagrantfile$"
                 "Rakefile$" "Gemfile$" "Capfile$" "Procfile$" "\\.rabl$" "\\.gems$"))
  (add-to-list 'auto-mode-alist `(,regex . ruby-mode)))

(add-to-list 'auto-mode-alist '("\\.hamlbars$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))

;; indentation fixing
(setq ruby-deep-indent-paren nil)

;; (defadvice ruby-indent-line (after line-up-args activate)
;;   (let (indent prev-indent arg-indent)
;;     (save-excursion
;;       (back-to-indentation)
;;       (when (zerop (car (syntax-ppss)))
;;         (setq indent (current-column))
;;         (skip-chars-backward " \t\n")
;;         (when (eq ?, (char-before))
;;           (ruby-backward-sexp)
;;           (back-to-indentation)
;;           (setq prev-indent (current-column))
;;           (skip-syntax-forward "w_.")
;;           (skip-chars-forward " ")
;;           (setq arg-indent (current-column)))))
;;     (when prev-indent
;;       (let ((offset (- (current-column) indent)))
;;         (cond ((< indent prev-indent)
;;                (indent-line-to prev-indent))
;;               ((= indent prev-indent)
;;                (indent-line-to arg-indent)))
;;         (when (> offset 0) (forward-char offset))))))

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

(defun rails-console ()
  "Create a rails console process, if one doesn't exist. And switch to *rails-console* buffer."
  (interactive)
  (if (null (get-buffer "*rails-console*"))
      (progn
         (term "/bin/bash")
        (term-send-string (get-buffer-process "*terminal*") "rails console\n")
        (switch-to-buffer "*terminal*")
        (rename-buffer "*rails-console*")
        (term-line-mode))
    (switch-to-buffer "*rails-console*")))

(eval-after-load 'ruby-mode
  '(progn

     (ruby-end-mode +1)
     (subword-mode +1)
     (define-key ruby-mode-map (kbd "RET") 'newline-and-indent) 
     (define-key ruby-mode-map (kbd "C-l") 'ruby-insert-console)
     (define-key ruby-mode-map (kbd "M-#") 'string-interpolate)
     (define-key ruby-mode-map (kbd "s->") 'arrow)
     
     ))

(define-key haml-mode-map (kbd "s-{") 'pad-brackets)
(define-key haml-mode-map (kbd "s->") 'arrow)

(define-key slim-mode-map (kbd "s-{") 'pad-brackets)

(provide 'hemacs-ruby)
