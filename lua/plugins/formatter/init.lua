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
			})
		end,
	},
}
