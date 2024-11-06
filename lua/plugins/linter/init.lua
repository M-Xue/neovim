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

local util = require("config_util")
M.linters_with_spell_check = util.deep_copy(M.linters_by_ft)
for key, value in pairs(M.linters_with_spell_check) do
	table.insert(value, "cspell")
end

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
					lint.try_lint()
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
		print("Spell check on")
	else
		lint.linters_by_ft = M.linters_by_ft
		local ns = lint.get_namespace("cspell")
		vim.diagnostic.reset(ns)
		lint.try_lint()
		is_spell_check_enabled = false
		print("Spell check off")
	end
end

return M
