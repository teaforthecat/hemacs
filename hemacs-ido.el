(require 'ido-ubiquitous)

;; ido
(ido-mode t)
(ido-everywhere t)
(ido-ubiquitous t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t ;; include non-existent buffers
      ido-auto-merge-work-directories-length nil
      ido-use-filename-at-point nil
      ido-max-window-height 14
      ido-max-prospects 10

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

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME")))
        (file (ido-completing-read "Choose recent file: "
                          (mapcar (lambda (path)
                                    (replace-regexp-in-string home "~" path))
                                  recentf-list)
                          nil t)))
    (when file
      (find-file file))))

;; sort ido filelist by mtime instead of alphabetically
;; (add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
;; (add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)

;; (defun ido-sort-mtime ()
;;   (setq ido-temp-list
;;         (sort ido-temp-list
;;               (lambda (a b)
;;                 (time-less-p
;;                  (sixth (file-attributes (concat ido-current-directory b)))
;;                  (sixth (file-attributes (concat ido-current-directory a)))))))
;;   (ido-to-end  ;; move . files to end (again)
;;    (delq nil (mapcar
;;               (lambda (x) (and (char-equal (string-to-char x) ?.) x))
;;               ido-temp-list))))

(provide 'hemacs-ido)
