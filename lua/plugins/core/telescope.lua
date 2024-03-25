return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
					},
				},
				defaults = {
					prompt_prefix = " 󰍉 ",
					selection_caret = "   ",
					entry_prefix = "   ",
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					-- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					-- https://www.w3.org/TR/xml-entity-names/025.html
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					color_devicons = true,
				},
				extensions = {
					file_browser = {
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
					},
					undo = {
						-- https://github.com/debugloop/telescope-undo.nvim#configuration
						side_by_side = true,
						layout_strategy = "vertical",
						layout_config = {
							preview_height = 0.8,
						},
					},
				},
			})

			telescope.load_extension("file_browser")
			telescope.load_extension("toggleterm")
			telescope.load_extension("projects")
			telescope.load_extension("undo")
			telescope.load_extension("harpoon")

			-- base telescope mappings
			-- <C-x> 	Go to file selection as a split
			-- <C-v> 	Go to file selection as a vsplit
			-- <C-t> 	Go to a file in a new tab
			-- <C-u> 	Scroll up in preview window
			-- <C-d> 	Scroll down in preview window
			-- <C-f> 	Scroll left in preview window
			-- <C-k> 	Scroll right in preview window

			-- Telescope undo mappings
			-- ["<cr>"] = require("telescope-undo.actions").yank_additions,
			-- ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
			-- ["<C-cr>"] = require("telescope-undo.actions").restore,
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"https://git.sr.ht/~havi/telescope-toggleterm.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"akinsho/toggleterm.nvim",
			"nvim-lua/popup.nvim",
		},
		event = "TermOpen",
	},
	-- {
	-- 	"nvim-telescope/telescope-fzf-native.nvim",
	-- 	build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	-- },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
	},
}
