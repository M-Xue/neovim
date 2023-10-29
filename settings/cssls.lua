local nvim_lsp = require("lspconfig")

local config = {
	root_dir = nvim_lsp.util.root_pattern("package.json", ".git"),
}

return config
