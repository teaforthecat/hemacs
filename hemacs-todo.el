(setq hemacs-todo-file (expand-file-name "todo.org" hemacs-dir)
      org-capture-templates
      '(("t" "Todo" entry (file+function hemacs-todo-file hemacs-org-capture-todo-header)
         "** TODO %?\n")))

(defun hemacs-org-capture-todo-header ()
  "Find or create the current project's header and insert the todo template"
  (goto-char (point-min))
  (let ((todo-header (concat "* " (persp-name persp-curr))))
    (if (re-search-forward todo-header nil t 1)
        (match-string-no-properties 0)
      (goto-char (point-max))
      (newline 2)
      (insert todo-header)
      (newline 1)
      (hemacs-org-capture-todo-header))))

(defun hemacs-goto-todos ()
  "Visits the global todo file."
  (interactive)
  (find-file hemacs-todo-file))

(defun hemacs-todo-capture ()
  "Capture a todo item."
  (interactive)
  (org-capture nil "t"))

(provide 'hemacs-todo)
