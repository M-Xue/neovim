return {
	{
		"sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		config = function()
			local diffview = require("diffview")
			diffview.setup({
				enhanced_diff_hl = true,
				file_panel = {
					win_config = {
						position = "right",
						width = 45,
					},
				},
			})
			vim.opt.fillchars:append({ diff = "╱" })
		end,
	},
}
