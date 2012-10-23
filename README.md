# hemacs

one man's ever evolving emacs setup. used on osx with carbon emacs 24+.

## installation

(backup any existing ~/.emacs.d first)

1. `git clone git://github.com/waymondo/hemacs ~/.emacs.d`
2. `ln -s $PWD/hemacs $HOME/.emacs.d`
3. `cd $HOME/.emacs.d && git submodule update --init --recursive`

installing emacs 24+ on osx is easiest with [homebrew](http://mxcl.github.com/homebrew) =>

`brew install emacs --cocoa`

`brew linkapps`

the first time you boot a handful of elisp packages will be installed so practice your patience.

## what does it come with?

* [all of these](https://github.com/waymondo/hemacs/raw/master/vendor)

* `hemacs-completion` - less typing with autocomplete, ido, and hippie expand

* `hemacs-windows` - popwin and buffer/window movement

* `hemacs-config`  - general default customizations and external packages

* `hemacs-git` - magit, magithub, open file in github

* `hemacs-dired` - dired details, reverting and buffer reuse

* `hemacs-pairs` - global electric pair mode with hungry delete and delete-active-region compatibility

* `hemacs-bindings` - bindings for searching with ack and a half, keychord jumpchar, expand region, buffer selection, emacs overrides

* `hemacs-scrolling` - buffer scrolling behavior

* `hemacs-projects` - project workspace management and conveniences with persp-mode, popwin

* `hemacs-swank` - swank js for browser consoling

* `hemacs-osx` - carbon / osx related

* `hemacs-ui` - font, theme, highlight-tail, powerline and fanciness

* `hemacs-console` - trying to make emacs shell or terminal more usable

* support for: ruby, javascript, coffeescript, css, less css, scss, sass, erb, haml, slim, mustache, handlebars, yaml, and markdown
