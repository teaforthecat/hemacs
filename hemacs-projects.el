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

(defun popwin-direx:direx ()
  (interactive)
  (popwin:display-buffer-1
   (or (get-buffer (persp-name persp-curr))
       (save-window-excursion
         (call-interactively 'direx-project:jump-to-project-root)))
   :default-config-keywords '(:position left :width 50 :dedicated t)))

(defun cd-project-directory (text)
   (setq project-dir (shell-quote-argument (textmate-project-root)))
   (cd project-dir)
   )

(defun perspective-shell-setup ()
  (add-hook 'comint-output-filter-functions 'cd-project-directory nil t))

(setq shell-mode-hook 'perspective-shell-setup)

(defun make-perspective-shell ()
  (interactive)
  (cd (shell-quote-argument (textmate-project-root)))
  (shell (concat "*" (persp-name persp-curr) "-shell*"))
  (get-buffer (concat "*" (persp-name persp-curr) "-shell*"))
  )

(defun make-perspective-term ()
  (interactive)
  (let ((persp-curr-term-buffer-name (concat (persp-name persp-curr) "-term")))
    (ansi-term (getenv "SHELL") persp-curr-term-buffer-name)
    ))

(defun popwin:visit-project-term ()
  (interactive)
  (let ((persp-curr-term-buffer-name (concat (persp-name persp-curr) "-term")))
    (popwin:display-buffer-1
     (or (get-buffer (concat "*" persp-curr-term-buffer-name "*"))
         (save-window-excursion
           (call-interactively 'make-perspective-term)))
     :default-config-keywords '(:position :left :width 64))))

(defun popwin:visit-project-shell ()
  (interactive)
  (let ((persp-curr-term-buffer-name (concat (persp-name persp-curr) "-shell")))
    (popwin:display-buffer-1
     (or (get-buffer (concat "*" persp-curr-term-buffer-name "*"))
         (save-window-excursion
           (call-interactively 'make-perspective-shell)))
     :default-config-keywords '(:position :left :width 64 :stick t))))

(defun make-perspective-foreman ()
  (interactive)
  (foreman-start (persp-name persp-curr))
  (get-buffer (concat "*" (persp-name persp-curr) "-Foreman*")))

(defun popwin:foreman ()
  (interactive)
  (let ((perspective-foreman (persp-name persp-curr)))
    (popwin:display-buffer-1
     (or (get-buffer (concat "*" perspective-foreman "-Foreman*"))
         (save-window-excursion
           (call-interactively 'make-perspective-foreman)))
     :default-config-keywords '(:position :left :width 0.4 :noselect t))))

(defun popwin:async-command ()
  (interactive)
  (let* ((cmd (read-from-minibuffer "Shell command: " nil nil nil 'shell-command-history))
         (command-buffer-name (concat "*" (persp-name persp-curr) " " cmd "*")))
    (popwin:display-buffer-1
     (or (get-buffer command-buffer-name)
         (save-window-excursion
           (cd (shell-quote-argument (textmate-project-root)))
           (async-shell-command cmd command-buffer-name)
           (get-buffer command-buffer-name)))
     :default-config-keywords '(:position :left :width 64 :stick t))))

(provide 'hemacs-projects)
