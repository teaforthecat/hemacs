;; hide everything
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; paths
(add-to-list 'load-path "~/.emacs.d")
(setq code-dir "~/code/")
(setq vendor-dir  "~/.emacs.d/vendor")
(setq custom-file "~/.emacs.d/custom.el")
(setq *is-a-mac* (eq system-type 'darwin))
(when (file-exists-p vendor-dir) (add-to-list 'load-path vendor-dir))
(when (file-exists-p custom-file) (load custom-file))
(push "/usr/local/bin" exec-path)
(push "~/.rbenv/shims" exec-path)

(require 'packages)
(require 'defuns)

(require 'hemacs-completion)
(require 'hemacs-windows)
(require 'hemacs-config)
(require 'hemacs-git)
(require 'hemacs-dired)
(require 'hemacs-pairs)
(require 'hemacs-bindings)
(require 'hemacs-projects)

(when (and *is-a-mac* window-system)
  (require 'hemacs-osx)
)

(require 'hemacs-ruby)
(require 'hemacs-stylesheets)
(require 'hemacs-javascripts)
(require 'hemacs-console)
(require 'hemacs-swank)
(require 'hemacs-ui)

(provide 'init)
