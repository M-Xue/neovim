local colors = {}
local ok, catppuccin = pcall(require, "catppuccin.palettes")
if ok then
	local macchiato_palette = catppuccin.get_palette("macchiato")
	-- https://catppuccin.com/palette

	--- @type ColorConfig
	colors = {
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
		white = "#eff1f5",
	}
end

--- @type ThemeConfig
local theme_config = {
	colorscheme_name = "catppuccin-macchiato",
	colors = colors,

	cmp_window_color = colors.bg,
	cmp_border_color = colors.bg_lighter,
	cmp_selected_color = colors.grey_darker,

	telescope_selected_color = colors.bg_lighter,
	telescope_border_color = colors.bg_darker,
	telescope_window_color = colors.bg_darker,
	telescope_header_background_color = true,

	float_window_color = colors.bg,
	float_border_color = colors.grey_lighter,
	float_border_radius = "rounded",

	font_color = colors.white,
	contrast_font_color = colors.black,

	window_separator_color = colors.bg_darker,

	background_color = colors.bg,

	diagnostics_icon_style = "filled",
	git_gutter_style = "default",
	lualine_git_diff_style = "icon",
	lualine_separator_style = "sharp",
	nvimtree_modified_glyph = "icon",
}

return theme_config
