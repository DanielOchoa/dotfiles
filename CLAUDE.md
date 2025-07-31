# Dan's Dotfiles Repository

Personal configuration files for tmux, vim, and neovim development environment.

## Structure
- **Root**: `.tmux.conf`, `install.sh` (symlinks dotfiles to home directory)
- **nvim/**: Modern Neovim configuration in Lua
  - **lua/plugins/**: Plugin configurations using lazy.nvim
  - **lua/plugins/lsp.lua**: LSP setup with Mason, supports TypeScript, Go, Rust, Elixir, Lua
  - **lua/plugins/editor.lua**: Editor enhancements (surround, autopairs, git, etc.)

## Key Points
- **Migration**: Moving from Vim (deprecated) to Neovim (recommended)
- **Plugin Manager**: lazy.nvim (replaces Vundle)
- **LSP**: Built-in LSP with auto-install via Mason
- **Languages**: Primary support for TypeScript/JS, Go, Rust, Elixir, Lua
- **Features**: Auto-formatting (conform.nvim), linting (nvim-lint), fuzzy finding (telescope)

## Recent Work
- Added autoreload functionality for Claude Code file changes
- Migrated vim settings to nvim
- Updated plugin configurations

## Commands
- Install: `~/.dotfiles/install.sh`
- Dependencies: `brew install neovim ripgrep fd`

## Claude Instructions
- Match existing code style exactly - preserve spacing, indentation, and line endings
- No trailing blank lines unless already present
- Don't reformat existing code unless explicitly asked