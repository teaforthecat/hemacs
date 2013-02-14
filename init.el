(setq
 ;; internal settings
 *is-a-mac* (eq system-type 'darwin)
 hemacs-dir (file-name-directory load-file-name)
 vendor-dir (expand-file-name "vendor" hemacs-dir)
 custom-file (expand-file-name "custom.el" hemacs-dir)

 ;; default settings
 code-dir "~/code/"
 default-font "Meslo LG M DZ-14:weight=normal"
 )

;; hide everything
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; load paths
(defun add-subfolders-to-load-path (parent-dir)
 "Adds all first level `parent-dir' subdirs to the Emacs load path."
 (dolist (f (directory-files parent-dir))
   (let ((name (expand-file-name f parent-dir)))
     (when (and (file-directory-p name)
     (not (equal f ".."))
     (not (equal f ".")))
       (add-to-list 'load-path name)))))

(add-to-list 'load-path hemacs-dir)
(when (file-exists-p vendor-dir) (add-to-list 'load-path vendor-dir))
(when (file-exists-p custom-file) (load custom-file))
(add-subfolders-to-load-path vendor-dir)

;; hemacs lisps
(require 'defuns)

;; elpa packages (most packages are submoduled with git in ./vendor)
(require 'packages)

;; do it
(require 'hemacs-ack)
(require 'hemacs-ido)
(require 'hemacs-completion)
(require 'hemacs-jump)
(require 'hemacs-windows)
(require 'hemacs-yankill)
(require 'hemacs-config)
(require 'hemacs-git)
(require 'hemacs-dired)
(require 'hemacs-electric)
(require 'hemacs-scrolling)
(require 'hemacs-chords)
(require 'hemacs-bindings)
(require 'hemacs-projects)
(when (and *is-a-mac* window-system) (require 'hemacs-osx))
(require 'hemacs-shell)
(require 'hemacs-lisp)
(require 'hemacs-ruby)
(require 'hemacs-templating)
(require 'hemacs-stylesheets)
(require 'hemacs-javascripts)
(require 'hemacs-coffee)
;; (require 'hemacs-webkit)
(require 'hemacs-writing)
(require 'hemacs-todo)
(require 'hemacs-ui)

;; run emacs client server
(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)
