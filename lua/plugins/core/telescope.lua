require("telescope").setup({
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
		},
	},
	defaults = {
		prompt_prefix = "  ",
		selection_caret = "   ",
		entry_prefix = "   ",
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		color_devicons = true,
	},
	extensions = {
		file_browser = {
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
		},
	},
})

require("telescope").load_extension("file_browser")
require("telescope").load_extension("toggleterm")
require("telescope").load_extension("projects")
