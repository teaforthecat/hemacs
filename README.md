# hemacs

one man's ever evolving emacs setup. used on osx with carbon emacs 24+. i'm mainly writing ruby, java-and-coffee scripting, interfacing with git, command-lining, and writing object-oriented css. i'm opting to use git submodules for managing vendored packages in most cases over ELPA. things should be kind of document and organized and tweakable at this point.

## installation

(backup any existing ~/.emacs.d first)

1. `git clone git://github.com/waymondo/hemacs ~/.emacs.d`
2. `cd ~/.emacs.d && git submodule update --init --recursive`

installing emacs 24+ on osx is easiest with [homebrew](http://mxcl.github.com/homebrew) =>

`brew install emacs --cocoa --use-git-head`

`brew linkapps`

since we are already brewing, you might want to make sure you have these programs installed as well => 

`brew install git ack markdown ispell`

also, the first time you boot a handful of elisp packages will be installed so just relax for a sec dude.

## what does it come with?

* hemacs is basically just sprinkles on a cake of [all of these](https://github.com/waymondo/hemacs/tree/master/vendor)

* `hemacs-completion` - less typing with autocomplete, ido, and hippie expand

* `hemacs-windows` - popwin and buffer/window movement

* `hemacs-config`  - general default customizations and mode enabling

* `hemacs-git` - magit, magithub, open file in github

* `hemacs-dired` - dired detail hiding and buffer reuse / reverting

* `hemacs-pairs` - global electric pair mode with hungry delete and delete-active-region compatibility

* `hemacs-bindings` - bindings for modes, defuns, and some

* `hemacs-scrolling` - buffer scrolling behavior

* `hemacs-projects` - project workspace management and conveniences with persp-mode, popwin

* `hemacs-osx` - carbon / osx related settings (ignored if booted from terminal)

* `hemacs-ui` - font, theme massaging, highlight-tail, powerline, eliminating clutter

* `hemacs-console` - trying to make eshell, shell, and terminal more usable

* `hemacs-webkit` - browser consoling via [swank js](https://github.com/swank-js/swank-js) *experimental*

* support for the following langauges: 
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

* `code-dir` - this is the root folder where all your projects reside, for the purpose of [`hemacs-projecs`](https://github.com/waymondo/hemacs/tree/master/vendor). i have this set to `~/code/`.

* `default-font` - i'm grooving on [Meslo](https://github.com/andreberg/Meslo-Font) but you can change it to whatever. if the named font isn't found, it will usewhatever your emacs default is at 16px.
