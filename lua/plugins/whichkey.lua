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
				{ "<leader>y", group = "File Tree" },
				{ "<leader>h", group = "Git" },
				{ "<leader>d", group = "Debug" },
				{ "<leader>m", group = "Marks" },
				{ "<leader>mm", name = " Toggle mark" },
				{ "<leader>md", name = " Delete marks in buffer" },
				{ "<leader>mj", name = " Next mark" },
				{ "<leader>mk", name = " Previous mark" },
				{ "<leader>mp", name = " Preview mark" },
			},
		},
		dependencies = {
			{ "echasnovski/mini.icons" },
			{ "nvim-tree/nvim-web-devicons" },
		},
	},
}
