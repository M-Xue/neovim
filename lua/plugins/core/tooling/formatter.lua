local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		astro = { "prettierd" },
		html = { "prettierd" },
		css = { "prettierd" },
		go = { "goimports-reviser", "golines", "gofumpt" },
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
		PRETTIERD_DEFAULT_CONFIG = "/Users//.config/nvim/lua/plugins/core/tooling/.prettierrc",
	},
}

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- 	callback = function(_)
-- 		conform.format()
-- 	end,
-- })
