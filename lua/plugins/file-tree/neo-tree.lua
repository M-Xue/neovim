return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,
                },
            },
            default_component_configs = {
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "",
                        deleted   = "",
                        modified  = "",
                        renamed   = "",
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "",
                        staged    = "",
                        conflict  = "",
                    }
                }
            }
        }
	},
}
