return {
  {
    "2giosangmitom/lienchi.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    version = "*",
    opts = {},
    init = function() vim.g.lienchi_debug = true end,
    config = function(_, opts)
      require("lienchi").setup(opts)
      vim.cmd.colorscheme("lienchi")
    end,
  },
}
