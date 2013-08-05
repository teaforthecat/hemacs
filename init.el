(setq

 ;; internal settings
 *is-a-mac* (eq system-type 'darwin)
 vendor-dir (expand-file-name  "vendor" user-emacs-directory)
 custom-file (expand-file-name "custom.el" user-emacs-directory)

 ;; default settings
 code-dir "~/code/"
 default-font "Menlo-13:weight=normal"

 )

;; load paths
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path vendor-dir)
(when (file-exists-p custom-file) (load custom-file))

;; hide GUI
(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; load elpa packages
(require 'packages)

;; exec path
(when (and *is-a-mac* window-system) (exec-path-from-shell-initialize))

;; hemacs lisps
(require 'hemacs-defuns)

;; lay the base
(require 'hemacs-base)
(require 'hemacs-persp)

;; editing modules
(require 'hemacs-subword)
(require 'hemacs-hooks)
(require 'hemacs-ido)
(require 'hemacs-hippie)
(require 'hemacs-windows)
(require 'hemacs-indent)
(require 'hemacs-copy-paste)

;; utility
(require 'hemacs-git)
(require 'hemacs-shell)
(require 'projector)
(require 'hemacs-dired)
(require 'hemacs-todo)

;; mac-ish
(when (and *is-a-mac* window-system) (require 'hemacs-osx))

;; mode configs
(require 'hemacs-mode-map)
(require 'hemacs-lisp)
(require 'hemacs-ruby)
(require 'hemacs-stylesheets)
(require 'hemacs-javascripts)
(require 'hemacs-coffee)

;; appearance
(require 'hemacs-ui)

;; global bindings and keychord
(require 'hemacs-bindings)
(require 'hemacs-chords)
(require 'hemacs-hyper-jump)

;; emacs server
(require 'server)
(unless (server-running-p) (server-start))

(provide 'init)
