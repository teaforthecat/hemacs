(vendor 'highlight-tail)
(vendor 'powerline)
(vendor 'mic-paren)

;; set font
;; (if (and *is-a-mac* window-system (font-existsp default-font))
;;     (set-face-attribute 'default nil :font default-font)
;;   (set-face-attribute 'default nil :height 160))

(set-face-attribute 'default nil :height 160)

;; fullscreen
(when (and *is-a-mac* window-system)
  (ns-toggle-fullscreen))

(setq color-theme-is-global t
      font-lock-maximum-decoration t
      ring-bell-function 'ignore
      truncate-partial-width-windows nil)

(transient-mark-mode t)
(show-paren-mode t)
(blink-cursor-mode 0)
(size-indication-mode t)
(global-font-lock-mode t)
;; (paren-activate)

(set-fringe-style '(6. 0))

;; because coding is magic
(highlight-tail-mode 1)
(setq highlight-tail-steps 24
      highlight-tail-timer 0.005)

(load-theme 'misteroizo)

(defun powerline-waymondo-theme ()
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (eq (frame-selected-window) (selected-window)))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (lhs (list
                                (powerline-raw "%*" nil 'l)
                                (powerline-buffer-id nil 'l)
                                (powerline-raw " ")
                                (powerline-arrow-right nil face1)
                                (powerline-raw " " face1)
                                (powerline-hud face2 face1)
                                (powerline-raw " " face1)
                                ;; (powerline-raw "%3lL" face1 'r)
                                (powerline-buffer-size face1 'l)
                                (powerline-raw " " face1)
                                (powerline-arrow-right face1 face2)
                                ;; (powerline-major-mode face2 'l)
                                ;; (powerline-minor-modes face2 'l)
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

(powerline-waymondo-theme)

(provide 'hemacs-ui)
