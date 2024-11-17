return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.language_support.lsp.handlers")
			require("plugins.language_support.lsp.diagnostics").setup_diagnostics()
			require("plugins.language_support.lsp.lspconfig")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
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
			},
			automatic_installation = true,
		},
	},
	{
		"hedyhli/outline.nvim",
		event = "LspAttach",
		opts = {
			position = "right",
			width = 35,
			relative_width = false,
			symbols = {
				icon_fetcher = function(kind, bufnr)
					return require("icons.lspkind").icons[kind]
				end,
			},
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
	require("plugins.language_support.lsp.winbar"),
}
