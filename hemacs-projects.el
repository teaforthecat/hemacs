;; open/switch projects
(global-set-key (kbd "s-o") 'magit-in-perspective)
(global-set-key (kbd "s-p") 'persp-switch)

;; project-related popwin
(global-set-key (kbd "C-z x") 'popwin:perspective-eshell)
(global-set-key (kbd "C-z a") 'popwin:async-command)
(global-set-key (kbd "C-z F") 'popwin:foreman)

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

(defun popwin:perspective-eshell ()
  (interactive)
  (cd (shell-quote-argument (textmate-project-root)))
  (setq eshell-buffer-name (concat "*" (persp-name persp-curr) "-eshell*"))
  (popwin:display-buffer-1
   (or (get-buffer (concat "*" (persp-name persp-curr) "-eshell*"))
       (save-window-excursion
         (call-interactively 'eshell)))
   :default-config-keywords '(:position :left :width .5)))

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

(defun popwin:foreman ()
  (interactive)
  (defvar *process-buffer-name* (concat "*" (persp-name persp-curr) " Foreman*"))
  (popwin:display-buffer-1
   (or (get-buffer *process-buffer-name*)
       (save-window-excursion
         (call-interactively 'foreman-start)))
   :default-config-keywords '(:position :left :width 0.5 :noselect t)))

;; (global-set-key (kbd "C-z x") 'popwin:visit-project-shell)
;; (global-set-key (kbd "C-z X") 'popwin:visit-project-term)

;; (defun cd-project-directory (text)
;;    (setq project-dir (shell-quote-argument (textmate-project-root)))
;;    (cd project-dir)
;;    )

;; (defun perspective-shell-setup ()
;;   (add-hook 'comint-output-filter-functions 'cd-project-directory nil t))

;; (setq shell-mode-hook 'perspective-shell-setup)

;; (defun make-perspective-shell ()
;;   (interactive)
;;   (cd (shell-quote-argument (textmate-project-root)))
;;   (shell (concat "*" (persp-name persp-curr) "-shell*"))
;;   (get-buffer (concat "*" (persp-name persp-curr) "-shell*"))
;;   )

;; (defun make-perspective-term ()
;;   (interactive)
;;   (let ((persp-curr-term-buffer-name (concat (persp-name persp-curr) "-term")))
;;     (ansi-term (getenv "SHELL") persp-curr-term-buffer-name)
;;     ))

;; (defun popwin:visit-project-term ()
;;   (interactive)
;;   (let ((persp-curr-term-buffer-name (concat (persp-name persp-curr) "-term")))
;;     (popwin:display-buffer-1
;;      (or (get-buffer (concat "*" persp-curr-term-buffer-name "*"))
;;          (save-window-excursion
;;            (call-interactively 'make-perspective-term)))
;;      :default-config-keywords '(:position :left :width .5))))

;; (defun popwin:visit-project-shell ()
;;   (interactive)
;;   (let ((persp-curr-term-buffer-name (concat (persp-name persp-curr) "-shell")))
;;     (popwin:display-buffer-1
;;      (or (get-buffer (concat "*" persp-curr-term-buffer-name "*"))
;;          (save-window-excursion
;;            (call-interactively 'make-perspective-shell)))
;;      :default-config-keywords '(:position :left :width .5 :stick t))))

;; (defun make-perspective-foreman ()
;;   (interactive)
;;   (foreman-start)
;;   (get-buffer (concat "*" (persp-name persp-curr) " Foreman*")))

(provide 'hemacs-projects)
