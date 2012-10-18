(require 'package)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar packages
  '(browse-kill-ring
    diminish
    gist
    idle-highlight-mode
    inf-ruby
    markdown-mode
    perspective
    ruby-end
    textmate
    volatile-highlights
    yari
    zenburn-theme
    )
  "A list of packages to ensure are installed at launch.")

(dolist (package packages)
  (when (not (package-installed-p package))
    (package-install package)))

(provide 'packages)
