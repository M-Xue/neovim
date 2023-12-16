require("zen-mode").setup({
	options = {
		signcolumn = "yes", -- disable signcolumn
		number = true,
		relativenumber = true,
	},
	plugins = {
		options = {
			-- laststatus = 3,
		},
		gitsigns = { enabled = false },
	},
})

-- local nvim_tree_config = require("plugins.core.nvim-tree")
-- callback where you can add custom code when the Zen window opens
-- on_open = function()
-- 	require("nvim-tree").setup(vim.tbl_deep_extend("force", {
-- 		view = {
-- 			width = 35,
-- 			float = {
-- 				enable = true,
-- 			},
-- 		},
-- 	}, nvim_tree_config))
-- end,
-- -- callback where you can add custom code when the Zen window closes
-- on_close = function()
-- 	require("nvim-tree").setup(vim.tbl_deep_extend("force", {
-- 		view = {
-- 			width = 35,
-- 			float = {
-- 				enable = false,
-- 			},
-- 		},
-- 	}, nvim_tree_config))
-- end,
--
--
-- asdf
-- asdfasdfasd
-- asdf
--
--
--
--
--
