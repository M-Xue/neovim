local save_colorscheme_to_file = function(colorscheme)
	local file = io.open(os.getenv("HOME") .. "/.config/nvim/colorscheme.txt", "w+")
	if file ~= nil then
		file:write(colorscheme)
		file:close()
	else
		vim.print("Could not save colorscheme to file")
	end
end

--- @param theme_name Themes
local set_theme = function(theme_name)
	save_colorscheme_to_file(theme_name)

	if theme_name == "catppuccin" then
		ThemeConfig = require("plugins.themes.theme_configs.catppuccin")
	elseif theme_name == "gruvbox" then
		ThemeConfig = require("plugins.themes.theme_configs.gruvbox")
	else
		vim.print("Invalid theme")
	end
	vim.cmd.colorscheme(ThemeConfig.colorscheme_name)
	require("plugins.themes.update_hl").update_hl(ThemeConfig)
end

local init_theme = function()
	local file = io.open(os.getenv("HOME") .. "/.config/nvim/colorscheme.txt", "r")
	if file ~= nil then
		local content = file:read("*all")
		file:close()

		if content ~= "" then
			set_theme(content)
		else
			set_theme("catppuccin")
		end
	else
		set_theme("catppuccin")
	end
end

local print_curr_theme = function()
	local file = io.open(os.getenv("HOME") .. "/.config/nvim/colorscheme.txt", "r")
	if file ~= nil then
		local content = file:read("*all")
		file:close()

		if content ~= "" then
			vim.print("Colorscheme: " .. content)
		else
			vim.print("No colorscheme set")
		end
	else
		vim.print("Couldn't find colorscheme.txt")
	end
end

local M = {
	set_theme = set_theme,
	init_theme = init_theme,
	print_curr_theme = print_curr_theme,
}
return M
