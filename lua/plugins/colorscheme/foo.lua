local file = io.open("colorscheme.txt", "w+")
-- vim.print("foo")
if file ~= nil then
	vim.print("foo")
	file:write("test")
	file:close()
end
