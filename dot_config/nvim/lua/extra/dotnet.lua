return {
  {
    "iabdelkareem/csharp.nvim",
    ft = "cs",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "c_sharp" }) end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {},
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cs = { "clang-format" },
      },
    },
  },
}
