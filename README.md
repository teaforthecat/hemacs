# hemacs

one man's ever evolving emacs setup. used on osx with carbon emacs 24+.

## installation

(backup any existing ~/.emacs.d first)

1. `git clone git://github.com/waymondo/hemacs ~/.emacs.d`
2. `cd ~/.emacs.d && git submodule update --init --recursive`

installing emacs 24+ on osx is easiest with [homebrew](http://mxcl.github.com/homebrew) =>

`brew install emacs --cocoa --use-git-head`

`brew linkapps`

since we are brewing, you might want to make sure you have these programs installed as well => 

`brew install git ack markdown`

the first time you boot a handful of elisp packages will be installed so practice your patience.

## what does it come with?

* [all of these](https://github.com/waymondo/hemacs/tree/master/vendor)

* `hemacs-completion` - less typing with autocomplete, ido, and hippie expand

* `hemacs-windows` - popwin and buffer/window movement

* `hemacs-config`  - general default customizations and external packages

* `hemacs-git` - magit, magithub, open file in github

* `hemacs-dired` - dired details, reverting and buffer reuse

* `hemacs-pairs` - global electric pair mode with hungry delete and delete-active-region compatibility

* `hemacs-bindings` - bindings for searching with ack and a half, keychord jumpchar, expand region, buffer selection, emacs overrides

* `hemacs-scrolling` - buffer scrolling behavior

* `hemacs-projects` - project workspace management and conveniences with persp-mode, popwin

* `hemacs-osx` - carbon / osx related settings (ignored if booted from terminal)

* `hemacs-ui` - font, theme, highlight-tail, powerline and fanciness

* `hemacs-console` - trying to make eshell, shell, and terminal more usable

* `hemacs-webkit` - browser consoling via [swank js](https://github.com/swank-js/swank-js) *experimental*

* support for the following langauges and formats: 
  - ruby
  - javascript
  - coffeescript
  - mustache / handlebars
  - css
  - less css
  - scss
  - sass
  - erb / rhtml
  - haml
  - slim
  - json
  - yaml
  - markdown

## default settings

within `init.el` there a few basic settings you might want to override.

`code-dir` - this is the root folder where all your projects reside, for the purpose of [`hemacs-projecs`](https://github.com/waymondo/hemacs/tree/master/vendor). i have this set to `~/code/`.

`default-font` - i'm grooving on [Meslo](https://github.com/andreberg/Meslo-Font) but you can change it to whatever. if the named font isn't found, it will usewhatever your emacs default is at 15px.

`shell-path` - if you are on osx, the `exec-path-from-shell` package will setup emacs with the same exec path for your shell environment, but if you want to specifically set the path to your zsh or bash installation you can do it here. i'm using `/usr/local/bin/zsh`.
