--- @param theme ThemeConfig
return function(theme)
	local nvimtree_config = require("plugins.navigation.nvim-tree").config
	if theme.nvimtree_modified_glyph == "icon" then
		nvimtree_config.renderer.icons.glyphs.modified = ""
	elseif theme.nvimtree_modified_glyph == "text" then
		nvimtree_config.renderer.icons.glyphs.modified = "[+]"
	end
	require("nvim-tree").setup(nvimtree_config)
end
