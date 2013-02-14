;; ack searching `brew install ack`
(require 'ack-and-a-half)
(setq ack-and-a-half-arguments "--nosql")

;; ack
(global-set-key (kbd "C-c a") 'ack-and-a-half)
(global-set-key (kbd "C-c C-a") 'ack-and-a-half-same)
(global-set-key (kbd "C-c f") 'ack-and-a-half-find-file) ;; faster than textmate find in project
(global-set-key (kbd "C-c F") 'ack-and-a-half-find-file-same)

(provide 'hemacs-ack)
