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
	require("plugins.treesitter"),
	require("plugins.language_support"),

	require("plugins.conform"),
	require("plugins.nvim-lint").plugins,

	require("plugins.cmp"),

	require("plugins.nvim-tree").plugin,
	require("plugins.trouble"),
	require("plugins.marks"),
	require("plugins.harpoon"),
	require("plugins.numb"),

	require("plugins.telescope"),
	require("plugins.spectre"),
	require("plugins.git"),

	require("plugins.alpha"),
	require("plugins.lualine").plugin,
	require("plugins.tabby"),
	require("plugins.icons"),
	-- require("plugins.barbecue"), -- Use nvim-navic instead
	require("plugins.indent-blankline"),

	require("plugins.textobjects"),
	require("plugins.parentheses"),
	require("plugins.comments"),
	require("plugins.zenmode"),
	require("plugins.whichkey"),
	require("plugins.cheatsheet"),

	require("plugins.toggleterm"),

	{ "RRethy/vim-illuminate" },
	{ "unblevable/quick-scope" }, -- Unqiue character highlight
}

require("lazy").setup(plugins)
