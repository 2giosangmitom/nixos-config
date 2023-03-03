local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end

local b = null_ls.builtins

null_ls.setup {
  debug = true,
  sources = {
    b.formatting.stylua,
    b.formatting.prettierd,
  },
}
