local wk = require("which-key")
local function rust_keymaps(bufnr)
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<leader>lT<cr>",
	-- 	dapgo.debug_test,
	-- 	{ noremap = true, silent = true, buffer = bufnr, desc = "Debug current test" }
	-- )

	local opts = {
		buffer = bufnr,
	}
	local mappings = {
		["<leader>"] = {
			l = { name = "Rust" },
		},
	}
	wk.register(mappings, opts)
end
