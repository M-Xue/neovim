vim.g.mapleader = " "
vim.g.augment_workspace_folders = { "~\\source\\repos\\q", "~\\source\\repos\\Plugins" }

require("plugins")
require("options")
require("keymaps")

vim.cmd("colorscheme catppuccin-macchiato")
