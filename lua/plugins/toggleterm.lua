return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<C-\>]], -- To open a new terminal instance, prefix the terminal mapping with a number: [number][open_mapping]
			start_in_insert = true,
			auto_scroll = true,
			-- direction = "horizontal",
			direction = "float",
			autochdir = true,
			close_on_exit = true,
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,

			on_open = function(term)
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"n",
					"<leader>tq",
					":q!<CR>",
					{ noremap = true, desc = "Kill terminal instance" }
				)

				-- Clear keymaps that allow us to open other files in our terminal buffer
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<leader>fB", "", { noremap = true, desc = "" })
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<leader>fb", "", { noremap = true, desc = "" })
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<leader>ff", "", { noremap = true, desc = "" })
			end,
		},
	},
}
--
-- TODO
-- name terminals
-- open terminal from file tree
-- be able to swap between multiple sets of terminals like tabs
-- make the termial lua line name a bit better
-- show the realitve path from the working directory of the project
--
