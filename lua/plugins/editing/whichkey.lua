return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			spec = {
				{ "<leader>f", group = "Telescope" },
				{ "<leader>s", group = "Window" },
				{ "<leader>k", group = "Tab" },
				{ "<leader>t", group = "Terminal" },
				{ "<leader>c", group = "Comment" },
				{ "<leader>y", group = "File Tree" },
				{ "<leader>h", group = "Git" },
				{ "<leader>d", group = "Debug" },
				{ "<leader>m", group = "Marks" },
				{ "<leader>|", name = "Current colourscheme", icon = require("icons.symbols")["Color"] },
				{ "<leader>\\", name = "Pick colourscheme", icon = require("icons.symbols")["Color"] },
				{ "<leader>mm", name = "Toggle mark" },
				{ "<leader>md", name = "Delete marks in buffer" },
			},
		},
		dependencies = {
			{ "echasnovski/mini.icons" },
			{ "nvim-tree/nvim-web-devicons" },
		},
	},
}
