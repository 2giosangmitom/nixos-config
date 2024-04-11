return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "bash" }) end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        sh = { "shellcheck" },
      },
    },
  },
}
