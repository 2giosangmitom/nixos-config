return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = {
    filetypes_denylist = {
      "Trouble",
      "trouble",
      "qf",
      "lazy",
      "dashboard",
      "mason",
      "neo-tree",
      "notify",
    },
    delay = 200,
    large_file_cutoff = 2000,
    min_count_to_highlight = 2,
    large_file_overrides = {
      providers = { "lsp" },
    },
  },
  config = function(_, opts) require("illuminate").configure(opts) end,
  keys = {
    { "]r", function() require("illuminate")["goto_next_reference"](false) end, desc = "Next Reference" },
    { "[r", function() require("illuminate")["goto_prev_reference"](false) end, desc = "Prev Reference" },
    { "<leader>uR", function() require("illuminate").toggle_buf() end, desc = "Toggle reference highlighting" },
  },
}
