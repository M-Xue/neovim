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
	-- * ========================================
	-- * COLOUR SCHEMES
	-- * ========================================
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- * ========================================
	-- * CORE PLUGINS
	-- * ========================================
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"https://git.sr.ht/~havi/telescope-toggleterm.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"akinsho/toggleterm.nvim",
			"nvim-lua/popup.nvim",
		},
		event = "TermOpen",
	},

	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "ahmedkhalf/project.nvim" },
	{ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp", -- Need this for the regex to work: https://github.com/L3MON4D3/LuaSnip/discussions/538
				dependencies = "rafamadriz/friendly-snippets",
			},
			{
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"saadparwaiz1/cmp_luasnip",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},

	-- * ========================================
	-- * TOOLING
	-- * ========================================
	{ "williamboman/mason.nvim", dependencies = "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "mhartington/formatter.nvim" },
	-- {'mfussenegger/nvim-lint'},

	-- * ========================================
	-- * GIT
	-- * ========================================

	{ "lewis6991/gitsigns.nvim" },
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- { "tpope/vim-fugitive" }, -- This is a vim plugin, not Lua. Not customized.

	-- * ========================================
	-- * EXTRA LSP PLUGINS
	-- * ========================================
	{ "j-hui/fidget.nvim", tag = "legacy", event = "LspAttach" },
	{ "kosayoda/nvim-lightbulb" },
	{ "aznhe21/actions-preview.nvim" },

	-- * ========================================
	-- * UI PLUGINS
	-- * ========================================
	{ "RRethy/vim-illuminate" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "nanozuki/tabby.nvim" },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"sudormrfbin/cheatsheet.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
	},

	-- * ========================================
	-- * EDITING PLUGINS
	-- * ========================================
	{ "nacro90/numb.nvim" },
	{ "windwp/nvim-ts-autotag" },
	{ "windwp/nvim-autopairs", event = "InsertEnter" },
	{ "m4xshen/autoclose.nvim" },
	{
		"utilyre/sentiment.nvim",
		version = "*",
		event = "VeryLazy", -- keep for lazy loading
		init = function()
			-- `matchparen.vim` needs to be disabled manually in case of lazy loading
			vim.g.loaded_matchparen = 1
		end,
	},
	{ "numToStr/Comment.nvim", lazy = false },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
}

require("lazy").setup(plugins)

require("plugins.core.telescope")
require("plugins.core.lualine")
require("plugins.core.cmp")
require("plugins.core.treesitter")
require("plugins.core.git.gitsigns")
-- require('plugins.core.git.lazygit')
require("plugins.core.toggleterm")
require("plugins.core.alpha")
require("plugins.core.project")
require("plugins.core.tooling")

require("plugins.misc.lsp.fidget")
require("plugins.misc.lsp.nvim-lightbulb")
require("plugins.misc.lsp.actions-preview")

-- require("plugins.misc.ui.illuminate")
require("plugins.misc.ui.indent-blankline")
require("plugins.misc.ui.tabby")
require("plugins.misc.ui.which-key")
require("plugins.misc.ui.nvim-tree")
require("plugins.misc.ui.cheatsheet")
require("plugins.misc.ui.barbecue")

require("plugins.misc.editing.numb")
-- require("plugins.misc.editing.nvim-ts-autotag")
require("plugins.misc.editing.nvim-autopairs")
require("plugins.misc.editing.autoclose")
require("plugins.misc.editing.comment")
require("plugins.misc.editing.sentiment")
require("plugins.misc.editing.nvim-ts-context-commentstring")
require("plugins.misc.editing.todo-comments")
