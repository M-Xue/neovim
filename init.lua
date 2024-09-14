vim.g.mapleader = " "

--- @type ThemeConfig
ThemeConfig = nil

require("plugins")
require("autocmd")
require("options")
require("keymaps")
require("plugins.themes.util").init_theme()
-- require("plugins.themes.util").init_theme()
