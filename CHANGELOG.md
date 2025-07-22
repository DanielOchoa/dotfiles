# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-07-22

### Added
- **Neovim Configuration**: Complete Lua-based Neovim setup alongside existing Vim config
- **Modern Plugin Manager**: lazy.nvim for fast, lazy-loading plugin management
- **LSP Integration**: Native Neovim LSP with mason.nvim for server management
- **Enhanced File Explorer**: nvim-tree.lua with better performance and features
- **Powerful Fuzzy Finding**: telescope.nvim with advanced search capabilities
- **Modern Status Line**: lualine.nvim with improved performance and customization
- **Auto-completion**: nvim-cmp with multiple sources and snippet support
- **Syntax Highlighting**: nvim-treesitter for better language support
- **Auto-formatting**: conform.nvim with prettier, stylua, gofmt, and more
- **Linting**: nvim-lint with eslint integration
- **Modern Surround**: nvim-surround written in Lua for better performance

### Changed
- **Plugin Replacements**: 
  - NERDTree → nvim-tree.lua (8k stars)
  - ctrlp.vim → telescope.nvim (18k stars)
  - vim-airline → lualine.nvim (7k stars)
  - Vundle → lazy.nvim (modern package manager)
  - ALE → mason.nvim + nvim-lint + conform.nvim
  - vim-surround → nvim-surround (4k stars)
- **Configuration Language**: Migrated from Vimscript to Lua for better performance
- **LSP Support**: Replaced language-specific plugins with native LSP servers
- **Installation Process**: Updated install.sh to include Neovim config symlinks
- **Documentation**: Enhanced README.md with comprehensive Neovim setup instructions

### Maintained
- **All Keybindings**: Preserved all custom key mappings and leader commands
- **Workflow Compatibility**: Auto-trim whitespace, split navigation, clipboard integration
- **Theme Support**: Migrated "one" colorscheme to onedark.nvim
- **Language Support**: TypeScript, JavaScript, Go, Rust, Elixir via LSP
- **Tmux Integration**: vim-tmux-navigator and clipboard settings
- **Git Integration**: vim-fugitive and enhanced git features

### Technical Details
- **Configuration Structure**: Modular Lua configuration in `nvim/lua/`
- **Plugin Management**: Automatic plugin installation on first launch
- **LSP Servers**: Auto-installation of tsserver, gopls, rust_analyzer, elixirls
- **Backup Compatibility**: Maintains existing Vim configuration for users preferring Vim
- **Performance**: Significantly faster startup and operation compared to Vim setup

### Migration Benefits
- **Speed**: Lazy-loading plugins and native Lua execution
- **Modern Features**: Built-in LSP, Treesitter, and advanced completion
- **Maintainability**: Cleaner, more organized configuration structure  
- **Future-proof**: Uses actively maintained, popular plugins
- **Developer Experience**: Enhanced debugging, formatting, and language support

This release represents a complete modernization of the development environment while preserving all existing workflows and keybindings.

## [2.0.1] - 2025-07-22

### Fixed
- **LSP Configuration**: Fixed mason-lspconfig setup by replacing deprecated `tsserver` with `ts_ls` 
- **Regex Engine Conflict**: Resolved cmp-cmdline plugin error by updating `regexpengine` setting from 1 to 2
- **Command-line Completion**: Fixed regex parsing issues that were causing plugin loading failures

### Removed
- **Legacy Options**: Cleaned up outdated Vim settings for modern Neovim:
  - Removed `encoding = "utf-8"` (redundant in Neovim)
  - Removed `ttyfast = true` (irrelevant in modern terminals)
  - Removed `showmode`, `showcmd`, `ruler` (replaced by lualine.nvim)
  - Removed `wildmenu`/`wildmode` (replaced by telescope.nvim)
  - Removed `laststatus`, `backspace` (defaults in Neovim)
  - Removed `visualbell = true` (often annoying in modern setups)

### Changed
- **Backup Directories**: Updated to use proper Neovim standard paths (`~/.local/share/nvim/`)
- **File Tree Filters**: Removed `.git` from custom filters to show git-related files

### Added
- **Modern Neovim Options**: 
  - `signcolumn = "yes"` (always show LSP diagnostic signs)
  - `mouse = "a"` (mouse support enabled)
  - `updatetime = 300` (faster LSP diagnostics)
  - `timeoutlen = 500` (faster key sequence timeout)
- **Auto-reload System**: Added `autoread = true` and autocommands to automatically reload files when changed externally
  - Triggers on focus change, buffer enter, and cursor idle events
  - Shows notification when files are reloaded from disk
  - Enables seamless integration with external file modifications

### Documentation
- **Legacy Notice**: Added deprecation notice to original .vimrc pointing users to Neovim config