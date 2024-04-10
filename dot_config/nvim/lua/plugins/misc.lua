return {
  {
    "farmergreg/vim-lastplace",
    event = { "BufReadPost" },
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  {
    "johmsalas/text-case.nvim",
    keys = {
      { "ga", mode = "v", desc = "Text case" },
    },
    opts = {},
  },

  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "Wansmer/treesj",
    keys = {
      { "<leader>m", vim.cmd.TSJToggle, desc = "Toggle node under cursor" },
      { "<leader>s", vim.cmd.TSJSplit, desc = "Split node under cursor" },
      { "<leader>j", vim.cmd.TSJJoin, desc = "Join node under cursor" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
    },
  },

  {
    "echasnovski/mini.move",
    keys = {
      { ">", mode = { "n", "v" } },
      { "<", mode = { "n", "v" } },
      { "<A-j>", mode = { "n", "v" } },
      { "<A-k>", mode = { "n", "v" } },
    },
    opts = {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = "<",
        right = ">",
        down = "<A-j>",
        up = "<A-k>",

        -- Move current line in Normal mode
        line_left = "<",
        line_right = ">",
        line_down = "<A-j>",
        line_up = "<A-k>",
      },
    },
  },
}
