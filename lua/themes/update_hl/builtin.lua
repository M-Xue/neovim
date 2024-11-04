--- @param theme ThemeConfig
return function(theme)
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = theme.float_window_color })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = theme.float_window_color, fg = theme.float_border_color })

	vim.api.nvim_set_hl(0, "WinBar", { fg = theme.background_color })
	vim.api.nvim_set_hl(0, "WinBarNC", { fg = theme.background_color })

	vim.api.nvim_set_hl(0, "SignColumn", { bg = theme.background_color })
	-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = theme.background_color })
	vim.api.nvim_set_hl(0, "WinSeparator", { fg = theme.window_separator_color })
end
