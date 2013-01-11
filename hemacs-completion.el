;; ido
(vendor 'ido-ubiquitous)
(ido-mode t)
;; (ido-everywhere t)
(ido-ubiquitous t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t ;; include non-existent buffers
      ido-auto-merge-work-directories-length nil
      ido-use-filename-at-point nil
      ido-max-window-height 16
      ido-max-prospects 12

      ;; vertical ido results!
      ido-decorations (quote ("\n=> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

(add-to-list 'ido-ignore-files "\\.DS_Store")
(add-to-list 'ido-ignore-files "\\.ido.last")
(add-to-list 'ido-ignore-files "\\.loaddefs.el")
(add-to-list 'ido-ignore-buffers "^\\*Messages\\*")
(add-to-list 'ido-ignore-buffers "^\\*Help\\*")
(add-to-list 'ido-ignore-buffers "^\\*Buffer")
(add-to-list 'ido-ignore-directories "\\.git/")
(add-to-list 'ido-ignore-directories "tmp")
(add-to-list 'ido-ignore-directories "node_modules")
(add-to-list 'ido-ignore-directories "vendor")
(add-to-list 'ido-ignore-directories "public/system")

;; sort ido filelist by mtime instead of alphabetically
(add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
(add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)

(defun ido-sort-mtime ()
  (setq ido-temp-list
        (sort ido-temp-list 
              (lambda (a b)
                (time-less-p
                 (sixth (file-attributes (concat ido-current-directory b)))
                 (sixth (file-attributes (concat ido-current-directory a)))))))
  (ido-to-end  ;; move . files to end (again)
   (delq nil (mapcar
              (lambda (x) (and (char-equal (string-to-char x) ?.) x))
              ido-temp-list))))

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

;; (setq ac-dwim nil)

;; (set-default 'ac-sources
;;              '(ac-source-dictionary
;;                ac-source-words-in-buffer
;;                ac-source-words-in-same-mode-buffers
;;                ac-source-words-in-all-buffer))

;; smart tab
;; (vendor 'smart-tab)
;; (global-smart-tab-mode 1)

(provide 'hemacs-completion)
