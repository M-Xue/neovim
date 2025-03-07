return {
	require("plugins.git.gitsigns").plugin,
	require("plugins.git.lazygit"),
	require("plugins.git.diffview"),
	require("plugins.git.advanced-git-search"),
	require("plugins.git.octovim"),

	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
}
