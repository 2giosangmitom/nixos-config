return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local icons = require("icons")

    local mode = {
      "mode",
      fmt = function(m) return " " .. m end,
    }

    local diff = {
      "diff",
      symbols = {
        added = icons.git.added,
        modified = icons.git.modified,
        removed = icons.git.deleted,
      },
      source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end,
    }

    local branch = {
      "branch",
      icon = icons.git.branch,
    }

    local progress = {
      "progress",
      fmt = function() return "%P/%L" end,
    }

    local tab_size = {
      function() return "Tab size: " .. vim.api.nvim_get_option_value("shiftwidth", { scope = "local" }) end,
    }

    -- Symbols
    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "lsp_document_symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
    })
    local lsp_symbols = {
      symbols.get,
      cond = symbols.has,
    }

    local diagnostics = {
      "diagnostics",
      symbols = {
        error = icons.diagnostic.Error .. " ",
        hint = icons.diagnostic.Hint .. " ",
        info = icons.diagnostic.Info .. " ",
        warn = icons.diagnostic.Warn .. " ",
      },
    }

    return {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {
            "neo-tree",
          },
        },
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      winbar = {
        lualine_c = { lsp_symbols },
      },
      sections = {
        lualine_a = { mode },
        lualine_b = {},
        lualine_c = { branch, diff },
        lualine_x = {
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          },
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          },
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
          },
          diagnostics,
        },
        lualine_y = { tab_size },
        lualine_z = { progress },
      },
      extensions = {
        "quickfix",
        "lazy",
        "neo-tree",
        "trouble",
        "nvim-dap-ui",
        "toggleterm",
      },
    }
  end,
}
