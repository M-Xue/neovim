--- @param theme ThemeConfig
local update_hl = function(theme)
	require("plugins.themes.update_hl.telescope")(theme)
	require("plugins.themes.update_hl.cmp")(theme)

	require("plugins.themes.update_hl.gitsigns")(theme)
	require("plugins.themes.update_hl.navic")(theme)

	-- require("plugins.themes.update_hl.lsp")(theme)
end

local M = {
	update_hl = update_hl,
}
return M
