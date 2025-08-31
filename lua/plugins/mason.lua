return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				border = "none",
				icons = {
					package_installed = "◍",
					package_pending = "◍",
					package_uninstalled = "◍",
				},
			},
			log_level = vim.log.levels.INFO,
			max_concurrent_installers = 4,
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = {
					"marksman",
					"mdx_analyzer",

					"html",
					"emmet_language_server",
					"cssls",
					"cssmodules_ls",
					"tailwindcss",
					"jsonls",
					"astro",
					"svelte",
					"ts_ls",

					"gopls",
					"lua_ls",
					"vimls",
				},
			})
		end,
	},
	{
		"zapling/mason-conform.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"stevearc/conform.nvim",
		},
		opts = {
			ensure_installed = {
				"prettierd",
				"prettier",
				"stylua",
				"goimports-reviser",
				"golines",
				"gofumpt",
				"markdownlint-cli2",
			},
			automatic_installation = true,
		},
	},
	{
		"rshkarin/mason-nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
		opts = {
			ensure_installed = {
				"eslint_d",
				"stylelint",
				-- "golangci-lint", -- These two are bugged for some reason
				-- "markdownlint-cli2",
				"cspell",
			},
			automatic_installation = true,
		},
	},
}
