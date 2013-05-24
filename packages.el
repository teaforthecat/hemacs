(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar packages
  '(ace-jump-mode
    ag
    auto-dim-other-buffers
    back-button
    ;; bash-completion
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
    direx
    git-gutter
    git-gutter-fringe
    github-browse-file
    haml-mode
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
    mmm-mode
    multiple-cursors
    ;; nav
    octomacs
    page-break-lines
    pcmpl-args
    pcmpl-git
    perspective
    php-mode
    popwin
    powerline
    projectile
    rainbow-mode
    rainbow-delimiters
    rbenv
    ;; regex-tool
    s
    sass-mode
    ;; shell-command
    simplezen
    slim-mode
    smartparens
    smex
    ;; smooth-scrolling
    stylus-mode
    sublimity
    perspective
    undo-tree
    yaml-mode
    zossima)
  "A list of packages to ensure are installed at launch.")

(dolist (package packages)
  (when (not (package-installed-p package))
    (package-install package)))

(provide 'packages)
