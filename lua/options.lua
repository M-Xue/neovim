vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"
vim.opt.linebreak = true

vim.cmd("set colorcolumn=80")
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	callback = function()
-- 		vim.cmd("SignatureToggle")
-- 	end,
-- })
