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
				"lua_ls",
				"marksman",
				"mdx_analyzer",
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
		"hedyhli/outline.nvim",
		event = "LspAttach",
		opts = {
			position = "right",
			width = 35,
			relative_width = false,
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "LspAttach",
		opts = {
			position = "right",
			padding = true,
			width = 35,
		},
	},

	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {},
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
		event = "LspAttach",
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "LspAttach",
		opts = {},
	},
}
