# Dan's Dotfiles

These are my dotfiles for the following tools

 - [tmux](https://github.com/tmux/tmux)
 - [neovim](https://github.com/neovim/neovim) (primary editor)

## Install

 - Run `git clone https://github.com/DanielOchoa/dotfiles.git "${HOME}/.dotfiles"` in the terminal.
 - Run `"${HOME}/.dotfiles/install.sh"`. It will symlink the included dotfiles from this repo into your home directory.

### Neovim Setup
 - Install [Neovim](https://github.com/neovim/neovim) with `brew install neovim`.
 - Install dependencies: `brew install ripgrep fd` (required for telescope.nvim)
 - On first launch, Neovim will automatically install all plugins via lazy.nvim.
 - LSP servers and formatters will be installed automatically via Mason.

### Common Setup
 - Install [tmux](https://github.com/tmux/tmux) with [Homebrew](https://brew.sh/). (`brew install tmux`)

### Requirements

 - neovim 0.8+ (0.10+ recommended)
 - tmux 3.4

### Migration from Vim

If you were previously using the legacy Vim configuration from this repository:

1. The `.vimrc` file has been removed as it's no longer maintained
2. All functionality has been migrated to the modern Neovim configuration
3. Simply install Neovim and follow the setup instructions above
4. Your familiar keybindings and workflow will work the same way

## Neovim Features

The Neovim configuration includes modern alternatives to all Vim plugins:

- **File Explorer**: nvim-tree (replaces NERDTree)
- **Fuzzy Finding**: telescope.nvim (replaces ctrlp)
- **Status Line**: lualine.nvim (replaces vim-airline)
- **LSP Support**: Built-in LSP with mason.nvim for server management
- **Autocompletion**: nvim-cmp with multiple sources
- **Syntax Highlighting**: nvim-treesitter
- **Git Integration**: vim-fugitive + git signs
- **Auto-formatting**: conform.nvim with prettier, stylua, gofmt, etc.
- **Linting**: nvim-lint with eslint support

## Key Differences from Vim Config

- Uses **Lua** instead of Vimscript for configuration
- **lazy.nvim** for plugin management (much faster than Vundle)
- **LSP servers** replace language-specific plugins
- All keybindings preserved, but some enhanced (e.g., `<C-p>` for telescope)
- Automatic plugin installation and LSP server setup

## TODO

 - Automate other steps not on install.sh
