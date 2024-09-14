local tokyonight_colors = require("tokyonight.colors").setup()

--- @type ColorConfig
local colors = {
	red = tokyonight_colors.red1,
	green = tokyonight_colors.green,
	blue = tokyonight_colors.blue,
	yellow = tokyonight_colors.yellow,
	purple = tokyonight_colors.purple,
	orange = tokyonight_colors.orange,
	pink = tokyonight_colors.red,
	turquoise = tokyonight_colors.teal,
	grey = tokyonight_colors.border_highlight,
	dark = tokyonight_colors.bg_dark,
	bg = tokyonight_colors.bg,
}
--- @type ThemeConfig
local theme_config = {
	colorscheme_name = "tokyonight-moon",
	colors = colors,

	border_color = colors.grey,
	window_color = colors.bg,
	cmp_selected_color = colors.blue,
	telescope_border_color = colors.grey,
	telescope_window_color = colors.bg,

	border_radius = "rounded",
	cmp_format = "minimal",
	diagnostics_icon_style = "outline",
	git_gutter_style = "bar",
	lualine_git_diff_style = "icon",
	lualine_separator_style = "sharp",
	nvimtree_modified_glyph = "icon",
}

return theme_config
