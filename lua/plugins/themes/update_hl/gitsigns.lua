--- @param theme ThemeConfig
return function(theme)
	vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = theme.colors.green })
	vim.api.nvim_set_hl(0, "GitSignsChange", { fg = theme.colors.blue })
	vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = theme.colors.red })
	vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = theme.colors.turquoise })
end
