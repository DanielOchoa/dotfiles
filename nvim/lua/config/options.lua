-- Neovim options (migrated from .vimrc)
local opt = vim.opt

-- Basic settings
opt.number = true
opt.wrap = true
opt.textwidth = 115
opt.colorcolumn = "+1"

-- Indentation
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.showmatch = true

-- UI
opt.cursorline = true
opt.cursorcolumn = true
opt.scrolloff = 3
opt.signcolumn = "yes"
opt.mouse = "a"
opt.updatetime = 300
opt.timeoutlen = 500

-- Performance
opt.lazyredraw = true
opt.regexpengine = 2

-- Files and backup
opt.hidden = true
opt.backup = true
opt.swapfile = false
opt.undofile = true
opt.autoread = true

-- Set backup directories (using Neovim standard paths)
opt.backupdir = vim.fn.expand("~/.local/share/nvim/backup//")
opt.undodir = vim.fn.expand("~/.local/share/nvim/undo//")

-- Create directories if they don't exist
local backup_dir = vim.fn.expand("~/.local/share/nvim/backup")
local undo_dir = vim.fn.expand("~/.local/share/nvim/undo")

if vim.fn.isdirectory(backup_dir) == 0 then
  vim.fn.mkdir(backup_dir, "p")
end
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p")
end

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Clipboard
opt.clipboard = "unnamed"

-- Terminal colors
opt.termguicolors = true

-- Comments format
opt.comments = "sl:/*,mb:*,elx:*/*"

-- Disable netrw (we'll use nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Buffer/tab behavior
opt.switchbuf = "useopen,usetab"
