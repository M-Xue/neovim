return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

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
	{
		"SmiteshP/nvim-navic",
		event = "LspAttach",
		config = function()
			vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
			-- set_navic_highlights()
			require("nvim-navic").setup({
				enabled = true,
				separator = " > ",
				highlight = true,
				depth_limit = 5,
				depth_limit_indicator = "..",
				lazy_update_context = true,
				icons = require("icons.lspkind").icons,
				format_text = function(text)
					return " " .. text
				end,
			})
		end,
	},
}
