# Dan's Dotfiles

These are my dotfiles for the following tools

 - [tmux](https://github.com/tmux/tmux)
 - [vim](https://github.com/vim/vim)

## Install

 - Run `git clone https://github.com/DanielOchoa/dotfiles.git "${HOME}/.dotfiles"` in the terminal.
 - Run `"${HOME}/.dotfiles/install.sh"`. It will symlink the included dotfiles from this repo into your home directory.
 - You may want to run `brew install vim` to get the latest version of vim since Macos comes with vim 8.x.
 - Install [Vundle](https://github.com/VundleVim/Vundle.vim) to manage vim plugins. Install [tmux](https://github.com/tmux/tmux) with [Homebrew](https://brew.sh/). (`brew install tmux`)
 - Install [reattach-to-user-namespace](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard) with `https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard`. It allows you to copy paste within tmux in OSX.
 - Install [Ripgrep](https://github.com/BurntSushi/ripgrep), the fastest grep-like tool.
 - Run `vim ~/.vimrc` then type `:BundleInstall`. This will install all vim plugins.

### This works with

 - vim 8.x and above
 - tmux 3.3a

## TODO

 - Automate other steps not on install.sh
