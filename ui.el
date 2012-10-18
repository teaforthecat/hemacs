(load-theme 'misterioso)

(setq color-theme-is-global t)
;; (setq font-lock-maximum-decoration t)
(setq visible-bell t)
(setq truncate-partial-width-windows nil)

(idle-highlight-mode 1)
(global-hl-line-mode t)
(transient-mark-mode t)
(show-paren-mode t)
(blink-cursor-mode t)
(size-indication-mode t)
(fringe-mode 0)

;; vertical ido results!
(setq ido-decorations (quote ("\n=> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

;; box around mode line is ew with powerline
(vendor 'powerline)
(powerline-default)

(setq-default mode-line-format
              '("%e"
                (:eval
                 (let* ((active (eq (frame-selected-window) (selected-window)))
                        (face1 (if active 'powerline-active1 'powerline-inactive1))
                        (face2 (if active 'powerline-active2 'powerline-inactive2))
                        (lhs (list
                              (powerline-raw " ")
                              (powerline-buffer-id nil 'l)
                              (powerline-raw " ")
                              (powerline-arrow-right nil face1)
                              (powerline-raw "%*" face1 'l)
                              (powerline-raw " " face1)
                              (powerline-hud face2 face1)
                              (powerline-raw " " face1)
                              (powerline-raw "%3l" face1 'r)
                              (powerline-buffer-size face1 'l)
                              (powerline-raw " " face1)
                              (powerline-arrow-right face1 face2)
                              (powerline-major-mode face2 'l)
                              (powerline-minor-modes face2 'l)
                              (powerline-raw mode-line-process face2 'l)

                              ))
                        (rhs (list
                              (powerline-arrow-left face2 face1)
                              (powerline-vc face1)
                              (powerline-raw " " face1)
                              (powerline-arrow-left face1 nil)
                              (powerline-raw " ")
                              (powerline-raw (persp-name persp-curr) nil 'r)
                              (powerline-raw " ")
                              )))
                   (concat
                    (powerline-render lhs)
                    (powerline-fill face2 (powerline-width rhs))
                    (powerline-render rhs))))))

;; let the side colors of powerline be more vibrant in your active window
(defun setup-powerline-colors ()
  (interactive)
  (let (
        (mode-line-foreground (face-attribute 'mode-line :foreground))
        (mode-line-background (face-attribute 'mode-line :background))
        )
    (set-face-attribute 'mode-line nil
                        :foreground mode-line-background
                        :background mode-line-foreground)
    (set-face-attribute 'powerline-active1 nil
                        :foreground mode-line-foreground)
    (set-face-attribute 'powerline-active2 nil
                        :foreground mode-line-foreground)
    ))
(setup-powerline-colors)

;; diminish mode names in mode line
(require 'diminish)
(eval-after-load "textmate" '(diminish 'textmate-mode))
(eval-after-load "auto-complete" '(diminish 'auto-complete-mode))
(eval-after-load "ruby-end" '(diminish 'ruby-end-mode))
(eval-after-load "rinari" '(diminish 'rinari-minor-mode "rails"))
(add-hook 'emacs-lisp-mode-hook (lambda() (setq mode-name "el")))

(provide 'ui)
