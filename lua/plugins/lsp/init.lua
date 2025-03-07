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

			-- For documentation, use the following command -> :help vim.diagnostic
			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "",
					},
				},

				update_in_insert = true,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = true,
					header = "",
					prefix = "",
				},
			})

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
