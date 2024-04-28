return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "go", "gomod", "gosum", "gowork" }) end,
  },

  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {},
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "gopls" }) end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "gofmt" },
      },
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-go" },
    opts = function(_, opts) table.insert(opts.adapters, require("neotest-go")) end,
  },
}
