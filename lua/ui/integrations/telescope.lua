-- Colours
-- Telescope Highligh Groups Documentation: https://github.com/nvim-telescope/telescope.nvim/blob/39b12d84e86f5054e2ed98829b367598ae53ab41/plugin/telescope.lua#L11-L91
local colors = require('ui.themes.catppuccin_colours')
-- vim.api.nvim_set_hl(0, 'TelescopeBorder', { })

--[[


-- Border colors
-- Made it the same as the background because I don't want to see it
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', {
	fg = colors.black2,
	bg = colors.black2,
})
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', {
	fg = colors.darker_black,
	bg = colors.darker_black,
})
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', {
	fg = colors.darker_black,
	bg = colors.darker_black,
})

-- Title colors
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', {
	fg = colors.black,
	bg = colors.red,
})
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', {
	fg = colors.darker_black,
	bg = colors.darker_black,
})
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', {
	fg = colors.black,
	bg = colors.green,
})

-- Window colors
vim.api.nvim_set_hl(0, 'TelescopeNormal', {
	bg = colors.darker_black,
})

-- Prompt window colors
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', {
	fg = colors.white,
	bg = colors.black2,
})
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', {
	fg = colors.red,
	bg = colors.black2,
})

-- More advneced stuff
vim.api.nvim_set_hl(0, 'TelescopeSelection', {
	bg = colors.black2,
	fg = colors.white,
})

vim.api.nvim_set_hl(0, 'TelescopeResultsDiffAdd', {
	fg = colors.green,
})

vim.api.nvim_set_hl(0, 'TelescopeResultsDiffChange', {
	fg = colors.yellow,
})


--]]
