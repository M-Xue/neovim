local filled_diagnostics_signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

local outline_diagnostics_signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

--- @param theme ThemeConfig
return function(theme)
	local diagnostics_signs = filled_diagnostics_signs
	local diagnostics_icon_style = theme.diagnostics_icon_style
	if diagnostics_icon_style == "outline" then
		diagnostics_signs = outline_diagnostics_signs
	elseif diagnostics_icon_style == "filled" then
		diagnostics_signs = filled_diagnostics_signs
	end

	local diagnostics_config = {
		virtual_text = false,
		signs = {
			active = diagnostics_signs,
		},
		update_in_insert = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	diagnostics_config.float.border = theme.border_radius

	for _, sign in ipairs(diagnostics_signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end
	vim.diagnostic.config(diagnostics_config)
end
