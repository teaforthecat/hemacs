(defun nice-scrolling ()
  "Turn on smooth buffered scrolling"
  (interactive)
  (make-local-variable 'scroll-margin)
  (make-local-variable 'scroll-conservatively)
  (make-local-variable 'scroll-preserve-screen-position)
  (setq scroll-margin 24)
  (setq scroll-conservatively 100000)
  (setq scroll-preserve-screen-position t)
  )

(defun no-nice-scrolling ()
  "Turn on smooth buffered scrolling"
  (interactive)
  (setq scroll-margin 0)
  (setq scroll-conservatively 1)
  (setq scroll-preserve-screen-position nil)
  )

;; smooth scrolling
(dolist (hook '(emacs-lisp-mode-hook
                html-mode-hook
                rhtml-mode-hook
                ruby-mode-hook
                css-mode-hook
                less-css-mode-hook
                sass-mode-hook
                scss-mode-hook
                slim-mode-hook
                coffee-mode-hook
                haml-mode-hook
                js-mode-hook
                js2-mode-hook
                mustache-mode-hook
                markdown-mode-hook
                ))
  (add-hook hook 'nice-scrolling))

(provide 'hemacs-scrolling)
