require("alpha").setup(require("alpha.themes.dashboard").config)
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

dashboard.section.buttons.val = {
	dashboard.button("p", "󰅩   Find project", ":Telescope projects<CR>"),
	dashboard.button("f", "   Find file", ":Telescope find_files<CR>"),
	dashboard.button("o", "ﭯ   Recently opened files", ":Telescope oldfiles<CR>"),
	dashboard.button("b", "   Browse files", ":Telescope file_browser<CR>"),
	dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "   Find word", ":lua require('telescope.builtin').live_grep()<CR>"),
	dashboard.button("t", "   Find todo", ":TodoTelescope<CR>"),
	dashboard.button("`", "   Quit NVIM", ":qa<CR>"),
}

-- local date = os.date("┏   Today is %a %d %b ┓")
local plugins = "  " .. #vim.tbl_keys(require("lazy").plugins()) .. " plugins in total"

dashboard.section.footer.val = {
	plugins,
	os.date("  Today is %a %d %b"),
}
