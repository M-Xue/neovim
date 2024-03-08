return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"javascript",
					"typescript",
					"html",
					"css",
					"tsx",
					"svelte",
					"go",
					"gomod",
					"gosum",
					"gowork",
					"rust",
					"python",
					"lua",
					"bash",
					"sql",
					"regex",
					"graphql",
					"dockerfile",
					"astro",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
				indent = { enable = true },
				autotag = {
					enable = true,
					enable_rename = true,
					enable_close = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},
}
