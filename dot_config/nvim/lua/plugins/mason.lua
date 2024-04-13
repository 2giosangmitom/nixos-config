return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  opts = {
    ensure_installed = { "stylua", "lua-language-server" },
  },
  config = function(_, opts)
    require("mason").setup(opts)

    ---Install a package using Mason
    ---@param package_name string
    local function install_package(package_name)
      local registry = require("mason-registry")
      local optional = require("mason-core.optional")
      local p = require("mason-core.package")
      local source = p.Parse(package_name)

      optional
        .of_nilable(source)
        :map(function(source_name)
          local ok, pkg = pcall(registry.get_package, source_name)
          if ok then return pkg end
        end)
        :if_present(function(pkg)
          if not pkg:is_installed() then
            vim.notify(("Installing %s"):format(pkg.name), vim.log.levels.INFO, { title = "mason.nvim" })
            pkg:install()
          end
        end)
    end

    if type(opts.ensure_installed) == "table" then
      ---@type table<string, boolean>
      local added = {}
      opts.ensure_installed = vim.tbl_filter(function(lang)
        if added[lang] then return false end
        added[lang] = true
        return true
      end, opts.ensure_installed)
    end

    for _, package_name in ipairs(opts.ensure_installed) do
      install_package(package_name)
    end
  end,
}
