(require 'bs)
(require 'ace-jump-mode)
(require 'perspective)

;; simple layout, increase window height
(setq bs-max-window-height 30
      bs-attributes-list (quote (("" 2 2 left " ")
                                 ("" 1 1 left bs--get-marked-string)
                                 ("" 1 1 left " ")
                                 ("Buffer" bs--get-name-length 10 left bs--get-name))))

;; filter buffers to current perspective
(add-to-list 'bs-configurations
             '("persp" nil nil nil
               (lambda (buf)
                 (with-current-buffer buf
                   (not (member buf (persp-buffers persp-curr)))))) nil)

;; on end of ace jump, select buffer
(defun bs-ace-jump-end-hook ()
  (if (string-match (buffer-name) "*buffer-selection*")
      (bs-select)))

(add-hook 'ace-jump-mode-end-hook 'bs-ace-jump-end-hook)

(defun hemacs-jump-buff ()
  (interactive)
  (bs--show-with-configuration "persp")
  (setq ace-jump-mode-scope 'window)
  (call-interactively 'ace-jump-line-mode))

(global-set-key (kbd "s-b") 'hemacs-jump-buff)

(provide 'hemacs-jump-buff)
