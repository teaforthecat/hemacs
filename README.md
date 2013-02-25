# hemacs

one man's ever evolving emacs setup. used on osx with carbon emacs 24+. i'm mainly writing ruby, java-and-coffee scripting, interfacing with git, command-lining, and writing object-oriented css. i'm opting to use git submodules for managing vendored packages in most cases over ELPA. things should be kind of document and organized and tweakable at this point.

## installation

(backup any existing ~/.emacs.d first)

`git clone --recursive git://github.com/waymondo/hemacs ~/.emacs.d`

indeed, installing carbon emacs 24+ on osx is easiest with [homebrew](http://mxcl.github.com/homebrew) =>

`brew install emacs --cocoa --use-git-head --srgba`

then run `brew linkapps` to symlink the built package, or move the Emacs.app from your homebrew cellar to your `/Applications` directory.

since we are already brewing, you might want to make sure you have these programs installed as well =>

`brew install git ack markdown ispell bash-completion`

also, the first time you boot a whole bunch of elisp packages will be installed so just relax and check your tweets.

## what does it come with?

* hemacs is basically just sprinkles on a cake of [all of these](https://github.com/waymondo/hemacs/blob/master/packages.el)

* `hemacs-completion` - less typing with autocomplete, ido, and hippie expand

* `hemacs-windows` - popwin and buffer/window movement

* `hemacs-config`  - general default customizations and mode enabling

* `hemacs-git` - magit, magithub, open file in github

* `hemacs-dired` - dired detail hiding and buffer reuse / reverting

* `hemacs-electric` - global electric modes with hungry delete and delete-active-region compatibility for `electric-pair-mode`

* `hemacs-bindings` - bindings for modes, defuns, and some

* `hemacs-chords` - `keychord-mode` chords for common things and global common things bound to semi-colon

* `hemacs-scrolling` - buffer scrolling behavior

* `hemacs-projects` - project workspace management and conveniences with `persp-mode.el` and `popwin.el`

* `hemacs-osx` - carbon / osx related settings (ignored if booted from terminal)

* `hemacs-ui` - font, theme massaging, highlight-tail, powerline, eliminating clutter

* `hemacs-todo` - a simple global todo list system using `org-capture`, grouped by project headers

* `hemacs-shell` - shell config, bash completion, and comint history completion bindings

* `hemacs-lisp` - elisp-related customizations and extensions

* `hemacs-writing` - spell-checking and text-writing assistance

* `hemacs-yankill` - yanking and killing helper functions and bindings

* `hemacs-jump` - power cursor jumping and buffer switching with `ace-jump-mode.el` *experimental*

* `hemacs-webkit` - browser consoling via [swank js](https://github.com/swank-js/swank-js) *experimental*

* support for the following langauges:
  - ruby
  - javascript
  - coffeescript
  - mustache / handlebars
  - css / less css / scss
  - sass / haml / slim / jade
  - html / erb
  - json
  - yaml
  - markdown
  - php

## default settings

within `init.el` there a few basic settings you might want to override.

* `code-dir` - this is the root folder where all your projects reside, for the purpose of [`hemacs-projects`](https://github.com/waymondo/hemacs/tree/master/vendor). i have this set to `~/code/`.

* `default-font` - i'm grooving on [Meslo](https://github.com/andreberg/Meslo-Font) but you can change it to whatever. if the named font isn't found, it will usewhatever your emacs default is at 14px.
