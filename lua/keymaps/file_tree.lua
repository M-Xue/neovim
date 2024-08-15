-- File Tree
vim.keymap.set("n", "<leader>yy", ":NvimTreeToggle<CR>", { noremap = true, desc = "Toggle nvim-tree" })
vim.keymap.set("n", "<leader>yf", ":NvimTreeFocus<CR>", { noremap = true, desc = "Focus nvim-tree" })
vim.keymap.set("n", "<leader>yc", ":NvimTreeCollapse<CR>", { noremap = true, desc = "Collapse nvim-tree" })
vim.keymap.set("n", "<leader>yF", ":NvimTreeFindFile<CR>", { noremap = true, desc = "Find file nvim-tree" })
