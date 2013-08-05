(autoload 'vc-git-root "vc-git")
(autoload 'vc-svn-root "vc-svn")
(autoload 'vc-hg-root "vc-hg")

(defun find-projector-root ()
  "Guess the projector root of the given FILE-PATH."
  (or (vc-git-root default-directory)
      (vc-svn-root default-directory)
      default-directory))

(defun projector-project-name ()
  (concat (replace-regexp-in-string "^.*/\\(.*\\)/" "\\1" (find-projector-root)) ""))

(defun make-projector-shell ()
  (with-temp-buffer
    (cd (find-projector-root))
    (shell projector-shell-buffer-name)
    (get-buffer projector-shell-buffer-name)))

(defun growl (title message)
  (start-process "growl" " growl" "growlnotify" title "-a" "Emacs")
  (process-send-string " growl" message)
  (process-send-string " growl" "\n")
  (process-send-eof " growl"))

(defun growl-output-kill-buffer-sentinel (process msg)
  (when (memq (process-status process) '(exit signal))
    (growl (concat (process-name process) " - " msg)
           (with-current-buffer (get-buffer (process-buffer process))
             (buffer-string)))
    (kill-buffer (process-buffer process))))

(defun async-shell-command-get-buffer ()
  (async-shell-command cmd command-buffer-name)
  (get-buffer command-buffer-name))

(defun projector-shell-buffer-name ()
  (concat "*shell " (projector-project-name) "*"))

(defun switch-to-or-create-projector-shell ()
  "Find or create a dedicated shell for the current projector."
  (interactive)
  (switch-to-buffer
   (or (get-buffer (projector-shell-buffer-name))
       (save-window-excursion (make-projector-shell)))))

(defun popwin:projector-shell ()
  "find or create a dedicated shell for the current projector in popwin"
  (interactive)
  (popwin:display-buffer-1
   (or (get-buffer (projector-shell-buffer-name))
       (save-window-excursion (make-projector-shell)))
   :default-config-keywords '(:position :bottom :height 0.5)))

(defun projector-run-command-buffer (&optional arg)
  "Run the shell command.
  By default, from the projector root.
  `C-u' prefix - execute command from current directory."
  (let* ((cmd (completing-read (concat "Shell command (" dir-string "): ")
                               shell-command-history nil nil nil
                               'shell-command-history
                               (car shell-command-history)))
         (command-buffer-name (concat "*shell " (projector-project-name) " " cmd "*")))
    (if output-to-growl
        (with-temp-buffer
          (unless (consp arg) (cd (find-projector-root)))
          (set-process-sentinel (start-process-shell-command cmd cmd cmd) #'growl-output-kill-buffer-sentinel))
      (switch-to-buffer
       (save-window-excursion
         (unless (consp arg) (cd (find-projector-root)))
         (async-shell-command-get-buffer))))))

(defun projector-async-command-projector-root (&optional arg)
  "Execute command from minibuffer at the projector root.
  By default, it outputs into a dedicated buffer.
  `C-u' prefix - execute command in the background and send the exit message to growlnotify."
  (interactive "P")
  (let* ((output-to-growl (consp arg))
         (dir-string (concat (projector-project-name) " root")))
    (projector-run-command-buffer)))

(defun projector-async-command-current-directory (&optional arg)
  "Execute command from minibuffer in the current directory root.
  By default, it outputs into a dedicated buffer.
  `C-u' prefix - execute command in the background and send the exit message to growlnotify."
  (interactive "P")
  (let* ((output-to-growl (consp arg))
         (dir-string "current-directory"))
    (projector-run-command-buffer t)))

(provide 'projector)
