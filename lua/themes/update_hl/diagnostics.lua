--- @param theme ThemeConfig
return function(theme)
	local diagnostics_module = require("plugins.language_support.lsp.diagnostics")
	local diagnostics_config = diagnostics_module.config
	if theme.diagnostics_icon_style == "outline" then
		diagnostics_config.signs = diagnostics_module.outline_signs
	elseif theme.diagnostics_icon_style == "filled" then
		diagnostics_config.signs = diagnostics_module.filled_signs
	end
	diagnostics_config.float.border = theme.float_border_radius
	diagnostics_module.setup_diagnostics()
end
