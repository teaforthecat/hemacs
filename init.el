(setq

 ;; internal settings
 *is-a-mac* (eq system-type 'darwin)
 hemacs-dir (file-name-directory load-file-name)
 custom-file (expand-file-name "custom.el" hemacs-dir)

 ;; default settings
 code-dir "~/code/"
 default-font "Menlo-13:weight=normal"

 )

;; load paths
(add-to-list 'load-path hemacs-dir)
(when (file-exists-p custom-file) (load custom-file))

;; hide everything
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; load elpa packages
(require 'packages)

;; exec path
(when (and *is-a-mac* window-system) (exec-path-from-shell-initialize))

;; hemacs lisps
(require 'hemacs-defuns)

;; lay the base
(require 'hemacs-base)

;; editing modules
(require 'hemacs-hooks)
(require 'hemacs-ido)
(require 'hemacs-hippie)
(require 'hemacs-jump-buff)
(require 'hemacs-windows)
(require 'hemacs-indent)
(require 'hemacs-copy-paste)
(require 'hemacs-pairs)

;; global bindings and keychord
(require 'hemacs-bindings)
(require 'hemacs-chords)
(require 'hemacs-hyper-jump)

;; utility
(require 'hemacs-git)
(require 'hemacs-shell)
(require 'hemacs-project-shell)
(require 'hemacs-dired)
(require 'hemacs-todo)
;; (require 'hemacs-webkit)

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

;; emacs server
(require 'server)
(unless (server-running-p) (server-start))

(provide 'init)
