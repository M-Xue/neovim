local wk = require("which-key")
local dapgo = require("dap-go")
local function go_keymaps(bufnr)
	vim.keymap.set(
		"n",
		"<leader>lj",
		":GoAddTag<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Add struct tags" }
	)
	vim.keymap.set(
		"n",
		"<leader>lJ",
		":GoRmTag<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Remove struct tags" }
	)
	vim.keymap.set(
		"n",
		"<leader>lf",
		":GoFillStruct<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Fill struct" }
	)
	vim.keymap.set(
		"n",
		"<leader>le",
		":GoIfErr<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "If Err Snippet" }
	)
	vim.keymap.set(
		"n",
		"<leader>ls",
		":GoPkgSymbol<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Package Symbols" }
	)

	vim.keymap.set(
		"n",
		"<leader>lt",
		":GoTestFunc<cr>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Run current test" }
	)
	vim.keymap.set(
		"n",
		"<leader>lT<cr>",
		dapgo.debug_test,
		{ noremap = true, silent = true, buffer = bufnr, desc = "Debug current test" }
	)

	local opts = {
		buffer = bufnr,
	}
	local mappings = {
		["<leader>"] = {
			l = { name = "Go" },
		},
	}
	wk.register(mappings, opts)
end

return go_keymaps

