-- Barbar configuration (cleaner buffer tabs)
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    -- Set barbar's options
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    no_name_title = '[ No Name ]',
  },
  config = function(_, opts)
    require('barbar').setup(opts)

    -- Make active buffer more noticeable using theme colors
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        -- Get theme colors
        local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
        local cursorline = vim.api.nvim_get_hl(0, { name = 'CursorLine' })
        local visual = vim.api.nvim_get_hl(0, { name = 'Visual' })
        local search = vim.api.nvim_get_hl(0, { name = 'Search' })

        -- Use Visual or Search background, fallback to a theme-appropriate color
        local active_bg = visual.bg or search.bg or cursorline.bg
        local active_fg = normal.fg

        vim.api.nvim_set_hl(0, 'BufferCurrent', {
          fg = active_fg,
          bg = active_bg,
          bold = true
        })
      end
    })

    -- Apply immediately
    vim.cmd('doautocmd ColorScheme')

    -- Override :q to close buffer instead of quitting nvim when multiple buffers exist
    vim.api.nvim_create_user_command('Q', function()
      local buffers = vim.fn.getbufinfo({ buflisted = 1 })
      local visible_buffers = {}
      for _, buf in ipairs(buffers) do
        if buf.listed == 1 then
          table.insert(visible_buffers, buf)
        end
      end

      if #visible_buffers > 1 then
        vim.cmd('BufferClose')
      else
        vim.cmd('quit')
      end
    end, {})

    -- Create a command alias so :q calls our custom Q command
    vim.cmd('cabbrev <expr> q (getcmdtype() == ":" && getcmdline() == "q") ? "Q" : "q"')

    -- Buffer navigation keymaps (using your familiar gt/gT pattern)
    local map = vim.keymap.set
    map('n', 'gt', '<Cmd>BufferNext<CR>', { desc = 'Next buffer' })
    map('n', 'gT', '<Cmd>BufferPrevious<CR>', { desc = 'Previous buffer' })
    map('n', '<leader>bc', '<Cmd>BufferClose<CR>', { desc = 'Close buffer' })
    map('n', '<leader>bp', '<Cmd>BufferPin<CR>', { desc = 'Pin/unpin buffer' })
    -- Optional: Keep some convenient shortcuts
    map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', { desc = 'Go to buffer 1' })
    map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', { desc = 'Go to buffer 2' })
    map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', { desc = 'Go to buffer 3' })
    map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', { desc = 'Go to buffer 4' })
    map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', { desc = 'Go to buffer 5' })
  end,
}
