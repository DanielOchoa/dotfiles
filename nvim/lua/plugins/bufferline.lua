return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "thin", -- "slant", "thick", "thin", "slope"
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            separator = true
          }
        },
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = true,
        show_close_icon = false,
      }
    })
  end
}
