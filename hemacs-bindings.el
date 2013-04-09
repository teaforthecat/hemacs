;; concentrate, focus power
(global-set-key (kbd "C-=") 'delete-other-windows)
(global-set-key (kbd "C-+") 'toggle-fullscreen)

;; keyboard scrolling
(global-set-key (kbd "s-,") 'next-line)
(global-set-key (kbd "s-.") 'previous-line)

;; meta+arrows move by subwords, w/ select to mark region
(global-set-key (kbd "<M-left>") 'left-subword)
(global-set-key (kbd "<M-right>") 'right-subword)

;; aligning, shifting
(global-set-key (kbd "C-x \\") 'align-regexp)

;; comment dwim
(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line)

;; dupe dwim
(global-set-key (kbd "s-u") 'duplicate-current-line-or-region)

;; hippie expand line
(global-set-key (kbd "C-/") 'hippie-expand-lines)

;; ace jump mode
(global-set-key (kbd "s-m") 'ace-jump-mode)
(global-set-key (kbd "s-M") 'ace-jump-char-mode)
(global-set-key (kbd "s-b") 'hemacs-jump-buff)

;; delete file
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; regions
(global-set-key (kbd "s-'") 'er/expand-region)
(global-set-key (kbd "s-;") 'mc/mark-next-like-this)
(global-set-key (kbd "s-:") 'mc/mark-all-like-this-dwim)
(global-set-key (kbd "H-SPC") 'set-rectangular-region-anchor)

;; change inner/outer
(global-set-key (kbd "s-i") 'change-inner)
(global-set-key (kbd "s-o") 'change-outer)

;; !! overrides
;; (global-set-key (kbd "C-g") 'keyboard-quit-or-abort-recursive-edit)
(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning)
(global-set-key (kbd "C-o") 'open-line-and-indent)

;; super colon with space
(global-set-key (kbd "s-:") 'pad-colon)

;; necessities
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "s-x") 'smex)

;; toggling
(global-set-key (kbd "s-`") 'switch-to-previous-buffer)

;; open files
(global-set-key (kbd "C-c o") 'find-or-create-file-at-point)

;; unset the unneeded
(global-unset-key (kbd "s-t")) ; ns-popup-font-panel
(global-unset-key (kbd "s-p")) ; ns-print-buffer
(global-unset-key (kbd "s-q")) ; save-all-buffers-kill-emacs

(provide 'hemacs-bindings)
