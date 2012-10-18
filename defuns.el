(defun string-rtrim (str)
  "Remove trailing whitespace from `STR'."
  (replace-regexp-in-string "[ \t\n]*$" "" str))

(defun yank-indented ()
  (interactive)
  (let ((start (point)))
    (yank)
    (indent-region start (point))
    (indent-according-to-mode)
    ))

(defun shift-text (distance)
  (if (use-region-p)
      (let ((mark (mark)))
        (save-excursion
          (indent-rigidly (region-beginning)
                          (region-end)
                          distance)
          (push-mark mark t t)
          (setq deactivate-mark nil)))
    (indent-rigidly (line-beginning-position)
                    (line-end-position)
                    distance)))

(defun shift-right (count)
  (interactive "p")
  (shift-text count))

(defun shift-left (count)
  (interactive "p")
  (shift-text (- count)))

(defun copy-line (arg)
  "Copy to end of line, or as many lines as prefix argument"
  (interactive "P")
  (if (null arg)
      (copy-to-end-of-line)
    (copy-whole-lines (prefix-numeric-value arg))))

(defun find-git-repo (dir)
  (if (string= "/" dir)
      (message "not in a git repo.")
    (if (file-exists-p (expand-file-name ".git/" dir))
        dir
      (find-git-repo (expand-file-name "../" dir)))))

(defun copy-to-end-of-line ()
  (interactive)
  (kill-ring-save (point)
                  (line-end-position))
  (message "Copied to end of line"))

(defun copy-whole-lines (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defun save-region-or-current-line (arg)
  (interactive "P")
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (copy-line arg)))

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

;; define as yank-command for delsel.el
(put 'yank-indented 'delete-selection 'yank-indented)

(defun kill-and-join-forward (&optional arg)
  "If at end of line, join with following; otherwise kill line. Deletes whitespace at join."
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (delete-indentation t)
    (kill-line arg)))

