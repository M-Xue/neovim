return {

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			view = {
				width = 35,
			},
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			renderer = {
				highlight_diagnostics = true,
				highlight_modified = "all",
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "├",
					},
				},
				icons = {
					web_devicons = {
						file = {
							enable = true,
							color = true,
						},
						folder = {
							enable = false,
							color = true,
						},
					},
					show = {
						diagnostics = false,
					},
					modified_placement = "after",
					git_placement = "before",
					diagnostics_placement = "signcolumn",
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "",
						modified = "[+]",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "󰆣",
							staged = "󰆤",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			git = {
				enable = false,
				show_on_dirs = true,
				show_on_open_dirs = true,
				ignore = false,
				timeout = 400,
			},
			diagnostics = {
				enable = false,
				show_on_dirs = true,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			modified = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
			},
		},
	},
}
