return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = function()
			-- For documentation, use the following command -> :help vim.diagnostic
			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "",
					},
				},

				update_in_insert = false,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					source = true,
					header = "",
					prefix = "",
				},
			})

			require("plugins.lsp.lspconfig")
		end,
	},
	require("plugins.lsp.plugins"),
}
