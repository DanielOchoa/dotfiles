-- Editor enhancement plugins
return {
  -- Tim Pope's sensible defaults
  { "tpope/vim-sensible" },

  -- Surround operations (modern Lua version)
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Auto-pairs for brackets, quotes, etc.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end,
  },

  -- Comment toggling
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Git integration
  { "tpope/vim-fugitive" },

  -- Tmux navigation
  { "christoomey/vim-tmux-navigator" },

  -- Auto-close blocks (if-end, do-end, etc.)
  { "tpope/vim-endwise" },

  -- Easy text alignment
  {
    "junegunn/vim-easy-align",
    config = function()
      -- Keymaps are already set in keymaps.lua
    end,
  },

  -- Ripgrep integration
  {
    "jremmen/vim-ripgrep",
    config = function()
      -- Set ripgrep command options
      vim.g.rg_command = "rg --vimgrep --smart-case --follow"
    end,
  },
}

