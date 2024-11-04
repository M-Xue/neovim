local colors = {}
local ok, vscode_colors_module = pcall(require, "vscode.colors")
if ok then
	local vscode_colors = vscode_colors_module.get_colors()
	--- @type ColorConfig
	colors = {
		red = vscode_colors.vscLightRed,
		green = vscode_colors.vscLightGreen,
		blue = vscode_colors.vscLightBlue,
		yellow = vscode_colors.vscYellow,
		purple = vscode_colors.vscLightBlue,
		orange = vscode_colors.vscOrange,
		pink = vscode_colors.vscPink,
		turquoise = vscode_colors.vscLightGreen,

		grey_lighter = vscode_colors.vscDimHighlight,
		grey = vscode_colors.vscGray,
		grey_darker = vscode_colors.vscGray,

		bg_lighter = vscode_colors.vscBack,
		bg = vscode_colors.vscBack,
		bg_darker = vscode_colors.vscBack,

		black = vscode_colors.vscBack,
		white = vscode_colors.vscPopupFront,
	}
end

--- @type ThemeConfig
local theme_config = {
	colorscheme_name = "vscode-dark",
	colors = colors,

	cmp_window_color = colors.bg,
	cmp_border_color = colors.grey,
	cmp_selected_color = colors.grey_lighter,

	telescope_selected_color = colors.grey_lighter,
	telescope_border_color = colors.grey,
	telescope_window_color = colors.bg,
	telescope_header_background_color = false,

	float_window_color = colors.bg,
	float_border_color = colors.grey,
	float_border_radius = "rounded",

	window_separator_color = colors.grey_lighter,

	background_color = colors.bg,

	diagnostics_icon_style = "filled",
	git_gutter_style = "default",
	lualine_git_diff_style = "icon",
	lualine_separator_style = "flat",
	nvimtree_modified_glyph = "icon",
}

return theme_config
