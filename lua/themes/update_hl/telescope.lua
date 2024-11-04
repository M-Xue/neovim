--- @param theme ThemeConfig
return function(theme)
	vim.api.nvim_set_hl(
		0,
		"TelescopePromptBorder",
		{ fg = theme.telescope_border_color, bg = theme.telescope_window_color }
	)
	vim.api.nvim_set_hl(
		0,
		"TelescopeResultsBorder",
		{ fg = theme.telescope_border_color, bg = theme.telescope_window_color }
	)
	vim.api.nvim_set_hl(
		0,
		"TelescopePreviewBorder",
		{ fg = theme.telescope_border_color, bg = theme.telescope_window_color }
	)

	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = theme.telescope_window_color })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = theme.telescope_window_color })

	if theme.telescope_header_background_color then
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = theme.contrast_font_color, bg = theme.colors.green })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = theme.contrast_font_color, bg = theme.colors.blue })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = theme.contrast_font_color, bg = theme.colors.red })
	else
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = theme.font_color, bg = theme.background_color })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = theme.font_color, bg = theme.background_color })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = theme.font_color, bg = theme.background_color })
	end

	vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = theme.telescope_selected_color })
end
