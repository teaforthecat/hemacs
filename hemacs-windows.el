(require 'buffer-move)
(vendor 'popwin)

;; shift + arrows to move around windows, ctrl to swap buffers in windows
(windmove-default-keybindings)
(setq windmove-wrap-around t)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; popwin
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
        "*Foreman*"
        "*ruby*"
        "*helm mini*"
        "*Deft*"
        "*magit-process*"
        ("*Occur*" :noselect t)
        ("*magit-commit*" :noselect t :width 80)
        ("*magit-diff*" :noselect t :width 80)
        ("*magit-edit-log*" :noselect t :width 80)
        (dired-mode :position left :width .3)
        ("\\*ansi-term\\*.*" :regexp t :position left :width .5)
        ("\\Foreman\\*.*" :regexp t :position left :width .5)
        ("\\*slime-repl JS\\*.*" :regexp t :position left :width .5)
        ("\\*eshell\\*.*" :regexp t :position left :width .5)
        ("\\*shell\\*.*" :regexp t :position left :width .5)
        ))

(provide 'hemacs-windows)
