local M = {}

local linters = {
	"eslint_d",
	"stylelint",
	"golangci-lint",
	"markdownlint-cli2",
	"cspell",
}

M.linters_by_ft = {
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	astro = { "eslint_d" },
	svelte = { "eslint_d" },
	css = { "stylelint" },
	go = { "golangcilint" },
	markdown = { "markdownlint" },
	lua = {},
	text = {},
}

M.linters_with_spell_check = {
	javascript = { "eslint_d", "cspell" },
	javascriptreact = { "eslint_d", "cspell" },
	typescript = { "eslint_d", "cspell" },
	typescriptreact = { "eslint_d", "cspell" },
	astro = { "eslint_d", "cspell" },
	svelte = { "eslint_d", "cspell" },
	css = { "stylelint", "cspell" },
	go = { "golangcilint", "cspell" },
	markdown = { "markdownlint", "cspell" },
	lua = { "cspell" },
	text = { "cspell" },
}

M.plugins = {
	{
		"rshkarin/mason-nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
		opts = {
			ensure_installed = linters,
			automatic_installation = true,
		},
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = M.linters_by_ft

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
		end,
	},
}

local is_spell_check_enabled = false
M.toggle_spell_check = function()
	local lint = require("lint")
	if is_spell_check_enabled == false then
		lint.linters_by_ft = M.linters_with_spell_check
		lint.try_lint()
		is_spell_check_enabled = true
	else
		lint.linters_by_ft = M.linters_by_ft
		local ns = lint.get_namespace("cspell")
		vim.diagnostic.reset(ns)
		lint.try_lint()
		is_spell_check_enabled = false
	end
end

return M
