require("nvim-tree").setup({
	--sort_by = "case_sensitive",
	view = {
		width = 35,
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	--[[
	renderer = {
    	group_empty = true,
    },
    filters = {
		dotfiles = true,
	},
	--]]
	-- hijack_netrw = false,
})
