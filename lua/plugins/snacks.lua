return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			picker = {
				actions = {
					confirm = function(picker)
						local item = picker:current()
						if item then
							picker:close()
							vim.cmd("edit " .. item.file)
						end
					end,
				},
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
				formatters = {
					selected = {
						show_always = true,
						unselected = false,
					},
				},
				icons = {
					ui = {
						selected = " ",
					},
				},
				sources = {
					lines = { layout = "float", focus = "input" },
					registers = { layout = "float", focus = "input" },
					explorer = {
						focus = "list",
						auto_close = true,
						layout = "float",
					},
					marks = {
						global = false,
					},
				},
			},
		},
	},
}
