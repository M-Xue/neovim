local nvim_lsp = require("lspconfig")

local config_opts = {
	-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
	settings = {
		gopls = {
			usePlaceholders = true,
			analyses = {
				unusedvariable = true,
				unusedparams = true,
			},
		},
	},
}

return config_opts
