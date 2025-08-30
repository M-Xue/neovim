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
	require("plugins.colorscheme"),
	require("plugins.mason"),
	require("plugins.treesitter"),
	require("plugins.lsp"),

	require("plugins.conform"),
	require("plugins.nvim-lint").plugins,

	require("plugins.autocomplete"),

	require("plugins.nvim-tree"),
	require("plugins.trouble"),
	require("plugins.harpoon"),
	require("plugins.numb"),

	require("plugins.telescope"),
	require("plugins.git"),

	require("plugins.alpha"),
	require("plugins.lualine"),
	require("plugins.tabby"),
	require("plugins.icons"),
	require("plugins.indent-blankline"),

	require("plugins.textobjects"),
	require("plugins.parentheses"),
	require("plugins.comments"),
	require("plugins.whichkey"),
	require("plugins.cheatsheet"),

	require("plugins.toggleterm"),

	{ "RRethy/vim-illuminate" },
	{ "unblevable/quick-scope" }, -- Unqiue character highlight
}

require("lazy").setup(plugins)
