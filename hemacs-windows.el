(require 'buffer-move)

(defun toggle-split-window-horizontally ()
  (interactive)
  (if (> (count-windows) 1)
      (delete-other-windows)
    (split-window-horizontally)
    (other-window 1)
    (switch-to-buffer (other-buffer))))

;; split windows horizontally by default
(setq split-height-threshold nil
      split-width-threshold 0)

;; shift + arrows to move cursor between windows
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; shift + control + arrows to swap buffers in windows
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; popwin
(setq display-buffer-function 'popwin:display-buffer
      popwin:popup-window-height 0.5
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
        ("*magit-commit*" :noselect t)
        ("*magit-diff*" :noselect t)
        ("*magit-edit-log*" :height 5 :dedicated t)
        ;; (dired-mode :position left :width .3)
        (" *undo-tree*" :position right :width .3 :dedicated t)
        ("\\*ansi-term\\*.*" :regexp t :position left :width .5)
        ("\\Foreman\\*.*" :regexp t :position left :width .5)
        ("\\*slime-repl JS\\*.*" :regexp t :position left :width .5)
        ("\\*eshell\\*.*" :regexp t :position left :width .5 :stick t)
        ("CAPTURE-todo.org" :height 5)
        ))

;; (defun popwin:close-or-display-last-buffer ()
;;   (interactive)
;;   (if (popwin:popup-window-live-p)
;;       (popwin:close-popup-window)
;;     (popwin:display-last-buffer)))

(global-set-key (kbd "C-z") popwin:keymap)
(global-set-key (kbd "C-z d") 'dired-jump-other-window)

;; nav toggle following popwin C-z convention
(global-set-key (kbd "C-z n") 'nav-toggle)
(global-set-key (kbd "C-z C-n") 'nav-toggle)

(provide 'hemacs-windows)
