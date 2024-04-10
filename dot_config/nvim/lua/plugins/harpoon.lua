local function toggle_telescope(harpoon_files)
  local conf = require("telescope.config").values
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    })
    :find()
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = function()
    local harpoon = require("harpoon")
    return {
      {
        "<leader>fa",
        function() harpoon:list():append() end,
        desc = "Add file",
      },
      {
        "<leader>fe",
        function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        desc = "Toggle quick menu",
      },
      {
        "<leader>fm",
        function() toggle_telescope(harpoon:list()) end,
        desc = "Show marks in Telescope",
      },
      {
        "<leader>fc",
        function() harpoon:list():clear() end,
        desc = "Clear all marks",
      },
    }
  end,
  opts = {},
}
