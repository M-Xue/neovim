return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = false,
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	},
	{
		-- local group_cdpwd = vim.api.nvim_create_augroup("group_cdpwd", { clear = true })
		-- vim.api.nvim_create_autocmd("VimEnter", {
		-- 	group = group_cdpwd,
		-- 	pattern = "*",
		-- 	callback = function()
		-- 		vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
		-- 	end,
		-- })
		"m4xshen/autoclose.nvim",
	},
	{
		"utilyre/sentiment.nvim",
		version = "*",
		event = "VeryLazy", -- keep for lazy loading
		init = function()
			-- `matchparen.vim` needs to be disabled manually in case of lazy loading
			vim.g.loaded_matchparen = 1
		end,
		config = function()
			require("sentiment").enable()
		end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		opts = {
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
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
	},
	{ "mbbill/undotree" },
}
