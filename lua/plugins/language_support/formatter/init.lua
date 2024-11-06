local formatters = {
	"prettierd",
	"prettier",
	"stylua",
	"goimports-reviser",
	"golines",
	"gofumpt",
	"markdownlint-cli2",
}

return {
	{
		"zapling/mason-conform.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"stevearc/conform.nvim",
		},
		opts = {
			ensure_installed = formatters,
			automatic_installation = true,
		},
	},
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
					html = { "prettierd" },
					css = { "prettierd" },

					astro = { "prettier" },
					svelte = { "prettier" },

					lua = { "stylua" },
					go = { "goimports-reviser", "golines", "gofumpt" },
					markdown = { "markdownlint" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
				log_level = vim.log.levels.ERROR,
				notify_on_error = true,
				formatters = {
					prettierd = {
						-- https://github.com/stevearc/conform.nvim/blob/0e61fc88f725b4411e63b43470a397c6102534c7/lua/conform/formatters/prettierd.lua
						-- https://github.com/stevearc/conform.nvim/issues/268
						env = {
							PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
						},
					},
				},
			})
		end,
	},
}
