(require 'sgml-mode)
(require 'slim-mode)
(require 'mmm-mode)
(require 'haml-mode)
(require 'yaml-mode)
(require 'handlebars-mode)
(require 'jade-mode)

(define-key haml-mode-map (kbd "s-{") 'pad-brackets)
(define-key haml-mode-map (kbd "s->") 'arrow)
(define-key slim-mode-map (kbd "s-{") 'pad-brackets)

(setq haml-backspace-backdents-nesting nil)
(setq slim-backspace-backdents-nesting nil)

(provide 'hemacs-templating)
