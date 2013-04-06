(setq

 ;; internal settings
 *is-a-mac* (eq system-type 'darwin)
 hemacs-dir (file-name-directory load-file-name)
 vendor-dir (expand-file-name "vendor" hemacs-dir)
 custom-file (expand-file-name "custom.el" hemacs-dir)

 ;; default settings
 code-dir "~/code/"
 default-font "Menlo-13:weight=normal"

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
(add-subfolders-to-load-path vendor-dir)
(when (file-exists-p custom-file) (load custom-file))

;; load elpa packages
(require 'packages)

;; exec path
(when (and *is-a-mac* window-system) (exec-path-from-shell-initialize))

;; hemacs lisps
(require 'hemacs-defuns)

;; lay the base
(require 'hemacs-base)

;; editing modules
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
(require 'hemacs-templating)
(require 'hemacs-stylesheets)
(require 'hemacs-javascripts)
(require 'hemacs-coffee)

;; appearance
(require 'hemacs-ui)

(provide 'init)
