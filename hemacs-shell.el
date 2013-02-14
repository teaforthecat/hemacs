(setq comint-prompt-read-only t
      comint-move-point-for-output t
      comint-scroll-show-maximum-output t
      comint-buffer-maximum-size 1000
      comint-process-echoes t
      comint-input-ignoredups t
      shell-completion-execonly t
      shell-prompt-pattern "^[^#$%>]*[#$%>] *")

;; force utf8 on I/O
;; (defun exec-use-utf8 ()
;;   (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))

(add-hook 'comint-mode-hook 'text-scale-decrease-one)
;; (add-hook 'comint-exec-hook 'exec-use-utf8)
;; (add-hook 'shell-mode-hook 'turn-off-auto-fill)

(defun clear-shell ()
  (interactive)
  (let ((old-max comint-buffer-maximum-size))
    (setq comint-buffer-maximum-size 0)
    (comint-truncate-buffer)
    (setq comint-buffer-maximum-size old-max)))

(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)
(define-key comint-mode-map (kbd "C-c <C-backspace>") 'clear-shell)

(provide 'hemacs-shell)
