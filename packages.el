(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar packages
  '(elisp-slime-nav
    php-mode
    rainbow-mode
    slime
    slime-repl
    slime-js
    exec-path-from-shell
    markdown-mode
    perspective
    textmate
    solarized-theme
    zenburn-theme
    )
  "A list of packages to ensure are installed at launch.")

(dolist (package packages)
  (when (not (package-installed-p package))
    (package-install package)))

(provide 'packages)
