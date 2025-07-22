-- Telescope configuration (replaces ctrlp.vim)
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
        path_display = { "truncate" },
        file_ignore_patterns = {
          "node_modules",
          "bower_components",
          ".git/",
          "dist/",
          "tmp/",
          "*.so",
          "*.swp",
          "*.zip",
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = false,
        },
      },
    })

    -- Enable telescope fzf native, if installed
    pcall(require("telescope").load_extension, "fzf")

    -- Telescope keymaps
    local keymap = vim.keymap.set
    local builtin = require("telescope.builtin")
    
    keymap("n", "<C-p>", builtin.find_files, { desc = "Find files" })
    keymap("n", "<leader>fg", builtin.live_grep, { desc = "Find string" })
    keymap("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    keymap("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
    keymap("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent files" })
    keymap("n", "<leader>fc", builtin.commands, { desc = "Find commands" })
  end,
}