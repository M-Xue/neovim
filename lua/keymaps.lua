local util = require("util")

vim.keymap.set("n", "<leader>.", util.print_attached_clients, { desc = "See attached clients" })

local colorscheme_picker = require("plugins.ui.colorscheme.picker").colorscheme_picker
vim.keymap.set("n", "<leader>\\", colorscheme_picker, { desc = "Colorscheme menu" })
local print_curr_colorscheme = require("plugins.ui.colorscheme.util").print_curr_colorscheme
vim.keymap.set("n", "<leader>|", print_curr_colorscheme, { desc = "Current colorscheme" })

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>`", ":wa<CR>:qa<CR>", { desc = "Quit NeoVim" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" }) -- TODO dont make this close the buffer if it is the last buffer open -- <leader>q closes windows. If you only have one window, you will exit NVim
vim.keymap.set("n", "<leader>p", ":Format<CR>", { desc = "Format" })
vim.keymap.set("n", "<leader>?", ":Cheatsheet<CR>", { desc = "Cheatsheet" })
vim.keymap.set("n", "<leader>c", ":cd ", { desc = "Change directory" })
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<cr>", { desc = "Undo tree" })
vim.keymap.set("n", "<leader>z", ":NoNeckPain<cr>", { desc = "Zen mode" })
vim.keymap.set("n", "<leader>o", ":Outline<cr>", { desc = "Symbol Outline" })

-- This will remove all diagnostics so you need to do some text action to get them back
vim.keymap.set("n", "<leader>,", require("plugins.linter").toggle_spell_check, { desc = "Toggle spell check linter" })

require("plugins.git.keymaps")
require("plugins.search.keymaps")
require("plugins.terminal.keymaps")
require("plugins.navigation.keymaps")

-- LSP
-- g: LSP
-- e: Diagnostics
