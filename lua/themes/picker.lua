local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

local picker = function(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "Colorscheme",
			finder = finders.new_table({
				results = require("themes.enabled-themes"),
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local colorscheme = selection[1]
					require("themes.util").set_theme(colorscheme)
				end)
				return true
			end,
		})
		:find()
end

M.colorscheme_picker = function()
	picker(require("telescope.themes").get_dropdown({}))
end

return M
