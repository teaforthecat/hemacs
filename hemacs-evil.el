(vendor 'evil)

(setq evil-default-cursor t)
(setq evil-shift-width 2)
;; (evil-mode 1)

(setq evil-default-state 'normal)

(define-key evil-normal-state-map ",s" 'ido-switch-buffer)
(define-key evil-normal-state-map ",f" 'ido-find-file)
(define-key evil-visual-state-map "\\" 'comment-or-uncomment-region-or-line)
(define-key evil-normal-state-map ",ms" 'magit-status)
(define-key evil-normal-state-map ",ml" 'magit-log)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(provide 'hemacs-evil)
