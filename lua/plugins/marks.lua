return {
	{
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({
				default_mappings = false,
				mappings = {
					toggle = "<leader>mm",
					delete_buf = "<leader>md",
				},
				force_write_shada = true,
			})
		end,
	},
}
