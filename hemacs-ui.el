;; (require 'highlight-tail)
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

;; nice scrolling
(defun nice-scrolling ()
  "Turn on smooth buffered scrolling"
  (interactive)
  (set (make-local-variable 'scroll-margin) 24)
  (set (make-local-variable 'scroll-conservatively) 100000)
  (set (make-local-variable 'scroll-preserve-screen-position) t))

;; smooth scrolling
(dolist (hook '(prog-mode-hook
                js2-mode-hook))
  (add-hook hook 'nice-scrolling))

;; set font
(if (and *is-a-mac* window-system (font-existsp default-font))
    (set-face-attribute 'default nil :font default-font)
  (set-face-attribute 'default nil :height 130))

(setq inhibit-startup-message t
      color-theme-is-global t
      font-lock-maximum-decoration t
      ring-bell-function 'ignore
      truncate-partial-width-windows nil)

(transient-mark-mode t)
(show-paren-mode 1)
(paren-activate)
(blink-cursor-mode 1)
(global-font-lock-mode t)
(set-fringe-style '(8 . 0)) ;; just a lil padding
(global-page-break-lines-mode) ;; get rid of ^L
(global-git-gutter-mode)
(auto-dim-other-buffers-mode)
(hemacs-powerline-theme)
(load-theme 'birds-of-paradise t)
(toggle-fullscreen)

;; because coding is magic
;; (setq highlight-tail-steps 48
;;       highlight-tail-timer 0.01
;;       highlight-tail-colors '(("#865C38" . 0)
;;                               ("#523D2B" . 20)))
;; (highlight-tail-mode 1)

(provide 'hemacs-ui)
