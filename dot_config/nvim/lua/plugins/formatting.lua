return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>cf", function() require("conform").format({ lsp_fallback = true }) end, desc = "Format" },
  },
  dependencies = {
    "williamboman/mason.nvim",
  },
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
  },
}
