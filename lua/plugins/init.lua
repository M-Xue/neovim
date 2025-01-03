local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	require("plugins.ui.colorscheme"),
	require("plugins.treesitter"),
	require("plugins.language_support"),
	require("plugins.linter").plugins,
	require("plugins.formatter"),
	require("plugins.completion"),
	require("plugins.navigation"),
	require("plugins.search"),
	require("plugins.git"),
	require("plugins.ui"),
	require("plugins.editing"),
	require("plugins.terminal"),
}

require("lazy").setup(plugins)
