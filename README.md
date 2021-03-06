# hemacs

one man's ever evolving emacs setup. used on osx with carbon emacs 24+. i'm mainly writing ruby, java-and-coffee scripting, interfacing with git, command-lining, and writing object-oriented stylesheets and templates. [MELPA](http://melpa.milkbox.net) is my preferred external package archive manager. the code should be somewhat documented and organized and tweakable at this point.

## installation

(backup any existing ~/.emacs.d first)

`git clone git://github.com/waymondo/hemacs ~/.emacs.d`

indeed, installing carbon emacs 24+ on osx is easiest with [homebrew](http://mxcl.github.com/homebrew). i go cutting edge like this =>

`
brew install emacs --cocoa --use-git-head --srgba --HEAD  
mv /usr/local/Cellar/emacs/HEAD/Emacs.app /Applications
`
since we are already brewing, you might want to make sure you have these programs installed as well =>

`brew install ag git ack markdown ispell`

also, the first time you boot a whole bunch of elisp packages will be installed so just relax.

## what does it come with?

hemacs is basically just sprinkles on a cake of [all of these](https://github.com/waymondo/hemacs/blob/master/packages.el)

with glitz in the form of these two 24+ modified color themes =>

- [misteroizo](https://github.com/waymondo/hemacs/blob/master/misteroizo-theme.el)
- [birds-of-paradise](https://github.com/waymondo/hemacs/blob/master/birds-of-paradise-theme.el)

and then there are these tuning modules =>

* `hemacs-base` - bunch of general configurations
* `hemacs-persp` - heavily relying on `persp-mode` for project / workspace management
* `hemacs-ido` - minibuffer cycling enhancements
* `hemacs-hippie` - (usually) tab-based completion tweaking
* `hemacs-hyper-jump` - lightning fast buffer switching
* `hemacs-windows`  - window management and `popwin` settings
* `hemacs-indent` - indent on enter and pasting with shifting bindings
* `hemacs-copy-paste` - yank and kill modifications
* `hemacs-bindings` & `hemacs-chords` - global key bindings and abusing `keychord-mode`
* `hemacs-git` - git and github helpers
* `hemacs-shell` - attempting to make emacs shell actually usable
* `hemacs-project-shell` - using `perspective-mode` to spawn project shells, command buffers, and background processes
* `hemacs-dired` - a less noisy dired with auto-revert and buffer reuse
* `hemacs-todo` - a simple global todo list system using `org-capture`, grouped by project headers
* `hemacs-ui` - `git-gutter`, `powerline`, scrolling behavior, fullscreen, and other visual changes

as well as support (with some massaging) for the following languages =>

- ruby
- javascript & coffescript
- css, less css, scss, stylus
- templating languages like sass, haml, slim, jade, handlebars
- html / erb
- random sometimes stuff like yaml, markdown, php

## default settings

within `init.el` there a few basic settings you might want to override.

* `code-dir` - this is the root folder where all your code projects reside; home base for heavy use of `perspective-mode`. i have this set to `~/code/`.
