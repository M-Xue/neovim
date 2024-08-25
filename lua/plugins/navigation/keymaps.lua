local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>'", function()
	harpoon:list():add()
end)

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	local make_finder = function()
		local paths = {}

		for _, item in ipairs(harpoon_files.items) do
			table.insert(paths, item.value)
		end

		return require("telescope.finders").new_table({
			results = paths,
		})
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),

			-- Removing Harpoon mark from telescope
			attach_mappings = function(prompt_buffer_number, map)
				-- Selected files. If none selected, delete all files
				map("i", "<c-d>", function()
					local state = require("telescope.actions.state")
					local selected_entry = state.get_selected_entry()
					local current_picker = state.get_current_picker(prompt_buffer_number)
					harpoon:list():remove(selected_entry)
					current_picker:refresh(make_finder())
				end)
				return true
			end,
		})
		:find()
end

vim.keymap.set("n", "f'", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

-- Marks
local function delete_all_marks()
	vim.cmd("delmarks a-zA-Z0-9^.")
	-- vim.cmd("delmarks '")
	-- vim.cmd('delmarks "')
	vim.cmd("delmarks <>")
	vim.cmd("delmarks []")
	vim.cmd("wshada!")
end
vim.keymap.set("n", "<leader>md", delete_all_marks, { desc = "Clear all marks" })
-- toggle = "<leader>mm",
-- delete_buf = "<leader>md",
