local M = {}

-- Source: https://github.com/LunarVim/Neovim-from-scratch/blob/06-LSP/lua/user/lsp/handlers.lua
-- Set up diagnostics
-- For documentationm, use the following command -> :help vim.diagnostic
local setup_diagnostics = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" }, -- 
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		-- virtual_text = {
		-- 	prefix = " ",
		-- },
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
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

	vim.diagnostic.config(config)
end

-- Set up handlers
local setup_handlers = function()
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

-- Keymap sources
local function lsp_diagnostic_keymaps(bufnr)
	-- For documentationm, use the following command -> :help lsp
	-- Basic Actions
	vim.keymap.set(
		"n",
		"<leader>r",
		vim.lsp.buf.rename,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Rename" }
	)
	-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set(
		"n",
		"K",
		vim.lsp.buf.hover,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Documentation" }
	) -- Use "K" again to go into the float window to scroll and interact. Press <C-o> to exit the float.

	-- Definitions and References
	vim.keymap.set(
		"n",
		"<leader>gd",
		vim.lsp.buf.definition,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Go to definition" }
	)
	vim.keymap.set(
		"n",
		"<leader>gt",
		vim.lsp.buf.type_definition,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Go to type definition" }
	)
	vim.keymap.set(
		"n",
		"<leader>gD",
		vim.lsp.buf.declaration,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Go to declaration" }
	)
	-- For documentationm, use the following command -> :help telescope.builtin
	vim.keymap.set(
		"n",
		"<leader>gi",
		require("telescope.builtin").lsp_implementations,
		{ noremap = true, silent = true, buffer = bufnr, desc = "List implementations" }
	)
	vim.keymap.set(
		"n",
		"<leader>gr",
		require("telescope.builtin").lsp_references,
		{ noremap = true, silent = true, buffer = bufnr, desc = "List references" }
	)
	vim.keymap.set(
		"n",
		"<C-k>",
		vim.lsp.buf.signature_help,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Get signature" }
	)

	vim.keymap.set(
		"n",
		"<leader>ga",
		require("actions-preview").code_actions,
		{ noremap = true, silent = true, buffer = bufnr, desc = "List code actions" }
	)

	-- For documentationm, use the following command -> :help vim.diagnostic
	-- Diagnostics
	vim.keymap.set(
		"n",
		"<leader>dj",
		vim.diagnostic.goto_next,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Go to next diagnostic" }
	)
	vim.keymap.set(
		"n",
		"<leader>dk",
		vim.diagnostic.goto_prev,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Go to previous diagnostic" }
	)
	vim.keymap.set(
		"n",
		"<leader>dl",
		require("telescope.builtin").diagnostics,
		{ noremap = true, silent = true, buffer = bufnr, desc = "List diagnostics" }
	)
	vim.keymap.set(
		"n",
		"<leader>di",
		vim.diagnostic.open_float,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Get diagnostic info" }
	)
	-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, bufopts)
end
-- :help jump_list - jump list is for movements e.g. ctrl o
-- :help tag_list - tag stack is moving between defintions

M.setup = function()
	setup_diagnostics()
	setup_handlers()
end

local wk = require("which-key")
-- First argument is client
M.on_attach = function(client, bufnr)
	local opts = {
		buffer = bufnr,
	}
	local mappings = {
		["<leader>"] = {
			d = { name = "Diagnostics" },
			g = { name = "LSP" },
		},
	}
	wk.register(mappings, opts)

	lsp_diagnostic_keymaps(bufnr)
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
