(require 'rinari)
(require 'bundler)
(require 'ruby-end)

(add-hook 'ruby-mode-hook 'robe-mode)
(push 'ac-source-robe ac-sources)

(dolist (regex '("\\.rake$" "\\.gemspec$" "\\.ru$" "Guardfile$" "Vagrantfile$"
                 "Rakefile$" "Gemfile$" "Capfile$" "Procfile$" "\\.rabl$"
                 "\\.gems$" "\\.feature$" "\\.builder$"))
  (add-to-list 'auto-mode-alist `(,regex . ruby-mode)))

;; indentation fixing
(setq ruby-deep-indent-paren nil)

(eval-after-load 'ruby-mode
  '(progn

     (ruby-end-mode +1)
     (subword-mode +1)

     (define-key ruby-mode-map (kbd "RET") 'newline-and-indent)
     (define-key ruby-mode-map (kbd "C-l") 'ruby-insert-console)
     (define-key ruby-mode-map (kbd "M-#") 'string-interpolate)
     (define-key ruby-mode-map (kbd "s->") 'arrow)
     (define-key ruby-mode-map (kbd "s-{") 'pad-brackets)

     ))

(provide 'hemacs-ruby)
