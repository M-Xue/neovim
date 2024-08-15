-- Terminal
vim.keymap.set(
	"n",
	"<leader>tv",
	":ToggleTerm size=vim.o.columns * 0.4 direction=vertical<cr>",
	{ desc = "Open vertical terminal" }
)
vim.keymap.set("n", "<leader>tt", ":ToggleTerm <cr>", { desc = "Open terminal" })
vim.keymap.set("n", "<leader>th", ":ToggleTerm size=15 direction=horizontal<cr>", { desc = "Open horizontal terminal" })
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<cr>", { desc = "Open block terminal" }) -- full size temrinals
vim.keymap.set("n", "<leader>tp", ":ToggleTerm dir=%:p:h<cr>", { desc = "Open terminal for current buffer directory" })
vim.keymap.set("n", "<leader>td", ":ToggleTerm dir=", { desc = "Specify directory and open terminal" })
