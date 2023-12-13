local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "eslint_d", "cspell" },
	javascriptreact = { "eslint_d", "cspell" },
	typescript = { "eslint_d", "cspell" },
	typescriptreact = { "eslint_d", "cspell" },
	go = { "golangcilint", "cspell" },
	markdown = { "vale" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
	callback = function(opts)
		if vim.bo[opts.buf].filetype == "markdown" then
			-- TODO write an if check to see if the vale config file is found in this root dir. Only run this if it exists.
			lint.try_lint()
		else
			lint.try_lint()
		end
	end,
})
