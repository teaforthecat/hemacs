;; (vendor 'jump-char)
(vendor 'ace-jump-mode)

(global-set-key (kbd "s-m") 'ace-jump-mode)
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

;; hot ace jump buffer selection
(defun bs-ace-jump-end-hook ()
  (interactive)
  (if (string-match (buffer-name) "*buffer-selection*")
      (bs-select)
    ))

(add-hook 'ace-jump-mode-end-hook 'bs-ace-jump-end-hook)

(defun bs-ace-jump-mode ()
  (interactive)
  (bs-show "sorted")
  (ace-jump-mode)
  )

(provide 'hemacs-jump)
