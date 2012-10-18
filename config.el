(vendor 'expand-region)
(vendor 'deft)
(vendor 'cheat)
(vendor 'open-file-in-github)
(vendor 'ack-and-a-half)

;; (vendor 'evil)
;; (vendor 'switch-window)
;; (vendor 'autopair)
;; (vendor 'sackspace)
;; (vendor 'evil-rails)
;; (vendor 'smart-tab)
;; (vendor 'pabbrev)
;; (vendor 'growl)
;; (vendor 'enhanced-ruby-mode)
;; (vendor 'surround)

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
(setq recentf-max-saved-items 200)
(setq recentf-save-file "~/.emacs.d/recentf")
(setq savehist-file "~/.emacs.d/savehist")
(setq save-place-file "~/.emacs.d/places")
(savehist-mode t)
(recentf-mode t)

;; (setq vc-handled-backends ())

;; disable
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; tabs
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; forceful utf-8
(setq locale-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; shift + arrows to move around windows
(windmove-default-keybindings)
(setq windmove-wrap-around t)

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

(icomplete-mode +1)
(global-subword-mode 1)
(delete-selection-mode t)

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

;; ido
(vendor 'ido-ubiquitous)
(ido-mode t)
;; (ido-everywhere t)
(ido-ubiquitous t)
(setq ido-enable-flex-matching t)
(setq ido-use-virtual-buffers t) ;; include non-existent buffers
(setq ido-auto-merge-work-directories-length nil)
(setq ido-use-filename-at-point nil)
(setq ido-max-window-height 29)
(setq ido-max-prospects 25)
(add-to-list 'ido-ignore-files "\\.DS_Store")
(add-to-list 'ido-ignore-files "\\.ido.last")
(add-to-list 'ido-ignore-files "\\.loaddefs.el")
(add-to-list 'ido-ignore-directories "\#{var}")
(add-to-list 'ido-ignore-directories "tmp")
(add-to-list 'ido-ignore-directories "node_modules")
(add-to-list 'ido-ignore-directories "vendor")
(add-to-list 'ido-ignore-directories "public/system")

;; popwin
(vendor 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-height 0.4)
(push "*Bundler*" popwin:special-display-config)
(push "*Deft*" popwin:special-display-config)
(push "*rake*" popwin:special-display-config)
(push "*rails*" popwin:special-display-config)
(push "*magit-process*" popwin:special-display-config)
(push "*magit-edit-log*" popwin:special-display-config)
(push "*ruby*" popwin:special-display-config)
(push "*helm mini*" popwin:special-display-config)
(push '("*Foreman*" :position left :width .4 :noselect t) popwin:special-display-config)
;; (push '("*Ack-and-a-half*" :position left :width .4 :dedicated t) popwin:special-display-config)
(push '("*shell*" :position left :width .4) popwin:special-display-config)
(push '(dired-mode :position left :width .4) popwin:special-display-config)

;; magit
(vendor 'magit)
(vendor 'magithub)

(define-key magit-status-mode-map (kbd "C-x C-k") 'magit-kill-file-on-line)
(setq magit-process-popup-time 2)
;; (add-hook 'magit-post-command-hook 'popwin:close-popup-window)
;; (add-hook 'magit-push-command-hook 'magit-display-process)

;; hippie expand match order
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(defun hippie-expand-lines ()
  (interactive)
  (let ((hippie-expand-try-functions-list '(try-expand-line
                                            try-expand-line-all-buffers)))
    (hippie-expand nil)))

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

;; autocomplete
(vendor 'popup)
(vendor 'auto-complete)
(vendor 'readline-complete)
(global-auto-complete-mode t)

(dolist (mode '(yaml-mode
                html-mode
                nxml-mode
                sh-mode
                lisp-mode
                markdown-mode
                css-mode
                less-css-mode
                ruby-mode
                javascript-mode
                js-mode
                js2-mode
                js3-mode
                php-mode
                sass-mode
                slim-mode
                coffee-mode
                rhtml-mode
                mustache-mode
                haml-mode
                ))
   (add-to-list 'ac-modes mode))

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
