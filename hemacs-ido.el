(require 'ido-ubiquitous)

(ido-mode t)
(ido-everywhere t)
(ido-ubiquitous t)

(setq ido-enable-flex-matching t ;; fuzzy matching
      ido-use-filename-at-point nil ;; don't guess based on cursor position
      ido-max-window-height 20
      ido-max-prospects 18)

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
(setq ido-decorations (quote ("\n=> " "" "\n   " "\n   ..." "[" "]" " [No match]"
                              " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

;; up/down should work as expected in vertical results
(defun ido-up-down-fix ()
  (define-key ido-completion-map [up] 'ido-prev-match)
  (define-key ido-completion-map [down] 'ido-next-match))

(add-hook 'ido-setup-hook 'ido-up-down-fix)

;; switch buffers in project by mode
(defun ido-for-mode-in-persp (prompt the-mode)
  (switch-to-buffer
   (ido-completing-read prompt
                        (save-excursion
                          (delq
                           nil
                           (mapcar (lambda (buf)
                                     (when (buffer-live-p buf)
                                       (with-current-buffer buf
                                         (and (eq major-mode the-mode)
                                              (buffer-name buf)))))
                                   (persp-buffers persp-curr)))))))

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
(defun ido-sort-mtime ()
  (setq ido-temp-list
        (sort ido-temp-list
              (lambda (a b)
                (time-less-p
                 (sixth (file-attributes (concat ido-current-directory b)))
                 (sixth (file-attributes (concat ido-current-directory a)))))))
  (ido-to-end  ;; move . files to end (again)
   (delq nil (mapcar
              (lambda (x) (and (char-equal (string-to-char x) ?.) x))
              ido-temp-list))))

(add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
(add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)

(provide 'hemacs-ido)
