(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar packages
  '(ace-jump-mode
    ack-and-a-half
    ag
    auto-dim-other-buffers
    back-button
    bash-completion
    browse-kill-ring
    buffer-move
    bundler
    change-inner
    coffee-mode
    dash
    dired-details
    elisp-slime-nav
    exec-path-from-shell
    expand-region
    git-gutter
    git-gutter-fringe
    haml-mode
    handlebars-mode
    ido-ubiquitous
    jade-mode
    js2-mode
    jump-char
    key-chord
    ;; kite
    kill-ring-search
    less-css-mode
    magit
    magithub
    markdown-mode
    mic-paren
    mmm-mode
    multiple-cursors
    nav
    ;; nurumacs
    page-break-lines
    perspective
    php-mode
    popwin
    powerline
    projectile
    rainbow-mode
    ;; regex-tool
    ;; robe
    sass-mode
    shell-command
    slim-mode
    ;; slime
    ;; slime-repl
    ;; slime-js
    smex
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
