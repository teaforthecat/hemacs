(vendor 'magit)
(vendor 'magithub)
;; (vendor 'gist)
(vendor 'open-file-in-github)

(define-key magit-status-mode-map (kbd "C-x C-k") 'magit-kill-file-on-line)
(setq magit-process-popup-time 2)

;; always update files, i.e. after git pull
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(provide 'hemacs-git)
