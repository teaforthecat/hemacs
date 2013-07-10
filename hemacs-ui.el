(require 'git-gutter)
(require 'git-gutter-fringe)
(global-git-gutter-mode)
(set-fringe-style (cons 10 0)) ;; left 10px

(require 'sublimity-scroll)

;; custom, minimal powerline
(require-package 'powerline)
(defun powerline-hemacs-theme ()
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (lhs (list
                                (powerline-raw "%*" nil 'l)
                                (powerline-buffer-id nil 'l)
                                (powerline-raw " ")
                                (powerline-arrow-right nil face1)
                                (powerline-raw " " face1)
                                (powerline-hud face2 face1)
                                (powerline-buffer-size face1 'l)
                                (powerline-raw " %3l" face1 'r)
                                (powerline-arrow-right face1 face2)
                                (powerline-raw mode-line-process face2 'l)
                                (when (and (boundp 'which-func-mode) which-func-mode)
                                  (powerline-raw which-func-format face2 'l))
                                ))
                          (rhs (list
                                (powerline-arrow-left face2 face1)
                                (powerline-vc face1)
                                (powerline-raw " " face1)
                                (powerline-arrow-left face1 nil)
                                (powerline-raw " ")
                                (powerline-raw (persp-name persp-curr) mode-line 'r)
                                )))
                     (concat
                      (powerline-render lhs)
                      (powerline-fill face2 (powerline-width rhs))
                      (powerline-render rhs)))))))

(powerline-hemacs-theme)

;; set font
(if (and *is-a-mac* window-system (font-existsp default-font))
    (set-face-attribute 'default nil :font default-font)
  (set-face-attribute 'default nil :height 130))

(setq inhibit-startup-message t
      color-theme-is-global t
      font-lock-maximum-decoration t
      truncate-partial-width-windows nil)

(transient-mark-mode t)
(blink-cursor-mode 1)
(global-font-lock-mode t)
(which-func-mode t)
(color-theme-approximate-on)

(require 'linum-relative)
;; padding for line numbers
(setq linum-relative-format " %3s ")
(setq linum-relative-current-symbol "=>")

(global-page-break-lines-mode) ;; get rid of ^L

(require 'auto-dim-other-buffers)
(auto-dim-other-buffers-mode)

(load-theme 'birds-of-paradise t)
(toggle-fullscreen)

(provide 'hemacs-ui)
