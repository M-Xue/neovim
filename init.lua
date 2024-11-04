vim.g.mapleader = " "

--- @type ThemeConfig
ThemeConfig = nil

require("plugins")
require("themes.util").init_theme()
require("autocmd")
require("options")
require("keymaps")
