(require 'expand-region)
(require 'change-inner)
(require 'multiple-cursors)
(require 'direx)

;; the undo tree
(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-Z") 'undo-tree-redo)

;; visual mark history navigation C-x [left/right]
(require 'back-button)
(back-button-mode 1)

;; popwin and file directory/tree navigation
(global-set-key (kbd "C-z") popwin:keymap)
(global-set-key (kbd "C-z d") 'dired-jump-other-window)
(global-set-key (kbd "C-z C-j") 'direx:jump-to-directory-other-window)

;; concentrate, focus power
(global-set-key (kbd "C-=") 'delete-other-windows)
(global-set-key (kbd "C-+") 'toggle-fullscreen)

;; keyboard scrolling
(global-set-key (kbd "s-,") 'next-line)
(global-set-key (kbd "s-.") 'previous-line)

;; meta+arrows move by subwords, w/ select to mark region
(global-set-key (kbd "<M-left>") 'left-subword)
(global-set-key (kbd "<M-right>") 'right-subword)

;; go to line with feedback
(global-set-key [remap goto-line] 'goto-line-with-feedback)

;; aligning, shifting
(global-set-key (kbd "C-x \\") 'align-regexp)

;; do what i mean
(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "s-u") 'duplicate-dwim)

;; hippie expand line
(global-set-key (kbd "C-/") 'hippie-expand-lines)

;; ace jump mode
(global-set-key (kbd "s-m") 'ace-jump-mode)
(global-set-key (kbd "s-M") 'ace-jump-char-mode)
(global-set-key (kbd "s-b") 'ace-jump-buff)

;; buffer cycling
(global-set-key (kbd "s-{") 'switch-to-prev-buffer)
(global-set-key (kbd "s-}") 'switch-to-next-buffer)

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

;; super+colon adds space
(global-set-key (kbd "s-:") 'pad-colon)

;; isearch uses region if available
(global-set-key (kbd "C-s") 'isearch-forward-use-region)
(global-set-key (kbd "C-r") 'isearch-backward-use-region)

;; necessities
(global-set-key (kbd "s-x") 'smex)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c O") 'github-browse-file)
(global-set-key (kbd "C-c o") 'find-or-create-file-at-point)

;; expand
(global-set-key (kbd "C-c C-z") 'simplezen-expand)

;; unset the unneeded
(global-unset-key (kbd "s-t")) ; ns-popup-font-panel
(global-unset-key (kbd "s-p")) ; ns-print-buffer
(global-unset-key (kbd "s-q")) ; save-all-buffers-kill-emacs
(global-unset-key (kbd "s-n")) ; make-frame


(provide 'hemacs-bindings)
