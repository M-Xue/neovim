local function getComponentSeparators()
	if ThemeConfig.lualine_separator_style == "sharp" then
		return { left = "", right = "" }
	end
	return {}
	-- component_separators = { left = "│", right = "│" },
end
local function getSectionSeparators()
	if ThemeConfig.lualine_separator_style == "sharp" then
		return { left = "", right = "" }
	end
	return {}
end

local function getDiagnosticSymbols()
	if ThemeConfig.diagnostics_icon_style == "outline" then
		return { error = " ", warn = " ", info = " ", hint = " " }
	end
	return { error = " ", warn = " ", info = " ", hint = " " }
end

local function getModifiedIcon()
	if ThemeConfig.nvimtree_modified_glyph == "icon" then
		return ""
	end
	return "[+]"
end

local function getGitSymbols()
	if ThemeConfig.lualine_git_diff_style == "icon" then
		return { added = " ", modified = " ", removed = " " }
	end
	return { added = "+", modified = "~", removed = "-" }
end
--- @param theme ThemeConfig
return function(theme)
	local lualine_config = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = getComponentSeparators(),
			section_separators = getSectionSeparators(),
			disabled_filetypes = {
				statusline = { "NvimTree", "alpha" },
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = getDiagnosticSymbols(),
					diagnostics_color = {
						-- color_error = { fg = colors.red },
						-- color_warn = { fg = colors.yellow },
						-- color_info = { fg = colors.cyan },
					},
				},
			},
			lualine_c = {
				{
					"filename",
					path = 1,
					symbols = {
						modified = getModifiedIcon(),
					},
				},
			},
			lualine_x = {
				{
					"diff",
					-- icon = ' ',
					symbols = getGitSymbols(),
					diff_color = {
						-- added = { fg = colors.green },
						-- modified = { fg = colors.orange },
						-- removed = { fg = colors.red },
					},
					-- cond = conditions.hide_in_width,
				},
				"filetype",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},

		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	}
	local lualine = require("lualine")
	lualine.setup(lualine_config)
end
