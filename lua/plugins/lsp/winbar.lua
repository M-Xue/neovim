-- local set_navic_highlights = function()
-- 	vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "#000000", fg = "#ffffff" })
-- 	vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "#000000", fg = "#ffffff" })
-- end

return {
	"SmiteshP/nvim-navic",
	event = "LspAttach",
	config = function()
		vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
		-- set_navic_highlights()
		require("nvim-navic").setup({
			enabled = true,
			separator = " > ",
			highlight = true,
			depth_limit = 5,
			depth_limit_indicator = "..",
			lazy_update_context = true,
			icons = require("icons.lspkind").icons,
			format_text = function(text)
				return " " .. text
			end,
		})
	end,
}
