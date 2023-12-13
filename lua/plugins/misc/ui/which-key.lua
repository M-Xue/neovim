local wk = require("which-key")
-- Help link: https://medium.com/@shaikzahid0713/which-key-7554ac347c9d

--[[ wk.setup({
	window = {
		border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
	},
}) ]]

local mappings = {
	["<leader>"] = {
		f = { name = "Telescope" },
		s = { name = "Window" },
		l = { name = "Tab" },
		t = { name = "Terminal" },
		c = { name = "Comment" },
		y = { name = "File Tree" },
		h = { name = "Git" },
		d = { name = "Debug" },
	},
}
wk.register(mappings)
