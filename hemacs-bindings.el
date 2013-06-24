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
;; (require 'back-button)
;; (back-button-mode 1)

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
(global-set-key (kbd "s-;") 'er/expand-region)
(global-set-key (kbd "s-'") 'mc/mark-next-like-this)
(global-set-key (kbd "s-\"") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c s-'") 'mc/mark-all-like-this-dwim)

;; camelCase snake_case conversion
(global-set-key (kbd "s-+") 'camelcase-word-or-region)
(global-set-key (kbd "s-_") 'snakecase-word-or-region)

;; change inner/outer
(global-set-key (kbd "s-i") 'change-inner)
(global-set-key (kbd "s-o") 'change-outer)

;; !! overrides
;; (global-set-key (kbd "C-g") 'keyboard-quit-or-abort-recursive-edit)
(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning)
(global-set-key (kbd "C-o") 'open-line-and-indent)
(global-set-key (kbd "s-w") 'persp-remove-current-buffer)

;; super+colon adds space
(global-set-key (kbd "s-:") 'pad-colon)

;; isearch uses region if available
(global-set-key (kbd "C-s") 'isearch-forward-use-region)
(global-set-key (kbd "C-r") 'isearch-backward-use-region)

;; necessities
(global-set-key (kbd "s-x") 'smex)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-x v p") 'git-messenger:popup-message)
(global-set-key (kbd "C-c O") 'github-browse-file)
(global-set-key (kbd "C-c o") 'find-or-create-file-at-point)

;; expand
(global-set-key (kbd "C-c C-z") 'simplezen-expand)

;; unset the unneeded
(global-unset-key (kbd "s-t")) ; ns-popup-font-panel
(global-unset-key (kbd "s-p")) ; ns-print-buffer
(global-unset-key (kbd "s-q")) ; save-all-buffers-kill-emacs
(global-unset-key (kbd "s-n")) ; make-frame

(global-set-key (kbd "M-RET") 'newline-dwim)

;; smarter minibuffer history cycling
(define-key minibuffer-local-map (kbd "TAB") 'previous-complete-history-element)
(define-key minibuffer-local-map (kbd "M-TAB") 'next-complete-history-element)

(global-set-key (kbd "C-c C-t") 'rtog/toggle-repl)

;; project shell
(global-set-key (kbd "C-c x") 'switch-to-or-create-project-shell)
(global-set-key (kbd "C-z x") 'popwin:project-shell)
(global-set-key (kbd "C-c m") 'project-async-command-to-buffer)
(global-set-key (kbd "C-c RET") 'project-async-command-in-background-and-growl-output)
(define-key comint-mode-map (kbd "C-c RET") 'project-async-command-in-background-and-growl-output)

(provide 'hemacs-bindings)
