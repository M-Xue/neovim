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
			ensure_installed = lsp_servers,
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
		},
	},
	{
		"j-hui/fidget.nvim",
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
		"SmiteshP/nvim-navic",
		opts = {},
		config = function()
			vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
			return {
				enabled = true,
				separator = " ",
				highlight = true,
				depth_limit = 5,
				lazy_update_context = true,
			}
		end,
	},
}
