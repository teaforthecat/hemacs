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

;; (add-hook 'comint-exec-hook 'exec-use-utf8)
(add-hook 'comint-mode-hook 'text-scale-decrease-one)

;; (add-hook 'comint-exec-hook 'nice-shell-scrolling)
;; (add-hook 'shell-mode-hook 'turn-off-auto-fill)

;; (defun nice-shell-scrolling ()
;;   "Turn on smooth buffered scrolling"
;;   (interactive)
;;   (set (make-local-variable 'comint-move-point-for-output) t)
;;   (set (make-local-variable 'scroll-margin) 0)
;;   (set (make-local-variable 'scroll-conservatively) 0)
;;   (set (make-local-variable 'comint-scroll-to-bottom-on-input) t)
;;   (set (make-local-variable 'comint-scroll-show-maximum-output) t))

(defun clear-shell ()
  (interactive)
  (let ((old-max comint-buffer-maximum-size))
    (setq comint-buffer-maximum-size 0)
    (comint-truncate-buffer)
    (setq comint-buffer-maximum-size old-max)))

;; up/down to cycle through command history when on prompt line
(defun maybe-comint-next-input (arg)
  (interactive "p")
  (if (looking-back (concat comint-prompt-regexp ".*"))
      (comint-next-input arg)
    (next-line)))

(defun maybe-comint-previous-input (arg)
  (interactive "p")
  (if (looking-back (concat comint-prompt-regexp ".*"))
      (comint-previous-input arg)
    (previous-line)))

(define-key comint-mode-map [down] 'maybe-comint-next-input)
(define-key comint-mode-map [up] 'maybe-comint-previous-input)
(define-key comint-mode-map (kbd "C-c <C-backspace>") 'clear-shell)

(provide 'hemacs-shell)
