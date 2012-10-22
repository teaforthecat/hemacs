;; osx-ish style conveniency
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-w") 'kill-this-buffer)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "C-=") 'ns-toggle-fullscreen)

;; buffer hopping
(global-set-key (kbd "C-c r") 'recentf-ido-find-file)
(global-set-key (kbd "s-b") 'ido-switch-buffer)
(global-set-key (kbd "s-m") 'bs-ace-jump-buffer)

;; ack
(global-set-key (kbd "C-c a") 'ack-and-a-half)
(global-set-key (kbd "C-c C-a") 'ack-and-a-half-same)
(global-set-key (kbd "C-c f") 'ack-and-a-half-find-file) ;; faster than textmate find in project
(global-set-key (kbd "C-c F") 'ack-and-a-half-find-file-same)

;; keychord jumpchar
(key-chord-define-global "fg" 'jump-char-forward)
(key-chord-define-global "df" 'jump-char-backward)

;; keyboard scrolling
(global-set-key (kbd "s-,") 'next-line)
(global-set-key (kbd "s-.") 'previous-line)
(global-set-key (kbd "C-,") 'forward-paragraph)
(global-set-key (kbd "C-.") 'backward-paragraph)
(global-set-key (kbd "s-'") 'er/expand-region)

;; !! overrides
(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning)
(global-set-key (kbd "C-o") 'open-line-and-indent)
(global-set-key (kbd "C-k") 'kill-and-join-forward)
(global-set-key (kbd "M-w") 'save-region-or-current-line)
(global-set-key (kbd "C-/") 'hippie-expand-lines)
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)
(global-set-key (kbd "C-x 3") 'split-window-horizontally-previous-buffer-select)

;; popups
(global-set-key (kbd "C-z") popwin:keymap)
(global-set-key (kbd "C-z d") 'dired-jump-other-window)

;; necessities
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "s-x") 'smex)
(global-set-key (kbd "C-c h") 'helm-mini)
(define-key global-map (kbd "<M-S-return>") 'deft)

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

;; shortcuts for common patterns
(global-set-key (kbd "s->") 'arrow)
(global-set-key (kbd "s-{") 'open-curlies-and-indent)

(provide 'hemacs-bindings)
