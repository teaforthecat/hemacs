;; heavily relying on persp for projects
(require 'perspective)
(persp-mode t)

;; enable features
(require 'misc)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
;; (autoload 'zap-up-to-char "misc"
;;   "Kill up to, but not including ARGth occurrence of CHAR.")

;; no auto saving or backup files
(setq auto-save-default nil)
(setq make-backup-files nil)

;; save cursor places in files and usage history
(require 'saveplace)
(require 'recentf)
(setq-default save-place t)
(setq recentf-max-saved-items 200)
(setq recentf-save-file (expand-file-name "recentf" hemacs-dir))
(setq savehist-file (expand-file-name "savehist" hemacs-dir))
(setq save-place-file (expand-file-name "places" hemacs-dir))
(setq history-delete-duplicates t)
(savehist-mode t)
(recentf-mode t)

;; pairs
(require 'smartparens-config)
(smartparens-global-mode 1)
(show-smartparens-global-mode t)
(setq sp-autoescape-string-quote nil)

(sp-with-modes '(ruby-mode slim-mode)
  (sp-local-pair "|" "|"))

(sp-with-modes '(ruby-mode slim-mode)
  (sp-local-pair "\{ " " \\}"))

;; clean up buffers that are stale over 15 minutes every 2 hours
;; (setq midnight-period 7200 ;; 2x60x60 = "2 hours"
;;       clean-buffer-list-delay-special 900 ;; 15x60 = "15 minutes"
;;       clean-buffer-list-kill-regexps '("^.*$")
;;       clean-buffer-list-kill-never-regexps '("^ \\*Minibuf-.*\\*$" "\\\\*shell\\\\*.*"))
;; (require 'midnight)

;; 80 character columns indicator
;; (require 'whitespace)
;; (setq fill-column 80)
;; (setq whitespace-style '(lines-tail))
;; (global-whitespace-mode t)

;; autocomplete
;; (setq company-show-delay 0.4
;;       company-show-numbers t
;;       company-minimum-prefix-length 2)

;; minibuffer
;; (setq minibuffer-auto-raise t)
(setq minibuffer-prompt-properties
      (quote
       (read-only
        t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))
(setq minibuffer-eldef-shorten-default t) ;; shorten "(default ...)" to "[...]"
(minibuffer-electric-default-mode t)

;; forcefully applying utf-8
(set-selection-coding-system 'utf-8-unix) ;; copy/paste from other programs
(prefer-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; meaningful uniqueness
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "・"
      uniquify-after-kill-buffer-p t    ; rename after killing uniquified
      uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers
(require 'uniquify)

(delete-selection-mode t) ;; any key deletes active region

;; convenience and prefs
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq show-trailing-whitespace t)
(setq pop-up-windows nil)
(setq max-lisp-eval-depth 100000)
(setq ring-bell-function 'ignore)

;; org
(setq org-replace-disputed-keys t)
(setq org-src-fontify-natively t)

;; blogging
(require 'octomacs)
(setq octomacs-workdir-alist (quote (("waymondo blog" . "~/code/octopress"))))

;; templating
(require 'sgml-mode)
(require 'slim-mode)
(require 'mmm-mode)
(require 'haml-mode)
(require 'yaml-mode)
(require 'handlebars-mode)
(require 'jade-mode)
(require 'simplezen)

(setq haml-backspace-backdents-nesting nil)
(setq slim-backspace-backdents-nesting nil)

(provide 'hemacs-base)
