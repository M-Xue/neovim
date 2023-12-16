require("zen-mode").setup({
	options = {
		signcolumn = "yes", -- disable signcolumn
		number = true,
		relativenumber = true,
		list = true,
	},
	plugins = {
		options = {
			laststatus = 3,
		},
		gitsigns = { enabled = false },
	},
})
