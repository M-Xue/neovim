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
	require("plugins.core.mason"),
	require("plugins.core.telescope"),

	require("plugins.lsp"),
	require("plugins.linter").plugins,
	require("plugins.formatter"),
	require("plugins.debugger"),
	require("plugins.git"),

	require("plugins.colorscheme"),
	require("plugins.core.cmp"),
	require("plugins.core.treesitter"),

	require("plugins.core.toggleterm"),
	require("plugins.core.lualine"),
	require("plugins.core.nvim-tree"),
	require("plugins.core.trouble"),
	require("plugins.core.misc"),

	require("plugins.lang.go"),

	require("plugins.motion"),
	require("plugins.ui"),
	require("plugins.editing"),
}

require("lazy").setup(plugins)
