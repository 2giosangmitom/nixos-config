return {
  "numToStr/Comment.nvim",
  keys = {
    -- Use Ctrl + / to toggle comment
    {
      "<c-_>",
      function() require("Comment.api").toggle.linewise.current() end,
      desc = "Comment toggle current line",
    },
    {
      "<c-_>",
      "<esc><cmd>lua require('Comment.api').locked('toggle.linewise')(vim.fn.visualmode())<cr>",
      mode = "x",
      desc = "Comment toggle blockwise",
    },
  },
  dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
  opts = {
    mappings = {
      basic = false,
      extra = false,
    },
    pre_hook = function() return vim.bo.commentstring end,
  },
}
