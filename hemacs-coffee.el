(require 'coffee-mode)

(defun pad-colon-function-arrow ()
  (interactive)
  (insert ": ->"))

(defun pad-colon-function-arrow-arguments ()
  (interactive)
  (insert ": () ->")
  (backward-char 4))

(defun coffee-function-newline-and-indent()
  (interactive)
  (insert "->")
  (coffee-newline-and-indent))

(defun coffee-function-with-args()
  (interactive)
  (insert "() ->")
  (coffee-newline-and-indent)
  (previous-line)
  (end-of-line)
  (backward-char 4))

(defun coffee-end-of-line-then-newline-and-indent ()
  "Insert an empty line after the current line and positon
the curson at its beginning, according to the current mode."
  (interactive)
  (end-of-line)
  (coffee-newline-and-indent))

(eval-after-load 'coffee-mode
  '(progn
     (electric-indent-mode -1)
     (setq coffee-tab-width 2)
     (define-key coffee-mode-map (kbd "<s-return>") 'coffee-end-of-line-then-newline-and-indent)
     (define-key coffee-mode-map (kbd "M-RET") 'coffee-function-newline-and-indent)
     (define-key coffee-mode-map (kbd "<C-return>") 'coffee-function-with-args)
     (define-key coffee-mode-map (kbd "C-:") 'pad-colon-function-arrow)
     (define-key coffee-mode-map (kbd "M-:") 'pad-colon-function-arrow-arguments)
     (define-key coffee-mode-map (kbd "C-c C-c") 'coffee-compile-buffer)
     (define-key coffee-mode-map (kbd "C-l") 'js-insert-console)
     (define-key coffee-mode-map (kbd "M-#") 'string-interpolate)
     ))

(provide 'hemacs-coffee)
