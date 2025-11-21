return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			explorer = { enabled = true },
			picker = {
				enabled = true,
				layouts = {
					float = {
						layout = {
							backdrop = false,
							width = 0.5,
							min_width = 80,
							height = 0.8,
							min_height = 30,
							box = "vertical",
							border = true,
							title = "{title} {live} {flags}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
						},
					},
				},
				sources = {
					explorer = {
						focus = "input",
						auto_close = true,
					},
				},
			},
		},
	},
}
