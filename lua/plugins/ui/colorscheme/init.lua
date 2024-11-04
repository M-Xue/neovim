return {
	{
		"catppuccin/nvim",
		priority = 1000,
		lazy = false,
		config = function()
			local opts = require("plugins.ui.colorscheme.catppuccin")
			require("catppuccin").setup(opts)
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			local opts = require("plugins.ui.colorscheme.gruvbox")
			require("gruvbox").setup(opts)
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			local opts = require("plugins.ui.colorscheme.kanagawa-config")
			require("kanagawa").setup(opts)
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local opts = require("plugins.ui.colorscheme.tokyonight")
			require("tokyonight").setup(opts)
		end,
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local opts = require("plugins.ui.colorscheme.onedark")
			require("onedark").setup(opts)
		end,
	},
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			local opts = require("plugins.ui.colorscheme.rosepine")
			require("rose-pine").setup(opts)
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local opts = require("plugins.ui.colorscheme.vscode-config")
			require("vscode").setup(opts)
		end,
	},
}
