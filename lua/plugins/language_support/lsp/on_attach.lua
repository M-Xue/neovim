local wk = require("which-key")
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
	wk.add({
		{ "<leader>e", group = "Diagnostics" },
		{ "<leader>g", group = "LSP" },
	})
	require("plugins.language_support.lsp.keymaps").init_lsp_keymaps(bufnr)
	require("plugins.language_support.lsp.diagnostics").init_diagnostics_keymaps(bufnr)

	if client.supports_method("textDocument/documentSymbol") then
		navic.attach(client, bufnr)
	end
end

return on_attach
