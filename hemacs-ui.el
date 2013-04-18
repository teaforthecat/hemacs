;; (require 'nurumacs)
(require 'powerline)
(require 'mic-paren)
(require 'git-gutter)
(require 'git-gutter-fringe)
(require 'auto-dim-other-buffers)

;; custom, minimal powerline
(defun hemacs-powerline-theme ()
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
                                (powerline-buffer-size face1 'l)
                                (powerline-raw " " face1)
                                (powerline-arrow-right face1 face2)
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

;; set font
(if (and *is-a-mac* window-system (font-existsp default-font))
    (set-face-attribute 'default nil :font default-font)
  (set-face-attribute 'default nil :height 130))

(setq inhibit-startup-message t
      color-theme-is-global t
      font-lock-maximum-decoration t
      truncate-partial-width-windows nil)

;; padding for line numbers
(setq linum-format (lambda (line)
                     (propertize
                      (format (concat " %"
                                      (number-to-string
                                       (length (number-to-string
                                                (line-number-at-pos (point-max)))))
                                      "d ")
                              line)
                      'face 'linum)))

(transient-mark-mode t)
(show-paren-mode 1)
(paren-activate)
(blink-cursor-mode 1)
(global-font-lock-mode t)
(set-fringe-style (cons 1 0)) ;; left only
(global-page-break-lines-mode) ;; get rid of ^L
(global-git-gutter-mode)
(auto-dim-other-buffers-mode)
(hemacs-powerline-theme)
(load-theme 'birds-of-paradise t)
(toggle-fullscreen)

(provide 'hemacs-ui)
