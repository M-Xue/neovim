return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				signs = {
					-- add = { text = "▎" },
					-- change = { text = "▎" },
					-- delete = { text = "_" },
					-- topdelete = { text = "‾" },
					-- changedelete = { text = "~" },
					add = { text = "+" },
					change = { text = "|" },
					delete = { text = "-" },
					topdelete = { text = "-" },
					changedelete = { text = "|" },

					untracked = { text = "┆" }, -- TODO change these
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				yadm = {
					enable = false,
				},
			})

			-- Green
			vim.api.nvim_set_hl(0, "GitSignsChange", {
				fg = "#a6da95",
			})
			-- Yellow
			vim.api.nvim_set_hl(0, "GitSignsAdd", {
				fg = "#eed49f",
			})
			-- Red
			vim.api.nvim_set_hl(0, "GitSignsDelete", {
				fg = "#ed8796",
			})
			-- Rosewater
			vim.api.nvim_set_hl(0, "GitSignsUntracked", {
				fg = "#f4dbd6",
			})
			-- Mauve
			vim.api.nvim_set_hl(0, "GitSignsChangedelete", {
				fg = "#c6a0f6",
			})
		end,
	},
	{
		-- Docs: https://github.com/kdheepak/lazygit.nvim
		-- custom configs for lazygit
		-- https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md
		-- https://github.com/jesseduffield/lazygit/blob/master/docs/Custom_Command_Keybindings.md

		-- '`' for return
		-- q for quit
		-- 'o' when in stash tab to edit config
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ "tpope/vim-fugitive" }, -- This is a vim plugin, not Lua. Not customized.
}
