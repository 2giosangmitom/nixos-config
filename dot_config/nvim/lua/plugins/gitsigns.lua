return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "󰍵" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "▎" },
    },
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc }) end
      map("n", "]h", gs.next_hunk, "Next hunk")
      map("n", "[h", gs.prev_hunk, "Prev hunk")
      map("n", "<leader>ghb", function() gs.blameline({ full = true }) end, "Blame line")
      map({ "n", "v" }, "<leader>ghs", gs.stage_hunk, "Stage hunk")
      map({ "n", "v" }, "<leader>ghr", gs.reset_hunk, "Reset hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk")
      map("n", "<leader>ud", gs.toggle_deleted, "Toggle deleted")
    end,
  },
}
