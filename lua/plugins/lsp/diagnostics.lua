local M = {}

-- Source: https://github.com/LunarVim/Neovim-from-scratch/blob/06-LSP/lua/user/lsp/handlers.lua
-- Set up diagnostics
local diagnostics_signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

local diagnostics_config = {
	virtual_text = false,
	signs = {
		active = diagnostics_signs,
	},
	update_in_insert = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

local toggle_diagnostics_virtual_text = function()
	if diagnostics_config.virtual_text then
		diagnostics_config.virtual_text = false
	else
		diagnostics_config.virtual_text = true
	end

	vim.diagnostic.config(diagnostics_config)
end

-- For documentation, use the following command -> :help vim.diagnostic
M.setup_diagnostics = function()
	for _, sign in ipairs(diagnostics_signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.diagnostic.config(diagnostics_config)
end

M.init_diagnostics_keymaps = function(bufnr)
	vim.keymap.set(
		"n",
		"<leader>ej",
		vim.diagnostic.goto_next,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Go to next diagnostic" }
	)
	vim.keymap.set(
		"n",
		"<leader>ek",
		vim.diagnostic.goto_prev,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Go to previous diagnostic" }
	)
	vim.keymap.set(
		"n",
		"<leader>el",
		require("telescope.builtin").diagnostics,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Find diagnostics" }
	)
	vim.keymap.set(
		"n",
		"<leader>eL",
		"<cmd>Trouble workspace_diagnostics<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "List diagnostics" }
	)
	vim.keymap.set(
		"n",
		"<leader>ei",
		vim.diagnostic.open_float,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Get diagnostic info" }
	)
	vim.keymap.set(
		"n",
		"<leader>ev",
		toggle_diagnostics_virtual_text,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Toggle diagnostics virtual text" }
	)
	-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, bufopts)
end

return M
