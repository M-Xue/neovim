local colors = {}
local ok, gruvbox = pcall(require, "gruvbox")
if ok then
	local gruvbox_palette = require("gruvbox").palette
	-- https://github.com/ellisonleao/gruvbox.nvim/blob/49d9c0b150ba70efcd831ec7b3cb8ee740067045/lua/gruvbox.lua#L73

	--- @type ColorConfig
	colors = {
		red = gruvbox_palette.bright_red,
		green = gruvbox_palette.bright_green,
		blue = gruvbox_palette.bright_blue,
		yellow = gruvbox_palette.bright_yellow,
		purple = gruvbox_palette.bright_purple,
		orange = gruvbox_palette.bright_orange,
		pink = "#ea6962",
		turquoise = gruvbox_palette.bright_aqua,

		grey_lighter = gruvbox_palette.light4,
		grey = gruvbox_palette.gray,
		grey_darker = gruvbox_palette.dark4,

		bg_lighter = gruvbox_palette.dark0_soft,
		bg = gruvbox_palette.dark0,
		bg_darker = gruvbox_palette.dark0_hard,

		black = gruvbox_palette.dark0_hard,
		white = gruvbox_palette.light0_hard,
	}
end

--- @type ThemeConfig
local style_config = {
	colorscheme_name = "gruvbox",
	colors = colors,

	cmp_window_color = colors.bg_darker,
	cmp_border_color = colors.bg_darker,
	cmp_selected_color = colors.grey,

	telescope_window_color = colors.bg_darker,
	telescope_border_color = colors.bg_darker,
	telescope_selected_color = colors.grey,
	telescope_header_background_color = true,

	float_window_color = colors.bg_darker,
	float_border_color = colors.bg_darker,
	float_border_radius = "none",

	font_color = colors.white,
	contrast_font_color = colors.black,

	window_separator_color = colors.grey,

	background_color = colors.bg,

	diagnostics_icon_style = "outline",
	git_gutter_style = "text",
	lualine_git_diff_style = "text",
	lualine_separator_style = "flat",
	nvimtree_modified_glyph = "text",
}

return style_config
