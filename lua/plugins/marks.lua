return {
	{
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({
				default_mappings = false,
				mappings = {
					toggle = "<leader>mm",
					delete_buf = "<leader>md",
					next = "<leader>mj",
					prev = "<leader>mk",
					preview = "<leader>mp",
				},
				force_write_shada = true,
			})
		end,
	},
}
