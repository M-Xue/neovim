--- @type ColorConfig
local colors = {
	red = "#ea6962",
	green = "#a9b665",
	blue = "#7daea3",
	yellow = "#d8a657",
	purple = "#d3869b",
	orange = "#e78a4e",
	pink = "#ea6962",
	turquoise = "#89b482",

	grey = "#a89984",
	bg = "#282828",
	bg_darker = "#1d2021",

	black = "#1d2021",
}

--- @type ThemeConfig
local theme_config = {
	colorscheme_name = "gruvbox",
	colors = colors,

	border_color = colors.bg_darker,
	window_color = colors.bg_darker,
	cmp_selected_color = "None",
	telescope_window_color = colors.bg_darker,
	telescope_border_color = colors.bg_darker,

	border_radius = "none",
	cmp_format = "default",
	diagnostics_icon_style = "outline",
	git_gutter_style = "text",
	lualine_git_diff_style = "text",
	lualine_separator_style = "flat",
	nvimtree_modified_glyph = "text",
}

return theme_config
