return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
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
					m = { name = "Marks" },
					j = { name = "Motions" },
				},
			}
			wk.register(mappings)
		end,
	},
	{
		"sudormrfbin/cheatsheet.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			bundled_cheatsheets = false,
			bundled_plugin_cheatsheets = false,
		},
	},
	{
		"shortcuts/no-neck-pain.nvim",
		config = true,
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			local project = require("project_nvim")
			project.setup({
				detection_methods = { "pattern" },
				patterns = { ".git" },
			})
		end,
	},

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
				dashboard.button("s", "   Settings", ":cd ~/.config/nvim<cr>:Telescope find_files<cr>"),
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
