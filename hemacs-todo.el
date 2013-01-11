(setq hemacs-todo-file (expand-file-name "todo.org" hemacs-dir)
      org-default-notes-file hemacs-todo-file
      org-capture-templates
      '(("t" "Todo" plain (file+function hemacs-todo-file hemacs-org-capture-todo-header)
         "** TODO %?")))

(defun hemacs-org-capture-todo-header ()
  "Find or create the current project's header and insert the todo template"
  (goto-char (point-min))
  (if (re-search-forward (concat "* " (persp-name persp-curr)) nil t 1)
      (save-excursion
        (match-string-no-properties 0)
        (newline 1))
    (goto-char (point-max))
    (newline 2)
    (insert (concat "* " (persp-name persp-curr)))
    (newline 1)
    ))

(defun hemacs-goto-todos ()
  "Visits the global todo file."
  (interactive)
  (find-file hemacs-todo-file))

(defun hemacs-todo-capture ()
  "Capture a todo item."
  (interactive)
  (org-capture nil "t"))

(global-set-key (kbd "C-c c") 'hemacs-todo-capture)
(global-set-key (kbd "C-c t") 'hemacs-goto-todos)

(provide 'hemacs-todo)
