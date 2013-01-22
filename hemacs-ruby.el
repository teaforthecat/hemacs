(vendor 'ruby-tools)
(vendor 'ruby-end)
(vendor 'rinari)
(vendor 'bundler)
(vendor 'foreman)
(vendor 'heroku)

(dolist (regex '("\\.rake$" "\\.gemspec$" "\\.ru$" "Guardfile$" "Vagrantfile$"
                 "Rakefile$" "Gemfile$" "Capfile$" "Procfile$" "\\.rabl$" "\\.gems$"))
  (add-to-list 'auto-mode-alist `(,regex . ruby-mode)))

;; indentation fixing
(setq ruby-deep-indent-paren nil)

;; (defun foreman-start ()
;;   (interactive)
;;   (let ((process-connection-type nil))
;;     (defvar *process-buffer-name* (concat "*" (persp-name persp-curr) " Foreman*"))
;;     (cd (shell-quote-argument (textmate-project-root)))
;;     (start-process *process-buffer-name* nil "foreman" "start")
;;     ;; (pop-to-buffer (get-buffer *process-buffer-name*))
;;     ;; (comint-mode)
;;     ;; (nice-log-scrolling)
;;     ;; (get-buffer *process-buffer-name*)
;;     ))

;; (defun rails-console ()
;;   "Create a rails console process, if one doesn't exist. And switch to *rails-console* buffer."
;;   (interactive)
;;   (if (null (get-buffer "*rails-console*"))
;;       (progn
;;          (term "/usr/local/bin/bash")
;;         (term-send-string (get-buffer-process "*terminal*") "rails console\n")
;;         (switch-to-buffer "*terminal*")
;;         (rename-buffer "*rails-console*")
;;         (term-line-mode))
;;     (switch-to-buffer "*rails-console*")))

(eval-after-load 'ruby-mode
  '(progn

     (ruby-end-mode +1)
     (subword-mode +1)

     (define-key ruby-mode-map (kbd "RET") 'newline-and-indent)
     (define-key ruby-mode-map (kbd "C-l") 'ruby-insert-console)
     (define-key ruby-mode-map (kbd "M-#") 'string-interpolate)
     (define-key ruby-mode-map (kbd "s->") 'arrow)
     (define-key ruby-mode-map (kbd "s-{") 'pad-brackets)

     ))

(provide 'hemacs-ruby)
