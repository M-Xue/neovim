return {
	{
		"catppuccin/nvim",
		priority = 1000,
		lazy = false,
		config = function()
			local opts = require("plugins.colorscheme.catppuccin")
			require("catppuccin").setup(opts)
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			local opts = require("plugins.colorscheme.gruvbox")
			require("gruvbox").setup(opts)
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			local opts = require("plugins.colorscheme.kanagawa")
			require("kanagawa").setup(opts)
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local opts = require("plugins.colorscheme.tokyonight")
			require("tokyonight").setup(opts)
		end,
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local opts = require("plugins.colorscheme.onedark")
			require("onedark").setup(opts)
		end,
	},
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			local opts = require("plugins.colorscheme.rose-pine")
			require("rose-pine").setup(opts)
		end,
	},
}
