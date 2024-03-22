vim.g.mapleader = " "

require("plugins")
require("options")
require("keymaps")
local util = require("util")
util.init_colorscheme()
