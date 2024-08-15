return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "LspAttach",
		opts = {
			position = "right",
			padding = true,
		},
	},
}
