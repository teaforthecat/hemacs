(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar packages
  '(ace-jump-mode
    ack-and-a-half
    auto-complete
    bash-completion
    birds-of-paradise-plus-theme
    ;; browse-kill-ring
    buffer-move
    bundler
    change-inner
    coffee-mode
    dash
    dired-details
    elisp-slime-nav
    exec-path-from-shell
    expand-region
    haml-mode
    handlebars-mode
    ido-ubiquitous
    jade-mode
    jump-char
    key-chord
    ;; kite
    less-css-mode
    magit
    magithub
    markdown-mode
    mic-paren
    multiple-cursors
    nav
    nurumacs
    page-break-lines
    perspective
    php-mode
    popwin
    powerline
    projectile
    rainbow-mode
    regex-tool
    robe
    ruby-end
    sass-mode
    shell-here
    slim-mode
    slime
    slime-repl
    slime-js
    smex
    ;; smart-forward
    smart-tab
    stylus-mode
    perspective
    undo-tree
    yaml-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (package packages)
  (when (not (package-installed-p package))
    (package-install package)))

(provide 'packages)
