(autoload 'vc-git-root "vc-git")
(autoload 'vc-svn-root "vc-svn")

(defun find-project-root ()
  "Guess the project root of the given FILE-PATH."
  (or (vc-git-root default-directory)
      (vc-svn-root default-directory)
      default-directory))

(defun make-persp-shell ()
  (with-temp-buffer
    (cd (find-project-root))
    (shell shell-buffer-name)
    (get-buffer shell-buffer-name)))

(defun growl (title message)
  (start-process "growl" " growl" "growlnotify" title "-a" "Emacs")
  (process-send-string " growl" message)
  (process-send-string " growl" "\n")
  (process-send-eof " growl"))

(defun async-shell-command-get-buffer ()
  (async-shell-command cmd command-buffer-name)
  (get-buffer command-buffer-name))

(defun growl-output-kill-buffer-sentinel (process msg)
  (when (memq (process-status process) '(exit signal))
    (growl (concat (process-name process) " - " msg)
           (with-current-buffer (get-buffer (process-buffer process))
             (buffer-string)))
    (kill-buffer (process-buffer process))))

(defun switch-to-or-create-project-shell ()
  "Find or create a dedicated shell for the current project."
  (interactive)
  (let* ((shell-buffer-name (concat "*shell " (persp-name persp-curr) "*")))
    (switch-to-buffer
     (or (get-buffer shell-buffer-name)
         (save-window-excursion (make-persp-shell))))))

(defun popwin:project-shell ()
  "find or create a dedicated shell for the current project in popwin"
  (interactive)
  (let* ((shell-buffer-name (concat "*shell " (persp-name persp-curr) "*")))
    (popwin:display-buffer-1
     (or (get-buffer shell-buffer-name)
         (save-window-excursion (make-persp-shell)))
     :default-config-keywords '(:position :bottom :height 0.5))))

(defun project-async-command-to-buffer (&optional arg)
 "Execute command from minibuffer at the project root and output into a dedicated buffer.
  Use C-u prefix to do the command in `current-directory`, defaults to the project root."
  (interactive "P")
  (let* ((in-current-dir (consp arg))
         (dir-string (if in-current-dir "current directory" "project root"))
         (cmd (read-from-minibuffer (concat "Shell command (" dir-string "): ") nil nil nil 'shell-command-history))
         (command-buffer-name (concat "*shell " (persp-name persp-curr) " " cmd "*"))
         )
    (switch-to-buffer
     (save-window-excursion
       (unless in-current-dir (cd (find-project-root)))
       (async-shell-command-get-buffer)))))

(defun project-async-command-in-background-and-growl-output (&optional arg)
 "Execute command from minibuffer in the background and send the output to growlnotify on exit.
  Use C-u prefix to do the command in `current-directory`, defaults to the project root."
  (interactive "P")
  (let* ((in-current-dir (consp arg))
         (dir-string (if in-current-dir "current directory" "project root"))
         (cmd (read-from-minibuffer (concat "Shell command (" dir-string "): ") nil nil nil 'shell-command-history)))
    (with-temp-buffer
      (unless in-current-dir (cd (find-project-root)))
      (set-process-sentinel (start-process-shell-command cmd cmd cmd) #'growl-output-kill-buffer-sentinel))))

(provide 'hemacs-project-shell)
