;; use bash completion
(require 'bash-completion)
(bash-completion-setup)

(setq-default comint-prompt-read-only t
              comint-move-point-for-output t
              comint-scroll-show-maximum-output t
              comint-process-echoes t
              ;; comint-buffer-maximum-size 1000
              comint-input-ignoredups t
              ;; shell-completion-execonly t
              ;; shell-prompt-pattern "^[^#$%>]*[#$%>] *"
              )

(setq process-read-adaptive-buffering nil) ;; helps with log tailing and mass shell output writing

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

(provide 'hemacs-shell)
