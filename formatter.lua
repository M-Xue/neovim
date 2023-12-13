local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	-- https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettierd,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettierd,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettierd,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettierd,
		},
		html = {
			require("formatter.filetypes.html").prettierd,
		},
		css = {
			require("formatter.filetypes.css").prettierd,
		},
		go = {
			require("formatter.filetypes.go").gofumpt,
			require("formatter.filetypes.go").golines,
			require("formatter.filetypes.go").goimports,
		},
		-- svelte = {
		-- -- 	NOTE: svelte uses prettier not prettierd
		-- 	require("formatter.filetypes.svelte").prettier,
		-- },
		-- rust = {
		-- 	require("formatter.filetypes.rust").rustfmt,
		-- },
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	command = "FormatWriteLock",
})
