return {
	require("plugins.navigation.trouble"),
	require("plugins.navigation.nvim-tree"),
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({
				default_mappings = false,
				mappings = {
					toggle = "<leader>mm",
					delete_buf = "<leader>md",
				},
				force_write_shada = true,
			})
		end,
	},
	{
		"nacro90/numb.nvim",
		opts = {
			show_numbers = true, -- Enable 'number' for the window while peeking
			show_cursorline = true, -- Enable 'cursorline' for the window while peeking
			hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
			number_only = true, -- Peek only when the command is only a number instead of when it starts with a number
			centered_peeking = true, -- Peeked line will be centered relative to window
		},
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				detection_methods = { "pattern" },
				patterns = { ".git" },
			})
		end,
	},
	{ "unblevable/quick-scope" }, -- Unqiue character highlight
}
