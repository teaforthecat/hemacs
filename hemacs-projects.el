(require 'perspective)
(require 'projectile)

(persp-mode t)
;; (global-projectile-mode)
(setq projectile-enable-caching t)

(defmacro custom-persp (name &rest body)
  `(let ((initialize (not (gethash ,name perspectives-hash)))
         (current-perspective persp-curr))
     (persp-switch ,name)
     (when initialize ,@body)
     (setq persp-last current-perspective)))

(defun magit-in-perspective ()
  "Use ido to find or create a perspective for a project and open it in magit"
  (interactive)
  (let ((project-name (ido-completing-read "Open project: " (directory-files code-dir nil "^[^.]"))))
    (custom-persp project-name)
    (magit-status (concat code-dir project-name))
    ))

(defun make-persp-shell ()
  (interactive)
  (cd (shell-quote-argument (projectile-project-root)))
  (shell shell-buffer-name)
  (get-buffer shell-buffer-name))

(defun persp-shell ()
  (interactive)
  (let* ((shell-buffer-name (concat "*shell " (persp-name persp-curr) "*")))
    (display-buffer
     (or (get-buffer shell-buffer-name)
         (save-window-excursion (make-persp-shell))))))

(defun popwin:persp-shell ()
  (interactive)
  (let* ((shell-buffer-name (concat "*shell " (persp-name persp-curr) "*")))
    (popwin:display-buffer-1
     (or (get-buffer shell-buffer-name)
         (save-window-excursion (make-persp-shell)))
     :default-config-keywords '(:position :bottom :height 0.5))))

(defun persp-async-command ()
  (interactive)
  (let* ((cmd (read-from-minibuffer "Shell command: " nil nil nil 'shell-command-history))
         (command-buffer-name (concat "*shell " (persp-name persp-curr) " " cmd "*")))
    (popwin:display-buffer-1
     (or (get-buffer command-buffer-name)
         (save-window-excursion
           (cd (shell-quote-argument (projectile-project-root)))
           (async-shell-command cmd command-buffer-name)
           (get-buffer command-buffer-name)))
     :default-config-keywords '(:position :bottom :height 0.5))))

;; persp command at current dir

(defun persp-background-command ()
  (interactive)
  (let* ((cmd (read-from-minibuffer "Shell command: " nil nil nil 'shell-command-history)))
    (setq last-background-command
          (substring (shell-command-to-string cmd) 0 -1))
    (minibuffer-message (concat cmd " - finished"))))

(defun show-last-persp-background-command ()
  (interactive)
  (display-buffer last-background-command))

(global-set-key (kbd "C-c x") 'persp-shell)
(global-set-key (kbd "C-c m") 'persp-async-command)

(provide 'hemacs-projects)
