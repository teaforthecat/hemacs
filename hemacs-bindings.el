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

;; hippie expand
(global-set-key (kbd "TAB") 'tab-dwim)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-?") 'hippie-expand-lines)

;; popup kill ring
(global-set-key (kbd "C-c y") 'popup-kill-ring)

;; shell
(define-key comint-mode-map (kbd "C-c <C-backspace>") 'clear-shell)

;; up/down cycle through input history at current input point
(define-key comint-mode-map (kbd "M-TAB") 'comint-previous-matching-input-from-input)
(define-key comint-mode-map (kbd "<C-tab>") 'comint-next-matching-input-from-input)

;; smarter minibuffer history cycling
(define-key minibuffer-local-map (kbd "M-TAB") 'previous-complete-history-element)
(define-key minibuffer-local-map (kbd "<C-Tab>") 'next-complete-history-element)

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

;; aligning, shifting
(global-set-key (kbd "C-x \\") 'align-regexp)

;; buffer cycling
(global-set-key (kbd "s-{") 'switch-to-prev-buffer)
(global-set-key (kbd "s-}") 'switch-to-next-buffer)

;; delete file
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; common editing manipulation
(global-set-key (kbd "s-u") 'duplicate-dwim)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "s-i") 'er/expand-region)
(global-set-key (kbd "s-o") 'mc/mark-next-like-this)
(global-set-key (kbd "s-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "s-O") 'mc/mark-all-like-this-dwim)
(global-set-key (kbd "s-+") 'camelcase-word-or-region)
(global-set-key (kbd "s-_") 'snakecase-word-or-region)
(global-set-key (kbd "s-;") 'change-inner)
(global-set-key (kbd "s-\"") 'change-outer)
(global-set-key (kbd "s-q") 'query-replace)
(global-set-key (kbd "s-k") 'kill-and-join-forward)

;; copy and paste
(global-set-key (kbd "M-w") 'copy-region-or-current-line)
(global-set-key (kbd "C-c k") 'copy-whole-line)
(global-set-key (kbd "C-c C-k") 'kill-whole-line)

;; !! overrides
;; (global-set-key (kbd "C-g") 'keyboard-quit-or-abort-recursive-edit)
(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning)
(global-set-key (kbd "C-o") 'open-line-and-indent)
(global-set-key (kbd "s-w") 'persp-remove-current-buffer)
(global-set-key (kbd "s-j") 'ace-jump-mode)

(global-set-key (kbd "C-c d") 'dash-at-point)
(global-set-key (kbd "C-c D") 'dash-at-point-with-docset)

;; super+colon adds space
(global-set-key (kbd "s-:") 'pad-colon)

;; isearch uses region if available
(global-set-key (kbd "C-s") 'isearch-forward-use-region)
(global-set-key (kbd "C-r") 'isearch-backward-use-region)

;; necessities
(global-set-key (kbd "s-x") 'smex)
(global-set-key (kbd "C-c o") 'find-or-create-file-at-point)

;; git related
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c O") 'github-browse-file)

(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-x r") 'git-gutter:revert-hunk)

;; expand snippets and shorthand
(global-set-key (kbd "C-c C-z") 'simplezen-expand)

;; unset the unneeded
(global-unset-key (kbd "s-t")) ; ns-popup-font-panel
(global-unset-key (kbd "s-n")) ; make-frame
(global-unset-key (kbd "s-m")) ; iconify-frame

;; new line modifiers
(global-set-key (kbd "M-RET") 'newline-dwim)

(global-set-key (kbd "C-c C-t") 'rtog/toggle-repl)

;; linum toggle
(global-set-key (kbd "C-c l t") 'linum-mode)

;; projector shell
(global-set-key (kbd "C-c x") 'switch-to-or-create-projector-shell)
(global-set-key (kbd "C-z x") 'popwin:projector-shell)
(global-set-key (kbd "C-c m") 'projector-async-command-projector-root)
(global-set-key (kbd "C-c RET") 'projector-async-command-current-directory)
(define-key comint-mode-map (kbd "C-c RET") 'projector-async-command-current-directory)

;; bindings helper
(require-package 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x x"))
(setq guide-key/popup-window-position 'bottom)
(guide-key-mode 1)  ; Enable guide-key-mode

(provide 'hemacs-bindings)
