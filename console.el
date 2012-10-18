(setq comint-prompt-read-only t)
(setq comint-move-point-for-output t)
;; (setq comint-scroll-show-maximum-output t)
(setq-default ansi-color-for-comint-mode t)
(setq comint-buffer-maximum-size 256)

(setq explicit-shell-file-name "zsh")
;; (setq explicit-bash-args '("-c" "export EMACS=; stty echo; zsh"))
(setq comint-process-echoes t)
(add-to-list 'ac-modes 'shell-mode)
(add-hook 'shell-mode-hook 'ac-rlc-setup-sources)

(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)


(defadvice ansi-term (after advise-ansi-term-coding-system-font-size-and-scrolling)
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)
  )

(ad-activate 'ansi-term)

(provide 'console)
