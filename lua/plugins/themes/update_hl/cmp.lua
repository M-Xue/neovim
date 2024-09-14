--- @param theme ThemeConfig
return function(theme)
	vim.api.nvim_set_hl(0, "CmpItemMenu", { bg = theme.window_color })
	vim.api.nvim_set_hl(0, "CmpSel", { bg = theme.cmp_selected_color })
	vim.api.nvim_set_hl(0, "CmpBorder", { bg = theme.window_color, fg = theme.border_color })

	local lspkind_colors = require("icons.lspkind").colors
	for key, value in pairs(lspkind_colors) do
		local hl_group = "CmpItemKind" .. key
		vim.api.nvim_set_hl(0, hl_group, { fg = theme.colors[value] })
	end
end
