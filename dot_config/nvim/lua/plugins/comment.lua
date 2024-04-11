return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
  opts = {
    mappings = {
      basic = true,
      extra = true,
    },
    pre_hook = function() return vim.bo.commentstring end,
  },
}