;; (defun yank-and-indent ()
;;   "Yank and then indent the newly formed region according to mode."
;;   (interactive)
;;   (yank)
;;   (call-interactively 'indent-region))

;; (defun add-auto-mode (mode &rest patterns)
;;   "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
;;   (dolist (pattern patterns)
;;     (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun finder ()
  "Open the current working directory in finder."
  (interactive)
  (shell-command (concat "open " (shell-quote-argument default-directory))))

(defun width-80 ()
  (interactive)
  (set-window-margins (selected-window) 0 0)
  (let ((marginwidth (/ (- (window-width) 80) 2)))
    (set-window-margins (selected-window) marginwidth marginwidth)))

(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((not (= (count-windows) 2))
         (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (first (window-list)))
                (w2 (second (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1)))))

(defun shell-other-window (&optional buffer)
  (interactive
   (list
    (and current-prefix-arg
         (prog1
             (read-buffer "Shell buffer: "
                          (generate-new-buffer-name "*shell*"))
           (if (file-remote-p default-directory)
               ;; It must be possible to declare a local default-directory.
               ;; FIXME: This can't be right: it changes the default-directory
               ;; of the current-buffer rather than of the *shell* buffer.
               (setq default-directory
                     (expand-file-name
                      (read-directory-name
                       "Default directory: " default-directory default-directory
                       t nil))))))))
  (let ((buffer (save-window-excursion
                  (shell buffer))))
    (switch-to-buffer-other-window buffer)))

(defun find-file-in-project-other-window ()
  "Find a file in the current project in the other window."
  (interactive)
  (let ((buffer (save-window-excursion (find-file-in-project))))
    (switch-to-buffer-other-window buffer)))

(defun copy-whole-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defun nice-scrolling ()
  "Turn on smooth buffered scrolling"
  (interactive)
  (make-local-variable 'scroll-margin)
  (make-local-variable 'scroll-conservatively)
  (make-local-variable 'scroll-preserve-screen-position)
  (setq scroll-margin 20)
  (setq scroll-conservatively 100000)
  (setq scroll-preserve-screen-position t)
  )

(defun no-nice-scrolling ()
  "Turn on smooth buffered scrolling"
  (interactive)
  (setq scroll-margin 0)
  (setq scroll-conservatively 1)
  (setq scroll-preserve-screen-position nil)
  )

(defun split-window-horizontally-previous-buffer-select ()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (switch-to-buffer (other-buffer))
  )

(defun delete-this-file ()
  (interactive)
  (or (buffer-file-name) (error "no file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(add-hook 'prog-mode-hook 'pretty-lambdas)

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8)
  (indent-buffer))

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun lorem ()
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

(defun dupe-line ()
  (interactive)
  (beginning-of-line)
  (copy-region-as-kill (point) (progn (end-of-line) (point)))
  (textmate-next-line)
  (yank)
  (beginning-of-line)
  (indent-according-to-mode))

(defun bckwrd-kill-line ()
  (interactive)
  (kill-line 0))

(defun arrow ()
  (interactive)
  (insert " => "))

(defun open-curlies-and-indent()
  (interactive)
  (insert " {\n\n}")
  (indent-according-to-mode)
  (previous-line)
  (indent-according-to-mode))

(defun insert-space-and-semicolon()
  (interactive)
  (insert ": ;")
  (backward-char))

(defun word-count ()
  (interactive)
  (shell-command-on-region (point-min) (point-max) "wc -w"))

(defun maximize-other-window ()
  (interactive)
  (other-window 1)
  (delete-other-windows))

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer))
  )

(defun hexcolour-luminance (color)
  "Calculate the luminance of a color string (e.g. \"#ffaa00\", \"blue\").
  This is 0.3 red + 0.59 green + 0.11 blue and always between 0 and 255."
  (let* ((values (x-color-values color))
         (r (car values))
         (g (cadr values))
         (b (caddr values)))
    (floor (+ (* .3 r) (* .59 g) (* .11 b)) 256)))

(defun js-insert-console ()
  (interactive)
  (insert "console.log()")
  (backward-char))

(defun ruby-insert-console ()
  (interactive)
  (insert "logger.info "))

(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory "~/.emacs.d" 0))

(defun close-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun cleanup-on-save ()
  (add-hook 'before-save-hook 'cleanup-buffer))

(defun insert-empty-line ()
  "Insert an empty line after the current line and positon
the curson at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (open-line 1)
  (next-line 1)
  (indent-according-to-mode))

(defun open-with ()
  "Simple function that allows us to open the underlying
file of a buffer in an external program."
  (interactive)
  (when buffer-file-name
    (shell-command (concat
                    (if (eq system-type 'darwin)
                        "open"
                      (read-shell-command "Open current file with: "))
                    " "
                    buffer-file-name))))

(defun string-join (separator strings)
  "Join all STRINGS using SEPARATOR."
  (mapconcat 'identity strings separator))

;; (defun my-shell-command (command &optional output-buffer error-buffer)
;;   "Run a shell command with the current file (or marked dired files).
;; In the shell command, the file(s) will be substituted wherever a '%' is."
;;   (interactive (list (read-from-minibuffer "Shell command: "
;;                                            nil nil nil 'shell-command-history)
;;                      current-prefix-arg
;;                      shell-command-default-error-buffer))
;;   (cond ((buffer-file-name)
;;          (setq command (replace-regexp-in-string "%" (buffer-file-name) command nil t)))
;;         ((and (equal major-mode 'dired-mode) (save-excursion (dired-move-to-filename)))
;;          (setq command (replace-regexp-in-string "%" (mapconcat 'identity (dired-get-marked-files) " ") command nil t))))
;;   (shell-command command output-buffer error-buffer))


(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (error "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file filename new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)
               (message "File '%s' successfully renamed to '%s'" name (file-name-nondirectory new-name))))))))

(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun find-or-create-file-at-point ()
  "Guesses what parts of the buffer under point is a file name and opens it."
  (interactive)
  (find-file (file-name-at-point)))

(defun find-or-create-file-at-point-other-window ()
  "Guesses what parts of the buffer under point is a file name and opens it."
  (interactive)
  (find-file-other-window (file-name-at-point)))

(defun file-name-at-point ()
  (save-excursion
    (let* ((file-name-regexp "[./a-zA-Z0-9\-_~]")
           (start (progn
                    (while (looking-back file-name-regexp)
                      (forward-char -1))
                    (point)))
           (end (progn
                  (while (looking-at file-name-regexp)
                    (forward-char 1))
                  (point))))
      (buffer-substring start end))))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(defun back-to-indentation-or-beginning ()
  (interactive)
  (if (or (looking-back "^\s*")
          (eq last-command 'back-to-indentation-or-beginning))
      (beginning-of-line)
    (back-to-indentation)))


(defun open-line-and-indent ()
  (interactive)
  (open-line 1)
  (next-line 1)
  (indent-according-to-mode)
  (previous-line 1)
  (indent-according-to-mode)
  )

(defun swap-buffers-in-windows ()
  "Put the buffer from the selected window in next window, and vice versa"
  (interactive)
  (let* ((this (selected-window))
         (other (next-window))
         (this-buffer (window-buffer this))
         (other-buffer (window-buffer other)))
    (set-window-buffer other this-buffer)
    (set-window-buffer this other-buffer)
    )
  )

(defun enter-as-newline-and-indent ()
  "A hook to remap RET to C-j"
  (local-set-key (kbd "RET") (key-binding (kbd "C-j")))
  (local-set-key (kbd "<C-return>") 'newline)
  )

(defun magit-kill-file-on-line ()
  "Show file on current magit line and prompt for deletion."
  (interactive)
  (magit-visit-item)
  (delete-current-buffer-file)
  (magit-refresh))

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))

(defun vendor (library)
  (let* ((file (symbol-name library))
         (normal (concat "~/.emacs.d/vendor/" file))
         (suffix (concat normal ".el")))
    (cond
     ((file-directory-p normal)
      (add-to-list 'load-path normal)
      (require library))
     ((file-directory-p suffix)
      (add-to-list 'load-path suffix)
      (require library))
     ((file-exists-p suffix) (require library)))))

;; hot ace jump buffer selection
(defun bs-ace-jump-buffer ()
  (interactive)
  (let ((query-char "`"))
    (bs-show "sorted")
    (defun ace-jump-buffer ()
      (interactive)
      (bs-select)
      (remove-hook 'ace-jump-mode-end-hook 'ace-jump-buffer)
      )
    (add-hook 'ace-jump-mode-end-hook 'ace-jump-buffer)
    (ace-jump-do (regexp-quote query-char))
    ))

(custom-set-variables
 '(bs-attributes-list (quote (
                              ("" 1 1 left bs--get-marked-string)
                              ("|" 1 1 left "`")
                              ("" 1 1 left bs--get-marked-string)
                              ("Buffer" bs--get-name-length 10 left bs--get-name)
                              ("" 1 1 left bs--get-marked-string)
                              ("M" 1 1 left bs--get-modified-string)
                              ("" 1 1 left bs--get-marked-string)
                              ("R" 2 2 left bs--get-readonly-string)
                              ("" 1 1 left " ")
                              ("Size" 8 8 right bs--get-size-string)
                              ("" 1 1 left " ")
                              ("Mode" 12 12 right bs--get-mode-name)
                              ("" 2 2 left "  ")
                              ("File" 12 12 left bs--get-file-name)
                              ("" 2 2 left "  "))
                             ))
 )

(provide 'defuns)
