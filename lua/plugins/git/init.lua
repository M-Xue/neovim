return {
	require("plugins.git.gitsigns"),
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
	{
		"sindrets/diffview.nvim",
		config = function()
			local diffview = require("diffview")
			diffview.setup({
				enhanced_diff_hl = true,
			})
			vim.opt.fillchars:append({ diff = "╱" })
		end,
	},
	{ "aaronhallaert/advanced-git-search.nvim" },
}
