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
	-- {
	-- 	"nvim-telescope/telescope-fzf-native.nvim",
	-- 	build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	-- },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
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
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- * ========================================
	-- * TOOLING
	-- * ========================================
	{ "williamboman/mason.nvim" },
	{ "neovim/nvim-lspconfig", dependencies = { "williamboman/mason-lspconfig.nvim" } }, -- LSP
	{ "mfussenegger/nvim-lint" }, -- Linting
	{ "stevearc/conform.nvim" }, -- Formatting

	-- Debugging
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "nvim-telescope/telescope-dap.nvim" },

	-- * ========================================
	-- * LANGUAGES
	-- * ========================================
	-- Go
	{ "leoluz/nvim-dap-go" },
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		-- config = function()
		-- 	require("go").setup()
		-- end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},

	-- Rust
	{ "mrcjkb/rustaceanvim" },
	{ "Saecki/crates.nvim" },

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
	{ "tpope/vim-fugitive" }, -- This is a vim plugin, not Lua. Not customized.

	-- * ========================================
	-- * EXTRA LSP
	-- * ========================================
	{ "j-hui/fidget.nvim", tag = "legacy", event = "LspAttach" },
	{ "kosayoda/nvim-lightbulb" },
	{ "weilbith/nvim-code-action-menu" },
	{ "simrat39/symbols-outline.nvim" },
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
	},
	{ "folke/neodev.nvim", opts = {} },

	-- * ========================================
	-- * MOTIONS
	-- * ========================================
	{ "folke/flash.nvim" },
	{ "ThePrimeagen/harpoon" },
	{ "abecodes/tabout.nvim" },
	{ "unblevable/quick-scope" },

	-- * ========================================
	-- * UI
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
	{ "chentoast/marks.nvim" },
	{ "shortcuts/no-neck-pain.nvim" },

	-- * ========================================
	-- * EDITING
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
	{ "mbbill/undotree" },
}

require("lazy").setup(plugins)

-- CORE PLUGINS
require("plugins.core.git.gitsigns")
require("plugins.core.tooling")

require("plugins.core.alpha")
require("plugins.core.cmp")
require("plugins.core.lualine")
require("plugins.core.nvim-tree")
require("plugins.core.project")
require("plugins.core.telescope")
require("plugins.core.toggleterm")
require("plugins.core.treesitter")

-- LANGUAGE PLUGINS
require("plugins.languages")

-- MISCELLANEOUS PLUGINS
-- editing
require("plugins.misc.editing.autoclose")
require("plugins.misc.editing.comment")
require("plugins.misc.editing.numb")
require("plugins.misc.editing.nvim-autopairs")
require("plugins.misc.editing.nvim-ts-autotag")
require("plugins.misc.editing.nvim-ts-context-commentstring")
require("plugins.misc.editing.sentiment")
require("plugins.misc.editing.todo-comments")

-- lsp
require("plugins.misc.lsp.fidget")
require("plugins.misc.lsp.lsp-signature")
require("plugins.misc.lsp.nvim-lightbulb")
require("plugins.misc.lsp.symbols-outline")
require("plugins.misc.lsp.neodev")

-- motions
require("plugins.misc.motions.flash")
require("plugins.misc.motions.harpoon")
require("plugins.misc.motions.tabout")

-- ui
require("plugins.misc.ui.barbecue")
require("plugins.misc.ui.cheatsheet")
require("plugins.misc.ui.indent-blankline")
require("plugins.misc.ui.marks")
require("plugins.misc.ui.no-neck-pain")
require("plugins.misc.ui.tabby")
require("plugins.misc.ui.which-key")
