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
		go = { "goimports", "golines", "gofumpt" },
	},
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
	log_level = vim.log.levels.ERROR,
})
