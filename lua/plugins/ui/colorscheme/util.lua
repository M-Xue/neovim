local function is_onedark(colorscheme)
	return colorscheme:sub(1, #"onedark") == "onedark"
end

local function set_onedark_colorscheme(colorscheme)
	local onedark_opts = require("plugins.ui.colorscheme.onedark")

	if colorscheme == "onedark-dark" then
		onedark_opts.style = "dark"
	elseif colorscheme == "onedark-darker" then
		onedark_opts.style = "darker"
	elseif colorscheme == "onedark-warm" then
		onedark_opts.style = "warm"
	elseif colorscheme == "onedark-warmer" then
		onedark_opts.style = "warmer"
	elseif colorscheme == "onedark-cool" then
		onedark_opts.style = "cool"
	elseif colorscheme == "onedark-deep" then
		onedark_opts.style = "deep"
	elseif colorscheme == "onedark-light" then
		onedark_opts.style = "light"
	end

	require("onedark").setup(onedark_opts)
	vim.cmd.colorscheme("onedark")
end

local M = {}

M.set_colorscheme = function(colorscheme)
	print("test")
	local file = io.open(os.getenv("HOME") .. "/.config/nvim/colorscheme.txt", "w+")
	if file ~= nil then
		file:write(colorscheme)
		file:close()
	end

	if is_onedark(colorscheme) then
		set_onedark_colorscheme(colorscheme)
	else
		vim.cmd.colorscheme(colorscheme)
	end
end

M.init_colorscheme = function()
	local file = io.open(os.getenv("HOME") .. "/.config/nvim/colorscheme.txt", "r")
	if file ~= nil then
		local content = file:read("*all")
		file:close()

		-- vim.cmd.colorscheme(content)
		-- M.set_colorscheme("catppuccin-macchiato")
		if content ~= "" then
			M.set_colorscheme(content)
		else
			M.set_colorscheme("catppuccin-macchiato")
		end
	else
		M.set_colorscheme("catppuccin-macchiato")
	end
end

M.print_curr_colorscheme = function()
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

return M
