(require 'smart-tab)
(require 'auto-complete)
(require 'hippie-with-ac)
(require 'bash-completion)
(require 'shell-command)

(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
          'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions
          'bash-completion-dynamic-complete)

(shell-command-completion-mode)


;; hippie expand match order
(setq hippie-expand-try-functions-list '(try-expand-dabbrev-closest-first
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-expand-all-abbrevs
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(defun hippie-expand-lines ()
  (interactive)
  (let ((hippie-expand-try-functions-list '(try-expand-line
                                            try-expand-line-all-buffers)))
    (hippie-expand nil)))

(defun hippie-expand-no-case-fold ()
  (interactive)
  (let ((case-fold-search nil))
    (hippie-expand nil)))

;; autocomplete
(global-auto-complete-mode t)

;; set ac sources
(setq ac-sources
      '(ac-source-abbrev
        ac-source-dictionary
        ac-source-words-in-buffer
        ac-source-words-in-same-mode-buffers
        ac-source-css-property
        ac-source-words-in-all-buffer
        ac-source-files-in-current-dir))

;; tab should partially complete
(setq ac-dwim nil)

;; add modes
(dolist (mode '(yaml-mode
                markdown-mode
                less-css-mode
                ruby-mode
                js2-mode
                php-mode
                sass-mode
                slim-mode
                coffee-mode
                rhtml-mode
                mustache-mode
                haml-mode
                stylus-mode
                objc-mode
                ))
   (add-to-list 'ac-modes mode))

;; smart tab
(global-smart-tab-mode 1)

(provide 'hemacs-completion)
