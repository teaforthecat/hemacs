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

;; !! overrides
(global-set-key (kbd "C-g") 'keyboard-quit-or-abort-recursive-edit)
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
(global-set-key (kbd "M-`") 'popwin:display-last-buffer)
(global-set-key (kbd "C-`") 'persp-switch-last)

;; killing, yanking
(global-set-key (kbd "s-V") 'yank-indented)
(global-set-key (kbd "s-u") 'dupe-line)
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'copy-whole-line)
(global-set-key (kbd "C-c C-k") 'kill-whole-line)

;; open files
(global-set-key (kbd "C-c o") 'find-or-create-file-at-point)
(global-set-key (kbd "C-c C-o") 'open-file-in-github)

;; override enter behavior
(global-set-key (kbd "<s-return>") 'insert-empty-line)
;; (global-set-key (kbd "RET") 'newline-and-indent)

;; lisp
(define-key emacs-lisp-mode-map (kbd "C-c e") 'eval-region)

(provide 'hemacs-bindings)
