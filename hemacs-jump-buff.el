(require 'bs)
(require 'ace-jump-mode)
(require 'perspective)

;; simple layout, increase window height
(setq-default ace-jump-buff-on nil
              bs-header-lines-length 0
              bs-max-window-height 26
              bs-attributes-list (quote (("" 2 2 left " ")
                                 ("" 1 1 left bs--get-marked-string)
                                 ("" 1 1 left " ")
                                 ("Buffer" bs--get-name-length 10 left bs--get-name))))
;; don't show bs header
(defadvice bs--show-header (around maybe-disable-bs-header activate)
  (if nil ad-do-it))

;; filter buffers to current perspective
(add-to-list 'bs-configurations
             '("persp" nil nil nil
               (lambda (buf)
                 (with-current-buffer buf
                   (not (member buf (persp-buffers persp-curr)))))) nil)

;; on end of ace jump, select buffer
(defun ace-jump-buff-end-hook ()
  (if (string-match (buffer-name) "*buffer-selection*")
      (bs-select)))

(add-hook 'ace-jump-mode-end-hook 'ace-jump-buff-end-hook)

(defun ace-jump-buff ()
  (interactive)
  (setq ace-jump-buff-on t)
  (setq ace-jump-mode-scope 'window)
  (bs--show-with-configuration "persp")
  (beginning-of-buffer)
  (call-interactively 'ace-jump-line-mode))

;; ;; turn off ace-jump-buff on ace-jump-done
;; (defadvice ace-jump-done (after turn-off-ace-jump-buff-keys activate)
;;   (setq ace-jump-buff-on nil))

;; ;; escape!
;; (defun ace-jump-buff-exit ()
;;   (interactive)
;;   (ace-jump-done)
;;   (bs-kill)
;;   (kill-buffer "*buffer-selection*"))

(provide 'hemacs-jump-buff)
