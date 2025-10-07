-- Neovim keymaps - configure Cursor or VSCode to point to this init file since not
-- all of our plugins and config will work on neovim running for cursor

local keymap = vim.keymap.set

-- remap leader before anything else
vim.g.mapleader = ","
local opts = { noremap = true, silent = true }

-- Escape alternatives
keymap("i", "jj", "<Esc>", opts)
keymap("i", "kk", "<C-O>o", opts) -- Jump to next line while in insert mode
keymap("i", "<C-c>", "<CR><Esc>O", opts)

-- keymap("n", "/", "/\\v", { noremap = true })
-- keymap("v", "/", "/\\v", { noremap = true })

keymap("n", "<leader><space>", ":noh<cr>", opts)
keymap("n", "<tab>", "%", opts)
keymap("v", "<tab>", "%", opts)

-- Command mode shortcut
keymap("n", ";", ":", { noremap = true })

-- Split navigation (CTRL-H/J/K/L)
keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)

-- Visual shifting (does not exit Visual mode)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Indent entire file
keymap("n", "<Leader>i", "mmgg=G`m", opts)

-- Trim whitespace
keymap("n", "<Leader>rts", ":call TrimWhiteSpace()<CR>", { noremap = true, silent = true })

-- JSDoc (placeholder for when plugin loads)
keymap("n", "<Leader>d", ":JsDoc<CR>", opts)

-- For case-insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- For yanking to the system clipboard
vim.opt.clipboard = "unnamedplus"
