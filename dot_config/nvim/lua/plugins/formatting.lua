return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>cf", function() require("conform").format({ lsp_fallback = true, timeout_ms = 5000 }) end, desc = "Format" },
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
