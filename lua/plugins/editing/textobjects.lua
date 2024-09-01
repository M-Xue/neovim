return {
	require("plugins.editing.treesitter"),
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
