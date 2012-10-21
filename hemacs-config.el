(vendor 'expand-region)
(vendor 'deft)
(vendor 'cheat)
(vendor 'evil)
;; (vendor 'sackspace)

;; ack searching `brew install ack`
(vendor 'ack-and-a-half)
(setq ack-and-a-half-arguments (quote ("--nosql")))

;; move autosave and backup files out of project workspaces
(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; save cursor places in files and usage history
(require 'saveplace)
(require 'recentf)
(setq-default save-place t)
(setq recentf-max-saved-items 100)
(setq recentf-save-file "~/.emacs.d/recentf")
(setq savehist-file "~/.emacs.d/savehist")
(setq save-place-file "~/.emacs.d/places")
(savehist-mode t)
(recentf-mode t)

(vendor 'undo-tree)
(global-undo-tree-mode)

;; tabs
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; forceful utf-8
(setq locale-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

(setq uniquify-buffer-name-style 'forward
      uniquify-separator " • "
      uniquify-after-kill-buffer-p t    ; rename after killing uniquified
      uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;;enable cua-mode for rectangular selections
;; (require 'cua-base)
;; (require 'cua-gmrk)
;; (require 'cua-rect)
;; (cua-mode 1)
;; (setq cua-enable-cua-keys nil)

(vendor 'smex)
(smex-initialize)

(vendor 'key-chord)
(key-chord-mode 1)

(require 'textmate)
(textmate-mode)

(require 'perspective)
(persp-mode t)

(vendor 'ace-jump-mode)
(vendor 'jump-char)

(vendor 'helm)
(require 'helm-config)

(global-subword-mode 1)
(delete-selection-mode t)
(setq normal-erase-is-backspace 2)

;; convenience and prefs
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq show-trailing-whitespace t)
(setq pop-up-windows nil)
;; (setq max-lisp-eval-depth 100000)

;; smooth scrolling
(dolist (hook '(emacs-lisp-mode-hook
                html-mode-hook
                rhtml-mode-hook
                ruby-mode-hook
                css-mode-hook
                less-css-mode-hook
                sass-mode-hook
                scss-mode-hook
                slim-mode-hook
                coffee-mode-hook
                haml-mode-hook
                js-mode-hook
                js2-mode-hook
                mustache-mode-hook
                ))
  (add-hook hook 'nice-scrolling))

;; override enter
(dolist (hook '(emacs-lisp-mode-hook
                html-mode-hook
                rhtml-mode-hook
                ruby-mode-hook
                css-mode-hook
                less-css-mode-hook
                slim-mode-hook
                ;; coffee-mode-hook
                haml-mode-hook
                js-mode-hook
                js2-mode-hook
                mustache-mode-hook
                ))
  (add-hook hook 'enter-as-newline-and-indent))

;; file types
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.cfm" . html-mode))

(provide 'hemacs-config)
