-- NvimTree
vim.keymap.set("n", "<leader>yy", ":NvimTreeToggle<CR>", { noremap = true, desc = "Toggle nvim-tree" })
vim.keymap.set("n", "<leader>yf", ":NvimTreeFocus<CR>", { noremap = true, desc = "Focus nvim-tree" })
vim.keymap.set("n", "<leader>yc", ":NvimTreeCollapse<CR>", { noremap = true, desc = "Collapse nvim-tree" })
vim.keymap.set("n", "<leader>yF", ":NvimTreeFindFile<CR>", { noremap = true, desc = "Find file nvim-tree" })

-- Outline
vim.keymap.set("n", "<leader>oo", ":Outline<cr>", { desc = " Symbol Outline" })
vim.keymap.set("n", "<leader>of", ":OutlineFocus<cr>", { desc = " Focus Outline" })
vim.keymap.set("n", "<leader>oc", ":OutlineFocusCode<cr>", { desc = " Focus Code" })
vim.keymap.set("n", "<leader>or", ":OutlineRefresh<cr>", { desc = " Refresh symbols" })

-- Window Movement
vim.keymap.set("n", "<leader>ss", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

vim.keymap.set("n", "<leader>sd", "<C-w>l", { desc = "Move cursor to right window" })
vim.keymap.set("n", "<leader>sD", "<C-w>L", { desc = "Move window to far right" })
vim.keymap.set("n", "<leader>sa", "<C-w>h", { desc = "Move cursor to left window" })
vim.keymap.set("n", "<leader>sA", "<C-w>H", { desc = "Move window to far left" })
vim.keymap.set("n", "<leader>sx", "<C-w>j", { desc = "Move cursor to window below" })
vim.keymap.set("n", "<leader>sX", "<C-w>J", { desc = "Move window to bottom" })
vim.keymap.set("n", "<leader>sw", "<C-w>k", { desc = "Move cursor to window above" })
vim.keymap.set("n", "<leader>sW", "<C-w>K", { desc = "Move window to top" })

vim.keymap.set("n", "<leader>sr", "<C-w>x", { desc = "Swap window with next" })
vim.keymap.set("n", "<leader>st", "<C-w>T", { desc = "Open new tab with window" })
vim.keymap.set("n", "<leader>s=", "<C-w>=", { desc = "Make all windows equal size" })
vim.keymap.set("n", "<leader>sq", ":close<cr>", { desc = "Close window" })

-- Tab Movement
vim.keymap.set("n", "<leader>kl", ":tabnew %<CR>", { desc = "Create new tab" })
vim.keymap.set("n", "<leader>kq", ":tabc<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>kj", ":tabn<CR>", { desc = "Move to next tab" })
vim.keymap.set("n", "<leader>kk", ":tabp<CR>", { desc = "Move to prev tab" })

-- Window Resize
-- Source: https://www.reddit.com/r/neovim/comments/10wru1c/how_do_i_resize_windows/
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -
