-- Marks
local function delete_all_marks()
	vim.cmd("delmarks a-zA-Z0-9^.")
	-- vim.cmd("delmarks '")
	-- vim.cmd('delmarks "')
	vim.cmd("delmarks <>")
	vim.cmd("delmarks []")
	vim.cmd("wshada!")
end
vim.keymap.set("n", "<leader>mD", delete_all_marks, { desc = " Clear all marks" })
vim.keymap.set("n", "<leader>ml", ":MarksQFListBuf<cr>", { desc = " QFList marks in buffer" })
