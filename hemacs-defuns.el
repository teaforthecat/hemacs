(defun hemacs-filter (condp lst)
  (delq nil (mapcar (lambda (x) (and (funcall condp x) x)) lst)))

(defun string-rtrim (str)
  "Remove trailing whitespace from `STR'."
  (replace-regexp-in-string "[ \t\n]*$" "" str))

(defun find-git-repo (dir)
  (if (string= "/" dir)
      (message "not in a git repo.")
    (if (file-exists-p (expand-file-name ".git/" dir))
        dir
      (find-git-repo (expand-file-name "../" dir)))))

(defmacro allow-line-as-region-for-function (orig-function)
  `(defun ,(intern (concat (symbol-name orig-function) "-or-line"))
     ()
     ,(format "Like `%s', but acts on the current line if mark is not active."
              orig-function)
     (interactive)
     (if mark-active
         (call-interactively (function ,orig-function))
       (save-excursion
         ;; define a region (temporarily) -- so any C-u prefixes etc. are preserved.
         (beginning-of-line)
         (set-mark (point))
         (end-of-line)
         (call-interactively (function ,orig-function))))))

(unless (fboundp 'comment-or-uncomment-region-or-line)
  (allow-line-as-region-for-function comment-or-uncomment-region))

(defun finder ()
  "Open the current working directory in finder."
  (interactive)
  (shell-command (concat "open " (shell-quote-argument default-directory))))

(defun width-80 ()
  (interactive)
  (set-window-margins (selected-window) 0 0)
  (let ((marginwidth (/ (- (window-width) 80) 2)))
    (set-window-margins (selected-window) marginwidth marginwidth)))

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

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun new-line-in-between ()
  (interactive)
  (newline)
  (save-excursion
    (newline)
    (indent-for-tab-command))
  (indent-for-tab-command))

