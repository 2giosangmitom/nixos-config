return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    window = {
      border = "rounded",
    },
    ignore_missing = false,
  },
  config = function(_, opts)
    local wk = require("which-key")

    wk.setup(opts)
    wk.register({
      c = { name = "Code", R = "Refactor" },
      u = { name = "UI" },
      f = { name = "Find/File" },
      n = { name = "Notifications" },
      d = { name = "Debug" },
      b = { name = "Buffer" },
      x = { name = "QuickFix/Diagnostics" },
      t = { name = "Test" },
    }, { prefix = "<leader>", mode = { "n", "x" } })
  end,
}
