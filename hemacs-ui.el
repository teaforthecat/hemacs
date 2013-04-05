;; (require 'highlight-tail)
(require 'powerline)
(require 'mic-paren)
(require 'git-gutter)
(require 'git-gutter-fringe)

;; (require 'nurumacs)

;; scrolling
;; (setq scroll-margin 24)
;; (setq scroll-conservatively 100000)
;; (setq scroll-preserve-screen-position t)

(defun nice-scrolling ()
  "Turn on smooth buffered scrolling"
  (interactive)
  (set (make-local-variable 'scroll-margin) 24)
  (set (make-local-variable 'scroll-conservatively) 100000)
  (set (make-local-variable 'scroll-preserve-screen-position) t))

(defun no-nice-scrolling ()
  "Turn on smooth buffered scrolling"
  (interactive)
  (setq scroll-margin 0)
  (setq scroll-conservatively 0)
  (setq scroll-preserve-screen-position nil))

;; smooth scrolling
(dolist (hook '(prog-mode-hook
                js2-mode-hook))
  (add-hook hook 'nice-scrolling))

;; set font
;; (if (and *is-a-mac* window-system (font-existsp default-font))
;;     (set-face-attribute 'default nil :font default-font)
;;   (set-face-attribute 'default nil :height 130))
(set-face-attribute 'default nil :height 130)

(setq inhibit-startup-message t
      color-theme-is-global t
      font-lock-maximum-decoration t
      ring-bell-function 'ignore
      truncate-partial-width-windows nil)

(transient-mark-mode t)
(show-paren-mode 1)
(paren-activate)
(blink-cursor-mode 0)
(global-font-lock-mode t)
(set-fringe-style '(8 . 0)) ;; just a lil padding
(global-page-break-lines-mode) ;; get rid of ^L
(global-git-gutter-mode)

;; because coding is magic
;; (highlight-tail-mode 1)
;; (setq highlight-tail-steps 24
;;       highlight-tail-timer 0.005)

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

(powerline-waymondo-theme)

;; load theme
(load-theme 'birds-of-paradise t)

;; go fullscreen
(when (and *is-a-mac* window-system)
  (if (functionp 'ns-toggle-fullscreen)
    (ns-toggle-fullscreen)
    (if (functionp 'toggle-frame-fullscreen)
        (toggle-frame-fullscreen))))

(provide 'hemacs-ui)
