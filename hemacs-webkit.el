;; (vendor 'json)
;; (vendor 'websocket)
;; (vendor 'kite)
;; open /Applications/Google\ Chrome.app --args --remote-debugging-port=9222

(require 'slime)
(require 'slime-js)

(set-default 'slime-js-connect-url "http://0.0.0.0:8009")
(set-default 'slime-js-swank-command "swank-js")
(set-default 'slime-js-browser-command "open -a \"Google Chrome\"")
(set-default 'slime-js-browser-jacked-in-p nil)

(defun slime-js-run-swank ()
  "Runs the swank side of the equation."
  (interactive)
  (apply #'make-comint "swank-js"  slime-js-swank-command nil slime-js-swank-args))

(defun slime-js-jack-in-browser ()
  "Start a swank-js server, connect to it, open a repl, open a browser, connect to that."
  (interactive)
  (let* ((slime-js-target-url (read-from-minibuffer "Site URL: " nil nil nil nil)))    
    (setq slime-protocol-version 'ignore)
    (slime-connect "localhost" 4005)
    (sleep-for 2)
    (slime-js-set-target-url (concat "http://" slime-js-target-url))
    (shell-command (concat slime-js-browser-command " " slime-js-connect-url))
    (sleep-for 3)
    (setq slime-remote-history nil)
    (slime-js-sticky-select-remote (caadr (slime-eval '(js:list-remotes))))
    (setq slime-js-browser-jacked-in-p t)
    (global-set-key [f5] 'slime-js-reload)))

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

(provide 'hemacs-webkit)

