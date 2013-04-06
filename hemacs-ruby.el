;; jump to and from definition with M-. / M-,
(autoload 'zossima-mode "zossima" "" t)
(add-hook 'ruby-mode-hook 'zossima-mode)

;; indentation fixing
(setq ruby-deep-indent-paren nil)

(defun ruby-insert-console ()
  (interactive)
  (insert "logger.info "))

(defun make-ruby-block()
  (interactive)
  (insert " do\n\nend")
  (indent-according-to-mode)
  (previous-line)
  (indent-according-to-mode))

(defun indent-and-ruby-end()
  (interactive)
  (insert " \n\nend")
  (indent-according-to-mode)
  (previous-line)
  (indent-according-to-mode))

(defun ruby-toggle-hash-syntax (beg end)
  "Toggle syntax of selected ruby hash literal between ruby 1.8 and 1.9 styles."
  (interactive "r")
  (save-excursion
    (goto-char beg)
    (cond
     ((save-excursion (search-forward "=>" end t))
      (replace-regexp ":\\([a-zA-Z0-9_]+\\) +=> +" "\\1: " nil beg end))
     ((save-excursion (re-search-forward "\\w+:" end t))
      (replace-regexp "\\([a-zA-Z0-9_]+\\):\\( *\\(?:\"\\(?:\\\"\\|[^\"]\\)*\"\\|'\\(?:\\'\\|[^']\\)*'\\|[a-zA-Z0-9_]+([^)]*)\\|[^,]+\\)\\)" ":\\1 =>\\2" nil beg end)))))

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "M-RET") 'make-ruby-block)
     (define-key ruby-mode-map (kbd "<C-return>") 'indent-and-ruby-end)
     (define-key ruby-mode-map (kbd "C-l") 'ruby-insert-console)
     (define-key ruby-mode-map (kbd "M-#") 'string-interpolate)
     (define-key ruby-mode-map (kbd "s->") 'arrow)
     (define-key ruby-mode-map (kbd "s-{") 'pad-brackets)
     (define-key ruby-mode-map (kbd "C-c :") 'ruby-toggle-hash-syntax)))

;; bundler bindings
(require 'bundler)
(global-set-key (kbd "C-c b i") 'bundle-install)
(global-set-key (kbd "C-c b u") 'bundle-update)
(global-set-key (kbd "C-c b o") 'bundle-open)
(global-set-key (kbd "C-c b c") 'bundle-console)

(provide 'hemacs-ruby)
