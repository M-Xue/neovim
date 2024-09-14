--- @param theme ThemeConfig
return function(theme)
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = theme.window_color })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = theme.window_color, fg = theme.border_color })
end
