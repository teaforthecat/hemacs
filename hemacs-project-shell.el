(defun make-persp-shell ()
  (with-temp-buffer
    (cd (projectile-project-root))
    (shell shell-buffer-name)
    (get-buffer shell-buffer-name)))

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
    (display-buffer
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
  Use C-u prefix to do the command in `current-directory`, defaults to `projectile-project-root`."
  (interactive "P")
  (let* ((cmd (read-from-minibuffer "Shell command (project root): " nil nil nil 'shell-command-history))
         (command-buffer-name (concat "*shell " (persp-name persp-curr) " " cmd "*"))
         (in-current-dir (consp arg)))
    (display-buffer
     (save-window-excursion
       (unless in-current-dir (cd (projectile-project-root)))
       (async-shell-command-get-buffer)))))

(defun project-async-command-in-background-and-growl-output (&optional arg)
 "Execute command from minibuffer in the background and send the output to growlnotify on exit.
  Use C-u prefix to do the command in `current-directory`, defaults to `projectile-project-root`."
  (interactive "P")
  (let* ((cmd (read-from-minibuffer "Shell command (project root): " nil nil nil 'shell-command-history))
         (in-current-dir (consp arg)))
    (with-temp-buffer
      (unless in-current-dir (cd (projectile-project-root)))
      (set-process-sentinel (start-process-shell-command cmd cmd cmd) #'growl-output-kill-buffer-sentinel))))

(defun ido-shell-buffer-in-persp ()
  (interactive)
  (ido-for-mode-in-persp "Shell:" 'shell-mode))

(global-set-key (kbd "C-c x") 'switch-to-or-create-project-shell)
(global-set-key (kbd "C-z x") 'popwin:project-shell)
(global-set-key (kbd "C-c m") 'project-async-command-to-buffer)
(global-set-key (kbd "C-c RET") 'project-async-command-in-background-and-growl-output)

(provide 'hemacs-project-shell)
