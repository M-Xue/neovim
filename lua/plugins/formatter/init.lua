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
					lua = { "stylua" },

					javascript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
					html = { "prettierd" },
					css = { "prettierd" },

					astro = { "prettier" },
					svelte = { "prettier" },

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

			conform.formatters.prettierd = {
				env = {
					PRETTIERD_DEFAULT_CONFIG = "/Users/maxxue/.config/nvim/lua/plugins/formatter/.prettierrc",
				},
			}
			conform.formatters.prettier = {
				env = {
					PRETTIER_DEFAULT_CONFIG = "/Users/maxxue/.config/nvim/lua/plugins/formatter/.prettierrc",
				},
			}
		end,
	},
}
