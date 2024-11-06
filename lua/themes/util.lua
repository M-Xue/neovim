local util = require("config_util")
local config_path = util.get_config_path()
local saved_colorscheme_path = config_path .. (util.get_os() == "windows" and "\\colorscheme.txt" or "/colorscheme.txt")

local save_colorscheme_to_file = function(colorscheme)
	-- local file = io.open(os.getenv("HOME") .. "/.config/nvim/colorscheme.txt", "w+")
	local file = io.open(saved_colorscheme_path, "w+")
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

	if theme_name == "catppuccin-macchiato" then
		ThemeConfig = require("themes.theme_configs.catppuccin-macchiato")
	elseif theme_name == "gruvbox" then
		vim.o.background = "dark"
		ThemeConfig = require("themes.theme_configs.gruvbox")
	elseif theme_name == "vscode-dark" then
		vim.o.background = "dark"
		ThemeConfig = require("themes.theme_configs.vscode-dark")
	else
		vim.print("Invalid theme")
		save_colorscheme_to_file("catppuccin-macchiato")
	end
	if ThemeConfig ~= nil then
		if theme_name == "vscode-dark" then
			vim.cmd.colorscheme("vscode")
			vim.o.background = "dark"
		else
			vim.cmd.colorscheme(ThemeConfig.colorscheme_name)
		end
		require("themes.update_hl").update_highlight_groups(ThemeConfig)
	end
end

local init_theme = function()
	-- local file = io.open(os.getenv("HOME") .. "/.config/nvim/colorscheme.txt", "r")
	local file = io.open(saved_colorscheme_path, "r")
	if file ~= nil then
		local content = file:read("*all")
		file:close()

		if content ~= "" then
			set_theme(content)
		else
			set_theme("catppuccin-macchiato")
		end
	else
		set_theme("catppuccin-macchiato")
	end
end

local print_curr_theme = function()
	-- local file = io.open(os.getenv("HOME") .. "/.config/nvim/colorscheme.txt", "r")
	local file = io.open(saved_colorscheme_path, "r")
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
