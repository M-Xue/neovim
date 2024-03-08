return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local lsp_servers = {
				"tsserver",
				"html",
				"emmet_language_server",
				"cssls",
				"cssmodules_ls",
				"tailwindcss",
				"jsonls",
				"gopls",
				"rust_analyzer",
				"lua_ls",
				"marksman",
			}

			require("mason-lspconfig").setup({
				ensure_installed = lsp_servers,
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lsp.util").setup()
			require("plugins.lsp.lspconfig")
		end,
	},

	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			text = {
				spinner = "dots",
			},
		},
	},
	{
		"kosayoda/nvim-lightbulb",
		event = "LspAttach",
		opts = {
			autocmd = { enabled = true },
		},
	},
	{
		"weilbith/nvim-code-action-menu",
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/neodev.nvim",
		event = "LspAttach",
		opts = {},
	},
	{
		"simrat39/symbols-outline.nvim",
		event = "LspAttach",
		opts = {},
	},
}
