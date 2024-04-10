local opt = vim.opt

opt.autowrite = true
opt.cmdheight = 0
opt.preserveindent = true
opt.clipboard = "unnamedplus"
opt.conceallevel = 2
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.history = 100
opt.infercase = true
opt.linebreak = true
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.laststatus = 3
opt.list = false
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.shortmess = vim.tbl_deep_extend("force", vim.opt.shortmess:get(), { s = true, I = true })
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.timeout = true
opt.timeoutlen = 300
opt.title = true
opt.writebackup = false
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"
opt.wildmode = "longest:full,full"
opt.wrap = false
opt.fillchars = { eob = " " }
opt.breakindent = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.copyindent = true

vim.g.markdown_recommended_style = 0

vim.cmd([[
  aunmenu PopUp.How-to\ disable\ mouse
  aunmenu PopUp.Paste
  aunmenu PopUp.Select\ All
  aunmenu PopUp.-1-
]])
