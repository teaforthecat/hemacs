(require 'color)
;; (vendor 'volatile-highlights)
(vendor 'highlight-tail)
(vendor 'powerline)

;; set font
(if (font-existsp default-font)
    (set-face-attribute 'default nil :font default-font)
  (set-face-attribute 'default nil :height 160))

;; fullscreen
(when (and *is-a-mac* window-system)
  (ns-toggle-fullscreen))

(load-theme 'misterioso)

(setq color-theme-is-global t
      font-lock-maximum-decoration t
      ring-bell-function 'ignore
      truncate-partial-width-windows nil)

(set-default 'fill-column 72)

(transient-mark-mode t)
(show-paren-mode t)
(blink-cursor-mode t)
(size-indication-mode t)
(fringe-mode 0)
(set-fringe-style -1)
(global-font-lock-mode t)
(tooltip-mode -1)

;; because coding is magic
(highlight-tail-mode 1)
(setq highlight-tail-steps 24
      highlight-tail-timer 0.01)

(custom-set-faces
 '(font-lock-function-name-face ((t (:weight normal)))) ;; makes scrolling sticky
 '(ido-subdir ((t (:inherit font-lock-keyword-face))))
 '(mode-line ((t (:box nil :height 130 :inherit font-lock-comment-face))))
 '(mode-line-inactive ((t (:box nil :height 130 :foreground nil :inherit font-lock-comment-face))))
 '(powerline-active1 ((t (:foreground nil :height 130 :inherit default))))
 '(powerline-active2 ((t (:foreground nil :height 130 :inherit default))))
 '(powerline-inactive1 ((t (:foreground nil :inherit font-lock-comment-face))))
 '(powerline-inactive2 ((t (:foreground nil :inherit font-lock-comment-face))))
 )

(defun powerline-waymondo-theme ()
  (interactive)
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
                                ;; (powerline-hud face2 face1)
                                ;; (powerline-raw " " face1)
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
                      (powerline-render rhs)))))))

(defun massage-theme-colors ()
  (interactive)
  (let (
        (bg (face-attribute 'default :background))
        (font-lock-comment-base (face-attribute 'font-lock-comment-face :foreground))
        (highlight-base (face-attribute 'highlight :background))
        (flash-base (face-attribute 'isearch :background))
        (tail-base (face-attribute 'match :background))
        )

    (set-face-attribute 'mode-line nil
                        :foreground bg
                        :background font-lock-comment-base)
    
    (set-face-attribute 'mode-line-inactive nil
                        :background (color-darken-name bg 5))
    
    (set-face-attribute 'powerline-active1 nil
                        :background (color-lighten-name bg 18))
    
    (set-face-attribute 'powerline-active2 nil
                        :background (color-lighten-name bg 12))
    
    (set-face-attribute 'powerline-inactive1 nil
                        :background (color-lighten-name bg 10))
    
    (set-face-attribute 'powerline-inactive2 nil
                        :background (color-lighten-name bg 6))
        
    (set-face-attribute 'cursor nil
                        :background font-lock-comment-base)
    
    (setq highlight-tail-colors (list (cons tail-base 0)
                                      (cons highlight-base 24)))

    (set-face-attribute 'magit-item-highlight nil
                        :background (color-lighten-name bg 12))

    (highlight-tail-reload)
    (powerline-waymondo-theme)
    
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
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(add-hook 'emacs-lisp-mode-hook (lambda() (setq mode-name "el")))

(provide 'hemacs-ui)
