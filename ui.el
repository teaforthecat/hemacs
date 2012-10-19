;; (load-file "~/.emacs.d/themes/cyberpunk.el")
;; (load-file "~/.emacs.d/themes/gandalf.el")

;; (color-theme-cyberpunk)
;; (set-cursor-color "yellow")

(load-theme 'misterioso)

(setq color-theme-is-global t)
(setq font-lock-maximum-decoration t)
(setq ring-bell-function 'ignore)
(setq truncate-partial-width-windows nil)
(set-default 'fill-column 72)

(global-hl-line-mode t)
(transient-mark-mode t)
(show-paren-mode t)
(blink-cursor-mode t)
(size-indication-mode t)
(fringe-mode 0)

(vendor 'volatile-highlights)
(volatile-highlights-mode t)

(vendor 'highlight-tail)
(highlight-tail-mode 1)
(setq highlight-tail-steps 48)      

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

(require 'color)
(defun massage-theme-colors ()
  (interactive)
  (let (
        (mode-line-foreground (face-attribute 'mode-line :foreground))
        (mode-line-background (face-attribute 'mode-line :background))
        (highlight-base (face-attribute 'highlight :background))
        (flash-base (face-attribute 'isearch :background))
        (tail-base (face-attribute 'match :background))
        )
    (set-face-attribute 'mode-line nil
                        :foreground mode-line-background
                        :background mode-line-foreground)
    (set-face-attribute 'powerline-active1 nil
                        :foreground mode-line-foreground)
    (set-face-attribute 'powerline-active2 nil
                        :foreground mode-line-foreground)
    (set-face-attribute 'hl-line nil
                        :background (color-darken-name highlight-base 16))
    (set-face-attribute 'cursor nil
                        :background flash-base)
    (setq highlight-tail-colors (list (cons (color-lighten-name tail-base 10) 0)
                                      (cons highlight-base 50)
                                      (cons (color-darken-name highlight-base 10) 100)
                                      ))
    (highlight-tail-reload)
    ))
(massage-theme-colors)

;; diminish mode names in mode line
(require 'diminish)
(eval-after-load "textmate" '(diminish 'textmate-mode))
(eval-after-load "auto-complete" '(diminish 'auto-complete-mode))
(eval-after-load "ruby-end" '(diminish 'ruby-end-mode))
(eval-after-load "rinari" '(diminish 'rinari-minor-mode "rails"))
(eval-after-load "highlight-tail" '(diminish 'highlight-tail-mode))
(eval-after-load "volatile-highlights" '(diminish 'volatile-highlights-mode))
(eval-after-load "slime-js" '(diminish 'slime-js-minor-mode))
(add-hook 'emacs-lisp-mode-hook (lambda() (setq mode-name "el")))

(provide 'ui)
