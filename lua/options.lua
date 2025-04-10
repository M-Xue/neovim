local _util = require('_util');

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"
vim.opt.linebreak = true
vim.opt.pumheight = 15
vim.g.loaded_matchparen = 0

-- if _util.get_os() == 'windows' then
--     vim.o.shell = "powershell.exe"
-- end

vim.cmd("set colorcolumn=80")
