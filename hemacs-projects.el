(global-set-key (kbd "s-o") 'magit-in-perspective) ;; project open
(global-set-key (kbd "s-p") 'persp-switch) ;; project switch

(global-set-key (kbd "C-c x") 'persp-shell)
(global-set-key (kbd "C-c X") 'persp-eshell)
(global-set-key (kbd "C-c m") 'persp-async-command)

(defmacro custom-persp (name &rest body)
       `(let ((initialize (not (gethash ,name perspectives-hash)))
              (current-perspective persp-curr))
          (persp-switch ,name)
          (when initialize ,@body)
          (setq persp-last current-perspective)))

(defun magit-in-perspective ()
  "Use ido to find or create a perspective for a project and open it in magit"
  (interactive)
  (let ((project-name (ido-completing-read "Magit in perspective: " (directory-files code-dir nil "^[^.]"))))
    (custom-persp project-name)
    (magit-status (concat code-dir project-name))
    ))

(defun persp-eshell ()
  (interactive)
  (cd (shell-quote-argument (textmate-project-root)))
  (setq eshell-buffer-name (concat "*" (persp-name persp-curr) "-eshell*"))
  (display-buffer
   (or (get-buffer (concat "*" (persp-name persp-curr) "-eshell*"))
       (save-window-excursion
         (call-interactively 'eshell)))
   :default-config-keywords '(:position :left :width 0.5)))

(defun persp-shell ()
  (interactive)
  (let* ((shell-buffer-name (concat "*" (persp-name persp-curr) "-shell*")))
    (popwin:display-buffer-1
     (or (get-buffer shell-buffer-name)
         (save-window-excursion
           (cd (shell-quote-argument (textmate-project-root)))
           (shell shell-buffer-name)
           (get-buffer shell-buffer-name)))
     :default-config-keywords '(:position :bottom :height 0.5))))

(defun persp-async-command ()
  (interactive)
  (let* ((cmd (read-from-minibuffer "Shell command: " nil nil nil 'shell-command-history))
         (command-buffer-name (concat "*" (persp-name persp-curr) " " cmd "*")))
    (popwin:display-buffer-1
     (or (get-buffer command-buffer-name)
         (save-window-excursion
           (cd (shell-quote-argument (textmate-project-root)))
           (async-shell-command cmd command-buffer-name)
           (get-buffer command-buffer-name)))
     :default-config-keywords '(:position :bottom :height 0.5))))

(provide 'hemacs-projects)
