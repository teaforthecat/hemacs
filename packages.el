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
    less-css-mode
    magit
    ;; magit-gh-pulls
    magithub
    markdown-mode
    mic-paren
    mmm-mode
    multiple-cursors
    nav
    nurumacs
    octomacs
    page-break-lines
    pcmpl-args
    perspective
    php-mode
    popwin
    powerline
    projectile
    rainbow-mode
    ;; regex-tool
    sass-mode
    shell-command
    slim-mode
    smex
    smart-tab
    stylus-mode
    perspective
    undo-tree
    yaml-mode
    zossima)
  "A list of packages to ensure are installed at launch.")

(dolist (package packages)
  (when (not (package-installed-p package))
    (package-install package)))

(provide 'packages)
