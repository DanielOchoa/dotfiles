# Dan's Dotfiles

These are my dotfiles for the following tools

 - [tmux](https://github.com/tmux/tmux)
 - [vim](https://github.com/vim/vim)

## Install
 - Git clone this repo in your home directory (~). 
 - Run `./install.sh`. It will symlink the included dotfiles from this repo into your home directory.
 - Install [Vundle](https://github.com/VundleVim/Vundle.vim) to manage vim plugins. Install [tmux](https://github.com/tmux/tmux) with [Homebrew](https://brew.sh/). (`brew install tmux`)
 - Install [reattach-to-user-namespace](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard) with `https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard`. It allows you to copy paste within tmux in OSX.
 - Run `vim ~/.vimrc` then type `:BundleInstall`. This will install all vim plugins.

### This works with
 - vim 8.x
 - tmux 2.7+

## TODO
 - Automate other steps not on install.sh
