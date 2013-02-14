(require 'ace-jump-mode)
(require 'jump-char)

(global-set-key (kbd "s-m") 'ace-jump-mode)
(global-set-key (kbd "s-M") 'ace-jump-char-mode)
(global-set-key (kbd "M-m") 'jump-char-forward)
(global-set-key (kbd "M-M") 'jump-char-backward)
(global-set-key (kbd "s-n") 'bs-ace-jump-mode)

(defun add-hyper-char-to-ace-jump-word-mode (c)
  (define-key global-map
    (read-kbd-macro (concat "H-" (string c)))
    `(lambda ()
       (interactive)
       (setq ace-jump-query-char ,c)
       (setq ace-jump-current-mode 'ace-jump-word-mode)
       (ace-jump-do (concat "\\b"
                            (regexp-quote (make-string 1 ,c)))))))

(loop for c from ?0 to ?9 do (add-hyper-char-to-ace-jump-word-mode c))
(loop for c from ?A to ?Z do (add-hyper-char-to-ace-jump-word-mode c))
(loop for c from ?a to ?z do (add-hyper-char-to-ace-jump-word-mode c))

;; fast buffer switching with bs and ace-jump-mode
(setq bs-max-window-height 36
      bs-attributes-list (quote (("" 2 2 left "  ")
                                 ("" 1 1 left bs--get-marked-string)
                                 ("" 1 1 left bs--get-modified-string)
                                 ("" 1 1 left " ")
                                 ("Buffer" bs--get-name-length 20 left bs--get-name)
                                 ("" 1 1 left " ")
                                 ("File" 30 30 left bs--get-file-name)
                                 ("" 2 2 left "  "))))

(defun bs-ace-jump-end-hook ()
  (interactive)
  (if (string-match (buffer-name) "*buffer-selection*")
      (bs-select)))

(add-hook 'ace-jump-mode-end-hook 'bs-ace-jump-end-hook)

(defun bs-ace-jump-mode ()
  (interactive)
  (bs-show "all-intern-last")
  (setq ace-jump-mode-scope 'window)
  (call-interactively 'ace-jump-line-mode))

(provide 'hemacs-jump)
