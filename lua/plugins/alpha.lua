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
				dashboard.button(
					"h",
					"󰀱   Harpoon",
					":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>"
				),
				dashboard.button("b", "   Browse files", ":Telescope file_browser<CR><esc>"),
				dashboard.button("w", "󰬴   Find word", ":lua require('telescope.builtin').live_grep()<CR>"),
				dashboard.button("t", "   Find todo", ":TodoTelescope<CR>"),
				dashboard.button("r", "   Recently opened files", ":Telescope oldfiles<CR>"),
				dashboard.button(
					"c",
					"   Config",
					":cd " .. require("_util").get_config_path() .. "<cr>:Telescope find_files<cr>",
					{
						silent = true,
					}
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
