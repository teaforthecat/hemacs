(vendor 'expand-region)
(vendor 'deft)
(vendor 'cheat)
(vendor 'open-file-in-github)
(vendor 'ack-and-a-half)
;; (vendor 'evil)
;; (vendor 'sackspace)

;; always update files, i.e. after git pull
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

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

;; (setq vc-handled-backends ())

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
;; (setq max-lisp-eval-depth 100000)
(setq show-trailing-whitespace t)
(setq pop-up-windows nil)

(global-font-lock-mode t)
(tooltip-mode -1)

;; dired
(vendor 'dired-details)
(setq-default dired-details-hidden-string "- ")
(setq dired-use-ls-dired nil)
(dired-details-install)

(setq dired-auto-revert-buffer t)
(put 'dired-find-alternate-file 'disabled nil) ;; reuse current buffer by pressing 'a'
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  (define-key dired-mode-map (kbd "C-x C-k") 'dired-do-delete)
  ; up directory binding uses same buffer
  ))

;; magit
(vendor 'magit)
(vendor 'magithub)

(define-key magit-status-mode-map (kbd "C-x C-k") 'magit-kill-file-on-line)
(setq magit-process-popup-time 2)

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
                mustache-mode-hook
                ))
  (add-hook hook 'enter-as-newline-and-indent))

;; extensions
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
;; (add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache$" . mustache-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . mustache-mode))
(add-to-list 'auto-mode-alist '("\\.hamlbars$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Procfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gems" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.cfm" . html-mode))

(provide 'config)
