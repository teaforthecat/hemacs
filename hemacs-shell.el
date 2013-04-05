(require 'bash-completion)
;; (require 'shell-command)

;; use bash tab completion
(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
          'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions
          'bash-completion-dynamic-complete)

(shell-command-completion-mode)

(setq comint-prompt-read-only t
      ;; comint-move-point-for-output t
      comint-scroll-show-maximum-output t
      process-read-adaptive-buffering nil
      ;; comint-process-echoes t
      ;; comint-buffer-maximum-size 1000
      comint-input-ignoredups t
      ;; shell-completion-execonly t
      ;; shell-prompt-pattern "^[^#$%>]*[#$%>] *"
)

;; force utf8 on I/O
;; (defun exec-use-utf8 ()
;;   (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))

;; (add-hook 'comint-exec-hook 'exec-use-utf8)
;; (add-hook 'shell-mode-hook 'turn-off-auto-fill)

(add-hook 'comint-mode-hook 'lambda () (text-scale-decrease 1))

;; persist shell and REPL command history
(defun comint-write-history-on-exit (process event)
  (comint-write-input-ring)
  (let ((buf (process-buffer process)))
    (when (buffer-live-p buf)
      (with-current-buffer buf
        (insert (format "\nProcess %s %s" process event))))))

(defun turn-on-comint-history ()
  (let ((process (get-buffer-process (current-buffer))))
    (when process
      (setq comint-input-ring-file-name
            (format "~/.emacs.d/inferior-%s-history"
                    (process-name process)))
      (comint-read-input-ring)
      (set-process-sentinel process
                            #'comint-write-history-on-exit))))

(defun comint-write-input-ring-all-buffers ()
  (mapc-buffers 'comint-write-input-ring))

(add-hook 'inferior-ruby-mode-hook 'turn-on-comint-history)
(add-hook 'kill-buffer-hook 'comint-write-input-ring)
(add-hook 'kill-emacs-hook 'comint-write-input-ring-all-buffers)

;; clear shell buffer command
(defun clear-shell ()
  (interactive)
  (let ((old-max comint-buffer-maximum-size))
    (setq comint-buffer-maximum-size 0)
    (comint-truncate-buffer)
    (setq comint-buffer-maximum-size old-max)))

(define-key comint-mode-map (kbd "C-c <C-backspace>") 'clear-shell)

;; up/down cycle through input history at current input point
(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)

(provide 'hemacs-shell)
