(require 'magit)
(require 'magithub)
(require 'git-messenger)

;; always update files, i.e. after git pull
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; don't do ediff with popup
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(defun magit-kill-file-on-line ()
  "Show file on current magit line and prompt for deletion."
  (interactive)
  (magit-visit-item)
  (delete-current-buffer-file)
  (magit-refresh))

(define-key magit-status-mode-map (kbd "C-x C-k") 'magit-kill-file-on-line)

;; whitespace toggle
(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

(define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)

;; full screen magit-status

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(defadvice magit-process-sentinel (after magit-growl-finish (process event) activate)
  (let ((msg (format "%s %s." (process-name process) (substring event 0 -1))))
    (growl "Magit" msg)))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

;; (setq magit-save-some-buffers nil) ;; don't ask to save buffers

(provide 'hemacs-git)
