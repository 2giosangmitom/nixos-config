return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  opts = {
    prompt_func_return_type = { go = true },
    prompt_func_param_type = { go = true },
    show_success_message = false,
  },
  keys = {
    { "<leader>cRi", mode = { "x", "n" }, "<cmd>Refactor inline_var<cr>", desc = "Inline variable" },
    { "<leader>cRf", mode = { "x", "n" }, "<cmd>Refactor extract<cr>", desc = "Extract function" },
    { "<leader>cRF", mode = { "x", "n" }, "<cmd>Refactor extract_to_file<cr>", desc = "Extract function to file" },
    { "<leader>cRv", mode = { "x", "n" }, "<cmd>Refactor extract_var<cr>", desc = "Extract variable" },
    { "<leader>cRI", mode = { "x", "n" }, "<cmd>Refactor inline_func<cr>", desc = "Inline function" },
    { "<leader>cRb", "<cmd>Refactor extract_block<cr>", desc = "Extract block" },
    { "<leader>cRB", "<cmd>Refactor extract_block_to_file<cr>", desc = "Extract block to file" },
  },
  cmd = "Refactor",
}
