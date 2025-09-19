vim.g.mapleader = " "

require("plugins")
require("options")
require("keymaps")

vim.cmd("colorscheme catppuccin-macchiato")

vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = "#1e2030", bg = "#1e2030" })
vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { fg = "#1e2030", bg = "#1e2030" })
vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = "#cad3f5", bg = "#1e2030" })
