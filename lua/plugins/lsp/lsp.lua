local M = {}

M.setup_lsp_handlers = function()
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

-- Keymap sources
-- For documentation for lsp, use the following command -> :help lsp
-- For documentation telescope integration, use the following command -> :help telescope.builtin
M.init_lsp_keymaps = function(bufnr)
	vim.keymap.set(
		"n",
		"<leader>r",
		vim.lsp.buf.rename,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Rename" }
	)

	vim.keymap.set(
		"n",
		"K",
		vim.lsp.buf.hover,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Documentation" }
	)
	-- Use "K" again to go into the float window.

	vim.keymap.set(
		{ "n", "i" },
		"<c-k>",
		vim.lsp.buf.signature_help,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Get signature" }
	)
	vim.keymap.set(
		"n",
		"<leader>gl",
		vim.lsp.buf.declaration,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Go to declaration" }
	)
	vim.keymap.set(
		"n",
		"<leader>ga",
		vim.lsp.buf.code_action,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Get code actions" }
	)

	vim.keymap.set(
		"n",
		"<leader>gd",
		require("telescope.builtin").lsp_definitions,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Find definition" }
	)
	vim.keymap.set(
		"n",
		"<leader>gD",
		"<cmd>Trouble lsp_definitions<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Definitions list" }
	)

	vim.keymap.set(
		"n",
		"<leader>gt",
		require("telescope.builtin").lsp_type_definitions,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Find type definition" }
	)
	vim.keymap.set(
		"n",
		"<leader>gT",
		"<cmd>Trouble lsp_type_definitions<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Type definitions list" }
	)

	vim.keymap.set(
		"n",
		"<leader>gi",
		require("telescope.builtin").lsp_implementations,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Find implementation" }
	)
	vim.keymap.set(
		"n",
		"<leader>gI",
		"<cmd>Trouble lsp_implementations<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Implementations list" }
	)

	vim.keymap.set(
		"n",
		"<leader>gr",
		require("telescope.builtin").lsp_references,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Find reference" }
	)
	vim.keymap.set(
		"n",
		"<leader>gR",
		"<cmd>Trouble lsp_references<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "References list" }
	)

	vim.keymap.set(
		"n",
		"<leader>gc",
		require("telescope.builtin").lsp_incoming_calls,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Find incoming calls" }
	)
	vim.keymap.set(
		"n",
		"<leader>gC",
		"<cmd>Trouble lsp_incoming_calls<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Incoming calls list" }
	)

	vim.keymap.set(
		"n",
		"<leader>go",
		require("telescope.builtin").lsp_outgoing_calls,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Find outgoing calls" }
	)
	vim.keymap.set(
		"n",
		"<leader>gO",
		"<cmd>Trouble lsp_outgoing_calls<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Outgoing calls list" }
	)
end

return M
