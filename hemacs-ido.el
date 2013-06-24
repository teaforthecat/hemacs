(require 'flx-ido)
(require 'ido-ubiquitous)
(require 'smex)

(ido-mode t)
(ido-everywhere t)
(ido-ubiquitous t)
(flx-ido-mode 1)
(ido-sort-mtime-mode 1)

(smex-initialize) ;; smart super-x ido action

(setq ido-enable-flex-matching t ;; fuzzy matching
      ido-use-filename-at-point nil ;; don't guess based on cursor position
      ido-auto-merge-work-directories-length -1 ;; don't merge to other dirs
      ido-max-window-height 20
      ido-max-prospects 18
      ido-use-faces nil)

(setq gc-cons-threshold 20000000) ;; flx memory optimization

(add-to-list 'ido-ignore-files "\\.DS_Store")
(add-to-list 'ido-ignore-files "\\.ido.last")
(add-to-list 'ido-ignore-files "\\.loaddefs.el")
(add-to-list 'ido-ignore-files "\\.gitkeep")
(add-to-list 'ido-ignore-buffers "^\\*Messages\\*")
(add-to-list 'ido-ignore-buffers "^\\*Help\\*")
(add-to-list 'ido-ignore-directories "tmp")
(add-to-list 'ido-ignore-directories "node_modules")
(add-to-list 'ido-ignore-directories "vendor")

;; vertical ido results!
(setq ido-decorations (quote ("\n=> " "" "\n   " "\n   ..."
                              "[" "]" " [No match]" " [Matched]"
                              " [Not readable]" " [Too big]" " [Confirm]")))

;; up/down should work as expected in vertical results
(defun ido-up-down-fix ()
  (define-key ido-completion-map [up] 'ido-prev-match)
  (define-key ido-completion-map [down] 'ido-next-match))

(add-hook 'ido-setup-hook 'ido-up-down-fix)

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

(provide 'hemacs-ido)
