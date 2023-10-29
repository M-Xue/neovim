local lualine = require('lualine')

lualine.setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = { "NvimTree", 'alpha' },
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {
			'branch',
			{
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
				diagnostics_color = {
					-- color_error = { fg = colors.red },
					-- color_warn = { fg = colors.yellow },
					-- color_info = { fg = colors.cyan },
				}
			},
		},
		lualine_c = { 'filename' },
		lualine_x = {
			{
				'diff',
				-- Is it me or the symbol for modified us really weird
				-- icon = ' ',
				symbols = { added = ' ', modified = ' ', removed = ' ' },
				diff_color = {
					-- added = { fg = colors.green },
					-- -- modified = { fg = colors.orange },
					-- -- removed = { fg = colors.red },
				},
				-- cond = conditions.hide_in_width,
			},
			'filetype'
		},
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},


	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

--      section_separators = { left = '', right = '' },
--
--      TODO
--      LSP maybe
--      make it responsive/collapsable. Example here: https://github.com/nvim-lualine/lualine.nvim/blob/05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9/examples/evil_lualine.lua with the conditions local function
--      change the colours for the modes?
