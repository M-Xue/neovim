return {
	{
		"folke/flash.nvim",
		opts = {
			{
				modes = {
					char = {
						enabled = false,
						autohide = true,
						jump_labels = false,
						multi_line = true,
						highlight = { backdrop = false },
					},
				},
			},
		},
	},
	{
		"ThePrimeagen/harpoon",
		config = true,
	},
	{
		"abecodes/tabout.nvim",
		opts = {
			tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
			backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
			act_as_tab = true, -- shift content if tab out is not possible
			act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
			default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
			default_shift_tab = "<C-d>", -- reverse shift default action,
			enable_backwards = true, -- well ...
			completion = true, -- if the tabkey is used in a completion pum
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = "`", close = "`" },
				{ open = "(", close = ")" },
				{ open = "[", close = "]" },
				{ open = "{", close = "}" },
			},
			ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
			exclude = {}, -- tabout will ignore these filetypes
		},
	},
	{ "unblevable/quick-scope" },
	{
		"nacro90/numb.nvim",
		opts = {
			show_numbers = true, -- Enable 'number' for the window while peeking
			show_cursorline = true, -- Enable 'cursorline' for the window while peeking
			hide_relativenumbers = false, -- Enable turning off 'relativenumber' for the window while peeking
			number_only = true, -- Peek only when the command is only a number instead of when it starts with a number
			centered_peeking = true, -- Peeked line will be centered relative to window
		},
	},
}
