(require 'projectile)
(require 'perspective)

(persp-mode t)

(defmacro custom-persp (name &rest body)
  `(let ((initialize (not (gethash ,name perspectives-hash)))
         (current-perspective persp-curr))
     (persp-switch ,name)
     (when initialize ,@body)
     (setq persp-last current-perspective)))

(defun open-project ()
  "Use ido to find or create a perspective for a project, create a project shell, and open magit"
  (interactive)
  (let* ((project-name (ido-completing-read "Open project: " (directory-files code-dir nil "^[^.]")))
         (project-dir (concat code-dir project-name))
         (shell-buffer-name (concat "*shell " project-name "*")))
    (custom-persp project-name)
    (with-temp-buffer
      (cd project-dir)
      (shell shell-buffer-name))
    (magit-status project-dir)))

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
  Use C-u prefix to do the command in `current-directory`, defaults to `projectile-project-root`."
  (interactive "P")
  (let* ((in-current-dir (consp arg))
         (dir-string (if in-current-dir "current directory" "project root"))
         (cmd (read-from-minibuffer (concat "Shell command (" dir-string "): ") nil nil nil 'shell-command-history))
         (command-buffer-name (concat "*shell " (persp-name persp-curr) " " cmd "*"))
         )
    (switch-to-buffer
     (save-window-excursion
       (unless in-current-dir (cd (projectile-project-root)))
       (async-shell-command-get-buffer)))))

(defun project-async-command-in-background-and-growl-output (&optional arg)
 "Execute command from minibuffer in the background and send the output to growlnotify on exit.
  Use C-u prefix to do the command in `current-directory`, defaults to `projectile-project-root`."
  (interactive "P")
  (let* ((in-current-dir (consp arg))
         (dir-string (if in-current-dir "current directory" "project root"))
         (cmd (read-from-minibuffer (concat "Shell command (" dir-string "): ") nil nil nil 'shell-command-history)))
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
(define-key comint-mode-map (kbd "C-c RET") 'project-async-command-in-background-and-growl-output)

(provide 'hemacs-project-shell)
