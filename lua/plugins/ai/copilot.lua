return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					layout = {
						position = "right", -- | top | left | right | bottom |
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = false,
					hide_during_completion = true,
					debounce = 75,
					trigger_on_accept = true,
					keymap = {
						accept = "<C-Tab>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				-- copilot_node_command = "node", -- Node.js version must be > 20
				-- copilot_model = "",
				disable_limit_reached_message = false, -- Set to `true` to suppress completion limit reached popup
				root_dir = function()
					return vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
				end,
			})
		end,
	},
}
