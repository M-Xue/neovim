return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
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
					-- "markdown",
					"markdown_inline",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
				indent = { enable = true },
				textobjects = require("plugins.editing.treesitter-textobjs-config"),
			})
		end,
	},
}
