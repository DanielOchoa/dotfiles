-- Neovim keymaps

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Escape alternatives
keymap("i", "jj", "<Esc>", opts)
keymap("i", "kk", "<C-O>o", opts) -- Jump to next line while in insert mode
keymap("i", "<C-c>", "<CR><Esc>O", opts)

-- Search improvements - use Telescope live grep with highlighting
-- keymap("n", "/", function()
--   require("telescope.builtin").live_grep({
--     attach_mappings = function(prompt_bufnr, map)
--       local actions = require("telescope.actions")
--       local action_state = require("telescope.actions.state")
--
--       -- Add custom action that runs after default behavior
--       map("i", "<CR>", function()
--         local picker = action_state.get_current_picker(prompt_bufnr)
--         local prompt = picker:_get_prompt()
--
--         -- Run the default select action first
--         actions.select_default(prompt_bufnr)
--
--         -- Then set search register and highlight the term
--         if prompt and prompt ~= "" then
--           vim.fn.setreg("/", prompt)
--           vim.cmd("set hlsearch")
--         end
--       end)
--
--       return true
--     end,
--   })
-- end, { desc = "Live grep search with highlighting" })
keymap("n", "/", "/\\v", { noremap = true })
keymap("v", "/", "/\\v", { noremap = true })

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

-- Window splitting
keymap("n", "<leader>w", "<C-w>v<C-w>l", opts)

-- Visual shifting (does not exit Visual mode)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Indent entire file
keymap("n", "<Leader>i", "mmgg=G`m", opts)

-- Trim whitespace
keymap("n", "<Leader>rts", ":call TrimWhiteSpace()<CR>", { noremap = true, silent = true })

-- File tree toggle (will be used by nvim-tree)
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Easy Align keymaps (will be configured when plugin loads)
keymap("v", "<Enter>", "<Plug>(EasyAlign)", { noremap = false })
keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = false })

-- JSDoc (placeholder for when plugin loads)
keymap("n", "<Leader>d", ":JsDoc<CR>", opts)

-- Test running keymaps (placeholders)
keymap("n", "<Leader>t", ":call RunCurrentSpecFile()<CR>", opts)
keymap("n", "<Leader>s", ":call RunNearestSpec()<CR>", opts)
keymap("n", "<Leader>l", ":call RunLastSpec()<CR>", opts)
keymap("n", "<Leader>a", ":call RunAllSpecs()<CR>", opts)

-- LSP keymaps with styled floating windows
keymap("n", "K", function()
  vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "LSP hover" })

keymap("i", "<C-s>", function()
  vim.lsp.buf.signature_help({ border = "rounded" })
end, { desc = "LSP signature help" })
