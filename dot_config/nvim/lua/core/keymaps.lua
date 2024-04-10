local map = vim.keymap.set
vim.g.mapleader = " "

map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<c-s>", "<cmd>silent! update | redraw<cr>", { desc = "Save" })
map("n", "<esc>", "<cmd>noh<cr>", { desc = "Clear highlights" })

-- Window navigation
map("n", "<c-h>", "<c-w>h", { desc = "Focus on left window", remap = true })
map("n", "<c-j>", "<c-w>j", { desc = "Focus on below window", remap = true })
map("n", "<c-k>", "<c-w>k", { desc = "Focus on above window", remap = true })
map("n", "<c-l>", "<c-w>l", { desc = "Focus on right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Better j/k
map({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true })
map({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true })

-- Toggle options
map("n", "<leader>ur", "<cmd>set relativenumber!<cr>", { desc = "Toggle relativenumber" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- Move in insert mode
map("i", "<C-h>", "<Left>", { desc = "Move Left" })
map("i", "<C-l>", "<Right>", { desc = "Move Right" })
map("i", "<C-j>", "<Down>", { desc = "Move Down" })
map("i", "<C-k>", "<Up>", { desc = "Move Up" })
