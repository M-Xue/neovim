local M = {}

M.init_colourscheme_keymaps = function()
	vim.keymap.set("n", "<leader>\\c", function()
		vim.cmd.colorscheme("catppuccin")
	end, { desc = "catppuccin" })

	vim.keymap.set("n", "<leader>\\g", function()
		vim.cmd.colorscheme("gruvbox")
	end, { desc = "gruvbox" })

	vim.keymap.set("n", "<leader>\\w", function()
		vim.cmd.colorscheme("kanagawa-wave")
	end, { desc = "kanagawa-wave" })

	vim.keymap.set("n", "<leader>\\l", function()
		vim.cmd.colorscheme("kanagawa-lotus")
	end, { desc = "kanagawa-lotus" })

	vim.keymap.set("n", "<leader>\\d", function()
		vim.cmd.colorscheme("kanagawa-dragon")
	end, { desc = "kanagawa-dragon" })

	vim.keymap.set("n", "<leader>\\T", function()
		require("tokyonight").setup({ style = "storm" })
		vim.cmd.colorscheme("tokyonight")
	end, { desc = "tokyonight storm" })

	vim.keymap.set("n", "<leader>\\t", function()
		require("tokyonight").setup({ style = "moon" })
		vim.cmd.colorscheme("tokyonight")
	end, { desc = "tokyonight storm" })
end

return M
