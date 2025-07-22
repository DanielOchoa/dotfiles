-- Colorscheme configuration
return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark",
        transparent = false,
        term_colors = true,
        ending_tildes = false,
        cmp_itemkind_reverse = false,
        code_style = {
          comments = "italic",
          keywords = "none",
          functions = "none",
          strings = "none",
          variables = "none",
        },
      })
      vim.cmd("colorscheme onedark")

      -- Color column highlight (from original config)
      vim.cmd("highlight ColorColumn ctermbg=235 guibg=#333435")
    end,
  },
}

