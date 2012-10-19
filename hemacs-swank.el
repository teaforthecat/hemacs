(require 'slime)
(require 'slime-js)

;; (setq inferior-lisp-program "/usr/local/bin/sbcl") ; `brew install sbcl`
;; (load "~/.emacs.d/vendor/slime.el/contrib/slime-repl.el")
;; (slime-setup)

(set-default 'slime-js-connect-url "http://0.0.0.0:8009")
(set-default 'slime-js-swank-command "swank-js")
(set-default 'slime-js-browser-command "open -a \"Google Chrome\"")
(set-default 'slime-js-browser-jacked-in-p nil)

(defun slime-js-run-swank ()
  "Runs the swank side of the equation."
  (interactive)
  (apply #'make-comint "swank-js"  slime-js-swank-command nil slime-js-swank-args))

(defun slime-js-coffee-eval-current ()
  (interactive)
  (coffee-compile-region (point) (mark))
  (switch-to-buffer coffee-compiled-buffer-name) 
  (slime-js-eval-buffer)
  (kill-buffer coffee-compiled-buffer-name))

(defun slime-js-coffee-eval-buffer ()
  (interactive)
  (coffee-compile-buffer)
  (switch-to-buffer coffee-compiled-buffer-name) 
  (slime-js-eval-buffer)
  (kill-buffer coffee-compiled-buffer-name))

(provide 'hemacs-swank)
