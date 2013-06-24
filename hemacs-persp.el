(require 'perspective)

(persp-mode t)

(defmacro custom-persp (name &rest body)
  `(let ((initialize (not (gethash ,name perspectives-hash)))
         (current-perspective persp-curr))
     (persp-switch ,name)
     (when initialize ,@body)
     (setq persp-last current-perspective)))

(defun persp-remove-current-buffer ()
  (interactive)
  (persp-remove-buffer (get-buffer (current-buffer))))

(defun buffer-in-current-presp (buffer)
  (delq
   nil
   (mapcar (lambda (persp-buffer)
             (eq (buffer-name persp-buffer) (buffer-name buffer)))
           (persp-buffers persp-curr))))

(defadvice switch-to-next-buffer (after switch-to-next-persp-buffer activate)
  "Advice around `switch-to-next-buffer' to restrict to current perspective."
  (unless (buffer-in-current-presp (current-buffer))
    (persp-remove-current-buffer)
    (switch-to-next-buffer)))

(defadvice switch-to-prev-buffer (after switch-to-prev-persp-buffer activate)
  "Advice around `switch-to-prev-buffer' to restrict to current perspective."
  (unless (buffer-in-current-presp (current-buffer))
    (persp-remove-current-buffer)
    (switch-to-prev-buffer)))

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

(defun persp-switch-last ()
  (interactive)
  (persp-switch (persp-name persp-last)))

(defun ido-for-mode-in-persp (prompt the-mode)
  "Switch buffers in project by mode"
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

(defun ido-shell-buffer-in-persp ()
  "Switch to shell buffer in project"
  (interactive)
  (ido-for-mode-in-persp "Shell:" 'shell-mode))

(provide 'hemacs-persp)