(defmacro line-as-string ()
  "Returns the current line as a string."
  `(buffer-substring (point-at-bol) (point-at-eol)))

(defun blank-line-p ()
  "If line contains only spaces."
  (string-match-p "^[ ]*$" (line-as-string)))

(defun duplicate-dwim (arg)
  "Duplicate:
a) region (if active) ARG times,
b) or the line above starting at the current column poisition (if the current line is blank),
c) or the current line ARG times."
  (interactive "p")
  (save-excursion
    (if (region-active-p)
        (duplicate-region arg)
      (if (blank-line-p)
          (copy-from-above-command)
        (duplicate-current-line arg)))))

(defun duplicate-region (num &optional start end)
  "Duplicates the region bounded by START and END NUM times.
If no START and END is provided, the current region-beginning and
region-end is used."
  (interactive "p")
  (let* ((start (or start (region-beginning)))
         (end (or end (region-end)))
         (region (buffer-substring start end)))
    (goto-char start)
    (dotimes (i num)
      (insert region))))

(defun duplicate-current-line (num)
  "Duplicate the current line NUM times."
  (interactive "p")
  (when (eq (point-at-eol) (point-max))
    (goto-char (point-max))
    (newline)
    (forward-char -1))
  (duplicate-region num (point-at-bol) (1+ (point-at-eol))))

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

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

;; short snips

(defun arrow ()
  (interactive)
  (insert " => "))

(defun open-brackets-newline-and-indent()
  (interactive)
  (insert " {\n\n}")
  (indent-according-to-mode)
  (previous-line)
  (indent-according-to-mode))

(defun pad-colon-and-maybe-semicolon()
  (interactive)
  (if (looking-at "\;.*")
      (insert ": ")
    (insert ": ;")
    (backward-char)
    ))

(defun string-interpolate ()
  "In a double quoted string, interpolate."
  (interactive)
  (insert "#")
  (when (and
         (looking-back "\".*")
         (looking-at ".*\""))
    (insert "{}")
    (backward-char 1)))

(defun pad-brackets ()
  (interactive)
  (insert "{  }")
  (backward-char 2))

(defun pad-colon ()
  (interactive)
  (insert ": "))

(defun word-count ()
  (interactive)
  (shell-command-on-region (point-min) (point-max) "wc -w"))

(defun maximize-other-window ()
  (interactive)
  (other-window 1)
  (delete-other-windows))

(defun maybe-deactivate-mark ()
  (interactive)
  (if (region-active-p)
      (deactivate-mark t)))

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

(defun keyboard-quit-or-abort-recursive-edit ()
  "Escape the keyboard or abort recursively if in the minibuffer"
  (interactive)
  (if (active-minibuffer-window)
      (abort-recursive-edit)
    (keyboard-quit)))

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
  (indent-according-to-mode))

(defun newline-indent-relative ()
  (interactive)
  (newline)
  (indent-relative))

;; (defun swap-buffers-in-windows ()
;;   "Put the buffer from the selected window in next window, and vice versa"
;;   (interactive)
;;   (let* ((this (selected-window))
;;          (other (next-window))
;;          (this-buffer (window-buffer this))
;;          (other-buffer (window-buffer other)))
;;     (set-window-buffer other this-buffer)
;;     (set-window-buffer this other-buffer)))

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))

(defun what-face (pos)
  "Return the name of the face at point"
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(defun persp-switch-last ()
  (interactive)
  (persp-switch persp-last))

(defun font-candidate (&rest fonts)
     "Return existing font which first match."
     (find-if (lambda (f) (find-font (font-spec :name f))) fonts))

(defun font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defun growl (title message)
  (start-process "growl" " growl" "growlnotify" title "-a" "Emacs")
  (process-send-string " growl" message)
  (process-send-string " growl" "\n")
  (process-send-eof " growl"))

(defun terminal-notifier (title message)
  (start-process "terminal-notifier" "*terminal-notifier*" "terminal-notifier" "-title" title "-message" message))

(defun mapc-buffers (fn)
  (mapc (lambda (buffer)
          (with-current-buffer buffer
            (funcall fn)))
        (buffer-list)))

(defun toggle-fullscreen ()
  (interactive)
  (when (and *is-a-mac* window-system)
    (if (functionp 'ns-toggle-fullscreen)
        (ns-toggle-fullscreen)
      (if (functionp 'toggle-frame-fullscreen)
          (toggle-frame-fullscreen)))))

(defun nice-scrolling ()
  "Turn on smooth buffered scrolling"
  (interactive)
  (set (make-local-variable 'scroll-margin) 24)
  (set (make-local-variable 'scroll-conservatively) 100000)
  (set (make-local-variable 'scroll-preserve-screen-position) t))

(defun maybe-turn-on-rainbow-mode ()
  (when (and (stringp buffer-file-name)
             (string-match ".*theme.el" buffer-file-name))
    (rainbow-mode)))

(defun region-as-string ()
  (buffer-substring (region-beginning)
                    (region-end)))

(defun isearch-forward-use-region ()
  (interactive)
  (when (region-active-p)
    (add-to-history 'search-ring (region-as-string))
    (deactivate-mark))
  (call-interactively 'isearch-forward))

(defun isearch-backward-use-region ()
  (interactive)
  (when (region-active-p)
    (add-to-history 'search-ring (region-as-string))
    (deactivate-mark))
  (call-interactively 'isearch-backward))

(defun camelcase-region (start end)
  "Changes region from snake_case to camelCase"
  (interactive "r")
  (save-restriction (narrow-to-region start end)
                    (goto-char (point-min))
                    (while (re-search-forward "_\\(.\\)" nil t)
                      (replace-match (upcase (match-string 1))))))

(defun camelcase-word-or-region ()
  "Changes word or region from snake_case to camelCase"
  (interactive)
  (let (pos1 pos2 bds)
    (if (and transient-mark-mode mark-active)
        (setq pos1 (region-beginning) pos2 (region-end))
      (progn
        (setq bds (bounds-of-thing-at-point 'symbol))
        (setq pos1 (car bds) pos2 (cdr bds))))
    (camelcase-region pos1 pos2)))

(defun snakecase-region (start end)
  "Changes region from camelCase to snake_case"
  (interactive "r")
  (save-restriction
    (let ((case-fold-search nil))
      (narrow-to-region start end)
      (goto-char (point-min))
      (while (re-search-forward "\\([a-z]\\)\\([A-Z]\\)" nil t)
        (message (match-string 1))
        (replace-match (concat (match-string 1) "_" (downcase (match-string 2))))
        (goto-char (point-min))))))

(defun snakecase-word-or-region ()
  "Changes word or region from camelCase to snake_case"
  (interactive)
  (let (pos1 pos2 bds)
    (if (and transient-mark-mode mark-active)
        (setq pos1 (region-beginning) pos2 (region-end))
      (progn
        (setq bds (bounds-of-thing-at-point 'symbol))
        (setq pos1 (car bds) pos2 (cdr bds))))
    (snakecase-region pos1 pos2)))

(provide 'hemacs-defuns)
