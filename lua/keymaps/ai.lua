vim.keymap.set(
	"n",
	"<leader>as",
	":Copilot suggestion toggle_auto_trigger<cr>",
	{ desc = "Toggle Copilot suggestions" }
)
vim.keymap.set("n", "<leader>app", ":Copilot panel toggle<cr>", { desc = "Toggle Copilot suggestion panel" })
vim.keymap.set("n", "<leader>apr", ":Copilot panel refresh<cr>", { desc = "Refresh Copilot suggestion panel" })
vim.keymap.set("n", "<leader>aa", ":AvanteAsk<cr>", { desc = "Toggle Avante chat" })
vim.keymap.set("n", "<leader>am", ":AvanteModels<cr>", { desc = "See Avante models" })
