return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lsp.handlers")
			require("plugins.lsp.diagnostics").setup_diagnostics()
			require("plugins.lsp.lspconfig")
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
				unpack(require("plugins.lang.webdev.lsp_name")),
				unpack(require("plugins.lang.markdown.lsp_name")),
				require("plugins.lang.go.lsp_name"),
				require("plugins.lang.lua.lsp_name"),
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
					return require("icons.symbols")[kind]
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
	require("plugins.lsp.winbar"),
}
