(setq *is-a-mac* (eq system-type 'darwin))

;; hide everything
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; load paths
(add-to-list 'load-path "~/.emacs.d")
(setq vendor-dir  "~/.emacs.d/vendor")
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p vendor-dir) (add-to-list 'load-path vendor-dir))
(when (file-exists-p custom-file) (load custom-file))

;; default settings
(setq code-dir "~/code/"
      default-font "Meslo LG M DZ-16:weight=normal"
      )

;; elpa packages (most packages are submoduled with git in ./vendor)
(require 'packages)

;; hemacs lisps
(require 'defuns)

;; do it
(require 'hemacs-completion)
(require 'hemacs-jump)
(require 'hemacs-evil)
(require 'hemacs-windows)
(require 'hemacs-config)
(require 'hemacs-git)
(require 'hemacs-dired)
(require 'hemacs-pairs)
(require 'hemacs-scrolling)
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
(require 'hemacs-org)

(provide 'init)
