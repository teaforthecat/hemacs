# hemacs

one man's ever evolving emacs setup. used on osx with carbon emacs 24+.

## installation

1. `git clone git://github.com/waymondo/hemacs`
2. `ln -s $PWD/hemacs $HOME/.emacs.d`
3. `cd $HOME/.emacs.d && git submodule update --init --recursive`

installing emacs 24+ on osx is easy with [homebrew](http://mxcl.github.com/homebrew) =>

`brew install emacs --cocoa`
`brew linkapps`

the first time you boot a bunch of elisp packages will be installed so practice your patience.
