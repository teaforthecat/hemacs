(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar packages
  '(ace-jump-buffer
    ace-jump-mode
    ag
    auto-dim-other-buffers
    back-button
    ;; bash-completion
    ;; browse-kill-ring
    buffer-move
    bundler
    change-inner
    coffee-mode
    dash
    dired-details
    dizzee
    elisp-slime-nav
    exec-path-from-shell
    expand-region
    direx
    flx
    git-gutter
    git-gutter-fringe
    github-browse-file
    haml-mode
    ido-sort-mtime
    ido-ubiquitous
    inf-ruby
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
    ;; mmm-mode
    multiple-cursors
    nav-flash
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
    repl-toggle
    rhtml-mode
    robe
    ;; regex-tool
    s
    sass-mode
    ;; shell-command
    simplezen
    skewer-mode
    slim-mode
    smartparens
    smex
    ;; smooth-scrolling
    stylus-mode
    sublimity
    perspective
    undo-tree
    yaml-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (package packages)
  (when (not (package-installed-p package))
    (package-install package)))

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(provide 'packages)
