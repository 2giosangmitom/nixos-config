return {
  {
    "2giosangmitom/lienchi.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      vim.g.lienchi_debug = true
      require("lienchi").setup(opts)
      vim.cmd.colorscheme("lienchi")
    end,
  },

  {
    "folke/tokyonight.nvim",
    enabled = false,
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
