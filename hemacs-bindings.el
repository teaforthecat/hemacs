(global-set-key (kbd "C-x \\") 'align-regexp)

;; font scaling
(global-set-key (kbd "C-=") 'delete-other-windows)
(global-set-key (kbd "C-+") 'ns-toggle-fullscreen)

;; buffer hopping
(global-set-key (kbd "C-c r") 'recentf-ido-find-file)
(global-set-key (kbd "s-b") 'ido-switch-buffer)

;; keyboard scrolling
(global-set-key (kbd "s-,") 'next-line)
(global-set-key (kbd "s-.") 'previous-line)
(global-set-key (kbd "C-,") 'forward-paragraph)
(global-set-key (kbd "C-.") 'backward-paragraph)

;; delete file
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; regions
(global-set-key (kbd "s-'") 'er/expand-region)
(global-set-key (kbd "s-;") 'mc/mark-next-like-this)
(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)

;; !! overrides
;; (global-set-key (kbd "C-g") 'keyboard-quit-or-abort-recursive-edit)
(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning)
(global-set-key (kbd "C-o") 'open-line-and-indent)
(global-set-key (kbd "C-/") 'hippie-expand-lines)
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)
(global-set-key (kbd "C-x 3") 'split-window-horizontally-previous-buffer-select)
(global-set-key (kbd "s-:") 'pad-colon)

;; necessities
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "s-x") 'smex)

;; (global-set-key (kbd "C-c h") 'helm-mini)
;; (define-key global-map (kbd "<M-S-return>") 'deft)

;; toggling
(global-set-key (kbd "s-`") 'switch-to-previous-buffer)
;; (global-set-key (kbd "C-`") 'persp-switch-last)

;; open files
(global-set-key (kbd "C-c o") 'find-or-create-file-at-point)

;; override enter behavior
(global-set-key (kbd "<s-return>") 'insert-empty-line)
;; (global-set-key (kbd "RET") 'newline-and-indent)

;; unset the unneeded
(global-unset-key (kbd "s-p")) ; ns-print-buffer
(global-unset-key (kbd "s-q")) ; save-all-buffers-kill-emacs

(provide 'hemacs-bindings)
