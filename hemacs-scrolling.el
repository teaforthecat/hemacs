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

(defun nice-log-scrolling ()
  "Turn on smooth buffered scrolling"
  (interactive)
  (make-local-variable 'comint-move-point-for-output)
  (make-local-variable 'scroll-margin)
  (make-local-variable 'scroll-conservatively)
  (make-local-variable 'comint-scroll-show-maximum-output)
  (setq comint-move-point-for-output 'others)
  (setq scroll-margin 1)
  (setq scroll-conservatively 100000)
  (setq comint-scroll-show-maximum-output t)
  )

(defun no-nice-scrolling ()
  "Turn on smooth buffered scrolling"
  (interactive)
  (setq scroll-margin 0)
  (setq scroll-conservatively 0)
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
                magit-log-mode-hook
                magit-mode-hook
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
