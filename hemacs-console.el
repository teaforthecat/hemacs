;; eshell related
(setq eshell-buffer-maximum-lines 256
      eshell-banner-message "")

;; comint/shell/term related
(setq comint-prompt-read-only t
      ;; comint-move-point-for-output t
      ;; comint-scroll-show-maximum-output t
      ;; comint-move-point-for-output 'all
      comint-buffer-maximum-size 256
      comint-process-echoes t
      comint-input-ignoredups t)

;; smaller fonts for shells
(add-hook 'eshell-mode-hook 'text-scale-decrease-one)
(add-hook 'comint-mode-hook 'text-scale-decrease-one)

(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
  (erase-buffer)))

;; force utf8 on I/O
(defun exec-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))

(add-hook 'comint-exec-hook 'exec-use-utf8)
(add-hook 'term-exec-hook 'exec-use-utf8)

;; (defadvice start-process (after advise-comint-coding-system)
;;   (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)
;;   )
;; (ad-activate 'start-process)

;; (define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
;; (define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)

(provide 'hemacs-console)
