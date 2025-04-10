return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = true,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		dependencies = {
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
				ignore = "^$", -- Ignore empty lines

				toggler = {
					line = "<leader>/",
					-- block = "<leader>;", -- TODO need to find better keymap
				},
				opleader = {
					line = "<leader>/",
					-- block = "<leader>;",
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = true,
	},
}
