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
				"mdx_analyzer",
				"svelte",
				"astro",
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
			require("plugins.lsp.lsp").setup_lsp_handlers()
			require("plugins.lsp.diagnostics").setup_diagnostics()
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
}
