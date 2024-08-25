return {
	require("plugins.editing.treesitter"),
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({})
		end,
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		opts = { useDefaultKeymaps = true },
	},
	{
		"windwp/nvim-ts-autotag", -- For automatically closing HTML tags
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = false,
			},
		},
	},
}
