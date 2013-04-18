(require 'sgml-mode)
(require 'slim-mode)
(require 'mmm-mode)
(require 'haml-mode)
(require 'yaml-mode)
(require 'handlebars-mode)
(require 'jade-mode)
(require 'tagedit)

(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (tagedit-add-experimental-features)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))

(define-key haml-mode-map (kbd "s-{") 'pad-brackets)
(define-key haml-mode-map (kbd "s->") 'arrow)
(define-key slim-mode-map (kbd "s-{") 'pad-brackets)

(setq haml-backspace-backdents-nesting nil)
(setq slim-backspace-backdents-nesting nil)

(provide 'hemacs-templating)
