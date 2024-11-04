--- @param theme ThemeConfig
local update_highlight_groups = function(theme)
	require("themes.update_hl.telescope")(theme)
	require("themes.update_hl.cmp")(theme)

	require("themes.update_hl.gitsigns")(theme)
	require("themes.update_hl.navic")(theme)
	require("themes.update_hl.diagnostics")(theme)

	require("themes.update_hl.builtin")(theme)

	require("themes.update_hl.nvim-tree")(theme)
	require("themes.update_hl.lualine")(theme)
end

local M = {
	update_highlight_groups = update_highlight_groups,
}
return M
