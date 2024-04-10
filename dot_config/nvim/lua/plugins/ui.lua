return {
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    keys = {
      { "<leader>fT", "<cmd>TodoTelescope<cr>", desc = "Todos" },
    },
    opts = {
      keywords = {
        TODO = { icon = " ", color = "info" },
        HACK = { icon = "󱠇 ", color = "warning" },
        FIX = { icon = " ", color = "error" },
        TEST = { icon = "󰙨 ", color = "test" },
      },
    },
  },

  {
    "romgrk/barbar.nvim",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<leader>bc", "<cmd>BufferClose<cr>", desc = "Close Buffer" },
      { "<S-l>", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
      { "<S-h>", "<cmd>BufferPrevious<cr>", desc = "Previous Buffer" },
    },
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = false,
      insert_at_start = true,
      sidebar_filetypes = {
        ["neo-tree"] = true,
      },
    },
  },

  {
    "stevearc/dressing.nvim",
    init = function()
      for _, func in pairs({ "input", "select" }) do
        vim.ui[func] = function(...)
          require("lazy").load({ plugins = { "dressing.nvim" } })
          return vim.ui[func](...)
        end
      end
    end,
    opts = {
      input = { default_prompt = "➤ " },
      select = { backend = { "telescope", "builtin" } },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { show_start = false, show_end = false, show_exact_scope = false },
      exclude = {
        buftypes = {
          "nofile",
          "terminal",
        },
        filetypes = {
          "help",
          "dashboard",
          "lazy",
          "neo-tree",
          "Trouble",
          "toggleterm",
          "mason",
        },
      },
    },
  },
}
