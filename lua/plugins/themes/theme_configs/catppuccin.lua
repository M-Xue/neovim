local macchiato_palette = require("catppuccin.palettes").get_palette("macchiato")

--- @type ColorConfig
local colors = {
	red = macchiato_palette.red,
	green = macchiato_palette.green,
	blue = macchiato_palette.blue,
	yellow = macchiato_palette.yellow,
	purple = macchiato_palette.mauve,
	orange = macchiato_palette.peach,
	pink = macchiato_palette.pink,
	turquoise = macchiato_palette.teal,

	grey_lighter = macchiato_palette.overlay1,
	grey = macchiato_palette.overlay0,
	grey_darker = macchiato_palette.surface2,

	bg_lighter = macchiato_palette.surface1,
	bg = macchiato_palette.base,
	bg_darker = macchiato_palette.mantle,

	black = macchiato_palette.mantle,
}

--- @type ThemeConfig
local theme_config = {
	colorscheme_name = "catppuccin-macchiato",
	colors = colors,

	border_color = colors.grey_lighter,
	window_color = colors.bg,
	cmp_selected_color = colors.grey_darker,
	telescope_selected_color = colors.bg_lighter,
	telescope_border_color = colors.bg_darker,
	telescope_window_color = colors.bg_darker,

	border_radius = "rounded",
	cmp_format = "default",
	diagnostics_icon_style = "filled",
	git_gutter_style = "bar",
	lualine_git_diff_style = "icon",
	lualine_separator_style = "sharp",
	nvimtree_modified_glyph = "icon",
}

return theme_config
