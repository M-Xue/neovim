return {
	{
		"folke/which-key.nvim",
		-- event = "VeryLazy",
		-- init = function()
		-- 	vim.o.timeout = true
		-- 	vim.o.timeoutlen = 300
		-- end,
		-- config = function()
		-- 	local wk = require("which-key")
		-- 	-- Help link: https://medium.com/@shaikzahid0713/which-key-7554ac347c9d

		-- 	--[[ wk.setup({
		-- 		window = {
		-- 			border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
		-- 		},
		-- 	}) ]]

		-- 	local mappings = {
		-- 		["<leader>"] = {
		-- 			f = { name = "Telescope" },
		-- 			s = { name = "Window" },
		-- 			k = { name = "Tab" },
		-- 			t = { name = "Terminal" },
		-- 			c = { name = "Comment" },
		-- 			y = { name = "File Tree" },
		-- 			h = { name = "Git" },
		-- 			d = { name = "Debug" },
		-- 			m = { name = "Marks" },
		-- 			j = { name = "Motions" },
		-- 		},
		-- 	}
		-- 	wk.register(mappings)
		-- end,
		dependencies = {
			{ "echasnovski/mini.icons" },
			{ "nvim-tree/nvim-web-devicons" },
		},
	},
}
