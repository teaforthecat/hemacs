(setq hemacs-todo-file (expand-file-name "todo.org" hemacs-dir)
      org-default-notes-file hemacs-todo-file
      org-capture-templates
      '(("t" "Todo" entry (file+headline hemacs-todo-file "Todo")
         "* TODO %?")))

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
