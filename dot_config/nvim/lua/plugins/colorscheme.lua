return {
  {
    "2giosangmitom/lienchi.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("lienchi").setup(opts)
      vim.cmd.colorscheme("lienchi")
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
