return {
	{
		"sainnhe/everforest",
		priority = 1000,
		lazy = false,
		config = function()
			require("everforest").setup({})
		end,
	},
}
