;; require crucial packages
(require 'ace-jump-mode)
(require 'popwin)
(require 'projectile)
(require 'expand-region)
(require 'change-inner)
(require 'multiple-cursors)
(require 'nav)
(require 'ag)

;; heavily relying on persp for projects
(require 'perspective)
(persp-mode t)

;; enable features
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; no auto saving or backup files
(setq auto-save-default nil)
(setq make-backup-files nil)

;; save cursor places in files and usage history
(require 'saveplace)
(require 'recentf)
(setq-default save-place t)
(setq recentf-max-saved-items 200)
(setq recentf-save-file "~/.emacs.d/recentf")
(setq savehist-file "~/.emacs.d/savehist")
(setq save-place-file "~/.emacs.d/places")
(setq history-delete-duplicates t)
(savehist-mode t)
(recentf-mode t)

;; clean up buffers over 2 hours old
(require 'midnight)
(setq midnight-period 7200) ;; (eq (* 2 60 60) "2 hours")

;; the undo tree
(require 'undo-tree)
(global-undo-tree-mode)

;; 80 character columns indicator
(require 'whitespace)
(setq fill-column 80)
(setq whitespace-style '(lines-tail))
(global-whitespace-mode t)

;; minibuffer
;; (setq minibuffer-auto-raise t)
(setq minibuffer-prompt-properties
      (quote
       (read-only
        t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))
(setq minibuffer-eldef-shorten-default t)
(minibuffer-electric-default-mode t)

;; smarter minibuffer history cycling
(define-key minibuffer-local-map [up] 'previous-complete-history-element)
(define-key minibuffer-local-map [down] 'next-complete-history-element)
(define-key minibuffer-local-map (kbd "TAB") 'completion-at-point)

;; visual mark history navigation
(require 'back-button)
(back-button-mode 1)

;; tab and indent always two spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq normal-erase-is-backspace 2)

;; forcefully applying utf-8
(setq locale-coding-system 'utf-8-unix)
(setq buffer-file-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix t)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; ack
(require 'ack-and-a-half)
(setq ack-and-a-half-arguments "--nosql")

;; meaningful uniqueness
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-after-kill-buffer-p t    ; rename after killing uniquified
      uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; smart M-x ido action
(require 'smex)
(smex-initialize)

;; treat camelcasing and underscoring as stop points
(global-subword-mode 1)

;; any key deletes active region
(delete-selection-mode t)

;; go to line with feedback
(global-set-key [remap goto-line] 'goto-line-with-feedback)

;; save hook
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'maybe-deactivate-mark)

(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR.")

;; convenience and prefs
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq show-trailing-whitespace t)
(setq pop-up-windows nil)
(setq max-lisp-eval-depth 100000)

;; writing helpers
(add-hook 'markdown-mode-hook 'visual-line-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)

;; pretty lambda
(add-hook 'prog-mode-hook 'pretty-lambdas)

;; (require 'jump-char)

;; (defun add-hyper-char-to-jump-char-mode (c)
;;   (define-key global-map
;;     (read-kbd-macro (concat "H-" (string c)))
;;     `(lambda ()
;;        (interactive)
;;        (setq jump-char-initial-char (make-string 1 ,c))
;;        (call-interactively 'jump-char-process-char)
;;        )))

;; (loop for c from ?0 to ?9 do (add-hyper-char-to-jump-char-mode c))
;; (loop for c from ?A to ?Z do (add-hyper-char-to-jump-char-mode c))
;; (loop for c from ?a to ?z do (add-hyper-char-to-jump-char-mode c))

(provide 'hemacs-base)
