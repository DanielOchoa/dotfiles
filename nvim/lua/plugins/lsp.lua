-- LSP configuration (replaces ALE and language-specific plugins)
return {
  -- Mason for managing LSP servers, linters, formatters
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Mason integration with lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls", -- TypeScript/JavaScript (formerly tsserver)
          "gopls", -- Go
          -- "rust_analyzer", -- Rust
          -- "elixirls",      -- Elixir
          "lua_ls", -- Lua
        },
      })
    end,
  },

  -- configure LuaLS for nvim config edition (makes vim word a global known)
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/lazydev.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Configure diagnostics to show inline messages
      vim.diagnostic.config({
        virtual_text = {
          prefix = '●', -- Could be '■', '▎', 'x'
          spacing = 4,
          source = "if_many", -- show source if multiple sources
        },
        float = {
          source = true, -- Or "if_many"
          border = "rounded",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '✗',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.INFO] = 'ℹ',
            [vim.diagnostic.severity.HINT] = '💡',
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Capabilities
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Setup servers automatically
      mason_lspconfig.setup({
        automatic_installation = true,
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              -- on_attach = on_attach,
              capabilities = capabilities,
            })
          end,

          -- Special configuration for specific servers
          ["ts_ls"] = function()
            lspconfig.ts_ls.setup({
              -- on_attach = on_attach,
              capabilities = capabilities,
              filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
            })
          end,

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              -- on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        javascript = { "eslint" },
        typescript = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
      }

      -- Auto-lint on save
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          lua = { "stylua" },
          go = { "gofmt" },
          rust = { "rustfmt" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
}
