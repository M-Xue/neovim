return {
	{
		"goolord/alpha-nvim",
		priority = 999,
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
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
				dashboard.button("f", "󰈞   Find file", ":Telescope find_files<CR>"),
				dashboard.button("b", "   Browse files", ":Telescope file_browser<CR><esc>"),
				-- dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("w", "󰬴   Find word", ":lua require('telescope.builtin').live_grep()<CR>"),
				dashboard.button("t", "   Find todo", ":TodoTelescope<CR>"),
				dashboard.button("r", "   Recently opened files", ":Telescope oldfiles<CR>"),
				dashboard.button("p", "󰅩   Find project", ":Telescope projects<CR>"),
				dashboard.button("d", "   Change directories", ":cd "),
				dashboard.button(
					"c",
					"   Config",
					":cd " .. os.getenv("HOME") .. "/.config/nvim<cr>:Telescope find_files<cr>"
				),
				dashboard.button("`", "   Quit NVIM", ":qa<CR>"),
			}

			-- local date = os.date("┏   Today is %a %d %b ┓")
			local plugins = "  " .. #vim.tbl_keys(require("lazy").plugins()) .. " plugins in total"

			dashboard.section.footer.val = {
				plugins,
				os.date("  Today is %a %d %b"),
			}
		end,
	},
}
