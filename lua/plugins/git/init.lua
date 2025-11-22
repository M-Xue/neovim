return {
	require("plugins.git.gitsigns").plugin,
	require("plugins.git.lazygit"),
	require("plugins.git.diffview"),
	{
		"aaronhallaert/advanced-git-search.nvim",
		event = "VeryLazy",
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"tpope/vim-rhubarb",
		event = "VeryLazy",
	},
}
