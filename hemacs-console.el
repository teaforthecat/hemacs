(ansi-color-for-comint-mode-on)

;; eshell related
(setq eshell-buffer-maximum-lines 256
      eshell-banner-message ""
      )

(add-hook 'eshell-mode-hook '(lambda ()
                               (text-scale-decrease 1)
                               ))

;; comint/shell/term related
(setq explicit-shell-file-name shell-path
      comint-prompt-read-only t
      ;; comint-move-point-for-output t
      ;; comint-scroll-show-maximum-output t
      ;; comint-move-point-for-output 'all
      comint-buffer-maximum-size 256
      comint-process-echoes t
      comint-input-ignoredups t)

(add-hook 'comint-mode-hook '(lambda ()
                               (text-scale-decrease 1)
                               ))

;; shell mode completion
(add-to-list 'ac-modes 'shell-mode)
(add-hook 'shell-mode-hook 'ac-rlc-setup-sources)

;; force utf8 on I/O
(defun exec-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))

(add-hook 'comint-exec-hook 'exec-use-utf8)
(add-hook 'term-exec-hook 'exec-use-utf8)

;; fix zsh term appearance, scale down
(defun zsh-term-hooks ()
  (setq term-default-bg-color (face-background 'default))
  (setq term-default-fg-color (face-foreground 'default))
  (text-scale-decrease 1)
  )

(add-hook 'term-mode-hook 'zsh-term-hooks)

(defun live-term-paste (&optional string)
 (interactive)
 (process-send-string
  (get-buffer-process (current-buffer))
  (if string string (current-kill 0))))

(defun live-term-hook ()
  (goto-address-mode)
  (define-key term-raw-map "\C-y" 'live-term-paste))

(add-hook 'term-mode-hook 'live-term-hook)

;; (defadvice start-process (after advise-comint-coding-system)
;;   (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)
;;   )
;; (ad-activate 'start-process)

;; (define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
;; (define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)

(provide 'hemacs-console)
