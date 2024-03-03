local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	astro = { "eslint_d" },
	go = { "golangcilint" },
	markdown = { "vale" },
	lua = {},
}

IsCspellOn = true

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
