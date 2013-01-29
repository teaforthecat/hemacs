(vendor 'expand-region)
(vendor 'change-inner)
(vendor 'multiple-cursors)
(vendor 'deft)
(vendor 'cheat)
(vendor 'regex-tool)

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
(setq recentf-max-saved-items 100)
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
(vendor 'undo-tree)
(global-undo-tree-mode)

;; minibuffer
;; (setq minibuffer-auto-raise t)
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

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

;; meaningful uniqueness
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-after-kill-buffer-p t    ; rename after killing uniquified
      uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

(vendor 'smex)
(smex-initialize)

(require 'textmate)
(textmate-mode)

(require 'perspective)
(persp-mode t)

;; treat camelcasing and underscoring as stop points
(global-subword-mode 1)

;; any key deletes active region
(delete-selection-mode t)

;; go to line with feedback
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

;; save hook
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'maybe-deactivate-mark)

(autoload 'zap-up-to-char "misc" "Kill up to, but not including ARGth occurrence of CHAR.")

;; convenience and prefs
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq show-trailing-whitespace t)
(setq pop-up-windows nil)
(setq max-lisp-eval-depth 100000)

;; file types
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.cfm" . html-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(provide 'hemacs-config)
