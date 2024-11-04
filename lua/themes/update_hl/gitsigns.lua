--- @param theme ThemeConfig
return function(theme)
	vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = theme.colors.green })
	vim.api.nvim_set_hl(0, "GitSignsChange", { fg = theme.colors.blue })
	vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = theme.colors.red })
	vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = theme.colors.turquoise })

	local gitsigns_module = require("plugins.git.gitsigns")
	local gitsigns_config = gitsigns_module.config
	if theme.git_gutter_style == "default" then
		gitsigns_config.signs = gitsigns_module.guttersigns_default
	elseif theme.git_gutter_style == "text" then
		gitsigns_config.signs = gitsigns_module.guttersigns_text
	elseif theme.git_gutter_style == "bar" then
		gitsigns_config.signs = gitsigns_module.guttersigns_bar
	else
		gitsigns_config.signs = gitsigns_module.guttersigns_default
	end
	require("gitsigns").setup(gitsigns_config)
end
