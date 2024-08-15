-- Builtin
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Search buffers" })
vim.keymap.set("n", "<leader>fr", telescope.registers, { desc = "Search registers" })

vim.keymap.set("n", "<leader>fT", telescope.treesitter, { desc = "Find treesitter symbols" })
vim.keymap.set("n", "<leader>fm", telescope.marks, { desc = "Search marks" })
vim.keymap.set("n", "<leader>fj", telescope.jumplist, { desc = "Telescope jumplist" })

-- Extensions
vim.keymap.set(
	"n",
	"<leader>fy",
	":Telescope file_browser path=%:p:h select_buffer=true<CR> <ESC>",
	{ desc = "File browser current buffer" }
)
vim.keymap.set("n", "<leader>fu", ":Telescope undo<CR>", { desc = "Undo history" })
vim.keymap.set("n", "<leader>ft", ":Telescope toggleterm<CR>", { desc = "Find terminal" })
vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { desc = "Find projects" })
vim.keymap.set("n", "<leader>f'", ":Telescope harpoon marks<cr>", { desc = "Find harpoon file" })

-- String search
local telescope_live_grep_args = require("telescope").extensions.live_grep_args
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set("n", "<leader>fg", telescope_live_grep_args.live_grep_args, { desc = "Grep" })
vim.keymap.set("n", "<leader>fw", live_grep_args_shortcuts.grep_word_under_cursor, { desc = "Grep word under cursor" })
vim.keymap.set(
	"n",
	"<leader>fW",
	live_grep_args_shortcuts.grep_word_under_cursor_current_buffer,
	{ desc = "Grep buffer word under cursor" }
)
vim.keymap.set("n", "<leader>fs", telescope.current_buffer_fuzzy_find, { desc = "Fzf buffer" })
