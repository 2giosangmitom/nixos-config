return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    init = function()
      vim.g.lsp_zero_ui_float_border = 0
      vim.g.lsp_zero_ui_signcolumn = 0
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "VonHeikemen/lsp-zero.nvim",
      { "folke/neodev.nvim", opts = {} },
      { "folke/neoconf.nvim", cmd = "Neoconf", opts = {} },
    },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      servers = {
        lua_ls = {},
      },
      setup = {},
    },
    config = function(_, opts)
      local lsp_zero = require("lsp-zero")
      local lspconfig = require("lspconfig")
      local icons = require("icons").diagnostic

      vim.diagnostic.config({
        underline = true,
        update_in_insert = true,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "",
        },
        severity_sort = true,
      })

      require("lspconfig.ui.windows").default_options.border = "rounded"

      lsp_zero.on_attach(function(_, bufnr) lsp_zero.default_keymaps({ buffer = bufnr }) end)

      lsp_zero.set_sign_icons({
        error = icons.Error,
        warn = icons.Warn,
        hint = icons.Hint,
        info = icons.Info,
      })

      for server, server_opts in pairs(opts.servers) do
        (function()
          if opts.setup[server] then
            if opts.setup[server](server_opts) then return end
          end
          lspconfig[server].setup(server_opts)
        end)()
      end
    end,
  },
}
