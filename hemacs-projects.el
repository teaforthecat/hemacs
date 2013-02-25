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
  (cd (shell-quote-argument (textmate-project-root)))
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

(defun persp-switch-to-shell ()
  "Ido switch to another shell in this project"
  (interactive)
  (let* ((persp-ido-buffer-list (let ((names (remq nil (mapcar 'buffer-name (persp-buffers persp-curr)))))
                                  (or (remove-if (lambda (name) (eq (string-to-char name) ? )) names) names)))
         (shell-buffer-list (hemacs-filter (lambda (x) (string-match "*shell" x)) persp-ido-buffer-list))
         (shell-buffer (ido-completing-read "Choose project shell: " shell-buffer-list nil t)))
    (when shell-buffer
      (switch-to-buffer shell-buffer))))

(defun persp-async-command ()
  (interactive)
  (let* ((cmd (read-from-minibuffer "Shell command: " nil nil nil 'shell-command-history))
         (command-buffer-name (concat "*shell " (persp-name persp-curr) " " cmd "*")))
    (popwin:display-buffer-1
     (or (get-buffer command-buffer-name)
         (save-window-excursion
           (cd (shell-quote-argument (textmate-project-root)))
           (async-shell-command cmd command-buffer-name)
           (get-buffer command-buffer-name)))
     :default-config-keywords '(:position :bottom :height 0.5))))

(provide 'hemacs-projects)
