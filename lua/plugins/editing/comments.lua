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
				ignore = "^$",

				---LHS of toggle mappings in NORMAL mode
				toggler = {
					---Line-comment toggle keymap
					line = "<c-/>",
					---Block-comment toggle keymap
					block = "<S-c>b",
				},
				---LHS of operator-pending mappings in NORMAL and VISUAL mode
				opleader = {
					---Line-comment keymap
					line = "<c-/>",
					---Block-comment keymap
					block = "<S-c>b",
				},
				---LHS of extra mappings
				extra = {
					---Add comment on the line above
					above = "<S-c>O",
					---Add comment on the line below
					below = "<S-c>o",
					---Add comment at the end of line
					eol = "<S-c>A",
				},
				---Enable keybindings
				---NOTE: If given `false` then the plugin won't create any mappings
				mappings = {
					---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
					basic = true,
					---Extra mapping; `gco`, `gcO`, `gcA`
					extra = true,
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
