-- Neovim autocommands (migrated from .vimrc)

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- TrimWhiteSpace function
_G.TrimWhiteSpace = function()
  local save_cursor = vim.fn.getpos(".")
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.setpos(".", save_cursor)
end

-- Auto-trim whitespace on save
local trim_group = augroup("TrimWhitespace", { clear = true })
autocmd({ "BufWritePre" }, {
  group = trim_group,
  pattern = "*",
  callback = function()
    TrimWhiteSpace()
  end,
})

-- Save files when losing focus
autocmd({ "FocusLost" }, {
  pattern = "*",
  command = "silent! wa",
})

-- Language-specific settings
-- Go files
autocmd({ "FileType" }, {
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false
  end,
})

-- Auto-reload files when they change externally (For Cloude Code makign changes, I want these to be reflected
-- immediately)
local auto_reload_group = augroup("AutoReload", { clear = true })
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = auto_reload_group,
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})
autocmd({ "FileChangedShellPost" }, {
  group = auto_reload_group,
  pattern = "*",
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
})

-- Tmux key fixes for screen term
if vim.env.TERM and vim.env.TERM:match("^screen") then
  vim.cmd([[
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
  ]])
end
