--- @param theme ThemeConfig
return function(theme)
	local lspkind_colors = require("icons.lspkind").colors
	for key, value in pairs(lspkind_colors) do
		local hl_group = "NavicIcons" .. key
		vim.api.nvim_set_hl(0, hl_group, { fg = theme.colors[value] })
	end
	vim.api.nvim_set_hl(0, "NavicText", { fg = theme.colors.white, bg = theme.colors.bg })
	vim.api.nvim_set_hl(0, "NavicSeparator", { fg = theme.colors.purple, bg = theme.colors.bg })
end
