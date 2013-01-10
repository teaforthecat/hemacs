(setq
 ;; internal settings
 *is-a-mac* (eq system-type 'darwin)
 hemacs-dir (file-name-directory load-file-name)
 vendor-dir (expand-file-name "vendor" hemacs-dir)
 custom-file (expand-file-name "custom.el" hemacs-dir)

 ;; default settings
 code-dir "~/code/"
 default-font "Meslo LG M DZ-16:weight=normal"
 )

;; hide everything
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; load paths
(add-to-list 'load-path hemacs-dir)
(when (file-exists-p vendor-dir) (add-to-list 'load-path vendor-dir))
(when (file-exists-p custom-file) (load custom-file))

;; elpa packages (most packages are submoduled with git in ./vendor)
(require 'packages)

;; hemacs lisps
(require 'defuns)

;; do it
(require 'hemacs-ack)
(require 'hemacs-completion)
(require 'hemacs-jump)
(require 'hemacs-evil)
(require 'hemacs-windows)
(require 'hemacs-yankill)
(require 'hemacs-config)
(require 'hemacs-git)
(require 'hemacs-dired)
(require 'hemacs-pairs)
(require 'hemacs-scrolling)
(require 'hemacs-chords)
(require 'hemacs-bindings)
(require 'hemacs-projects)
(when (and *is-a-mac* window-system) (require 'hemacs-osx))
(require 'hemacs-console)
(require 'hemacs-lisp)
(require 'hemacs-ruby)
(require 'hemacs-stylesheets)
(require 'hemacs-javascripts)
(require 'hemacs-ui)
(require 'hemacs-webkit)
(require 'hemacs-writing)
(require 'hemacs-todo)

(provide 'init)
