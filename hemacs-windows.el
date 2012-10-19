;; shift + arrows to move around windows, ctrl to swap buffers in windows
(windmove-default-keybindings)
(setq windmove-wrap-around t)
(require 'buffer-move)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; popwin
(vendor 'popwin)
(setq display-buffer-function 'popwin:display-buffer
      popwin:popup-window-height 0.4
      popwin:special-display-config
      '(("*Completions*" :noselect t :height 8)
        ("*Ido Completions*" :noselect t :height 8)
        "*Help*"
        "*compilation*"
        "*Messages*"
        "*Bundler*"
        "*Buffer List"
        "*rake*"
        "*rails*"
        "*ruby*"
        "*helm mini*"
        "*Deft*"
        ("*Occur*" :noselect t)
        ("*magit-commit*" :noselect t :width 80)
        ("*magit-diff*" :noselect t :width 80)
        ("*magit-edit-log*" :noselect t :width 80)
        (dired-mode :position left :width .3)
        ("\\*ansi-term\\*.*" :regexp t :position left :width .4)
        ("\\*slime-repl JS\\*.*" :regexp t :position left :width .4)
        ("\\*shell\\*.*" :regexp t :position left :width .4)
        ))

;; (push "*Bundler*" popwin:special-display-config)
;; (push "*Buffer List*" popwin:special-display-config)
;; (push "*Deft*" popwin:special-display-config)
;; (push "*rake*" popwin:special-display-config)
;; (push "*rails*" popwin:special-display-config)
;; (push "*magit-process*" popwin:special-display-config)
;; (push "*magit-edit-log*" popwin:special-display-config)
;; (push "*ruby*" popwin:special-display-config)
;; (push "*helm mini*" popwin:special-display-config)
;; (push '("*Foreman*" :position left :width .4 :noselect t) popwin:special-display-config)
;; ;; (push '("*Ack-and-a-half*" :position left :width .4 :dedicated t) popwin:special-display-config)
;; (push '("*shell*" :position left :width .4) popwin:special-display-config)
;; (push '(dired-mode :position left :width .4) popwin:special-display-config)

(provide 'hemacs-windows)
