local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>'", function()
	harpoon:list():add()
end, { desc = "Harpoon" })

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
vim.keymap.set("n", '"', function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

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
vim.keymap.set("n", "<leader>mD", delete_all_marks, { desc = "Clear all marks" })
-- toggle = "<leader>mm",
-- delete_buf = "<leader>md",

vim.keymap.set("n", "<leader>yy", ":NvimTreeToggle<CR>", { noremap = true, desc = "Toggle nvim-tree" })
vim.keymap.set("n", "<leader>yf", ":NvimTreeFocus<CR>", { noremap = true, desc = "Focus nvim-tree" })
vim.keymap.set("n", "<leader>yc", ":NvimTreeCollapse<CR>", { noremap = true, desc = "Collapse nvim-tree" })
vim.keymap.set("n", "<leader>yF", ":NvimTreeFindFile<CR>", { noremap = true, desc = "Find file nvim-tree" })

-- Window Movement
vim.keymap.set("n", "<leader>ss", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

vim.keymap.set("n", "<leader>sd", "<C-w>l", { desc = "Move cursor to right window" })
vim.keymap.set("n", "<leader>sD", "<C-w>L", { desc = "Move window to far right" })
vim.keymap.set("n", "<leader>sa", "<C-w>h", { desc = "Move cursor to left window" })
vim.keymap.set("n", "<leader>sA", "<C-w>H", { desc = "Move window to far left" })
vim.keymap.set("n", "<leader>sx", "<C-w>j", { desc = "Move cursor to window below" })
vim.keymap.set("n", "<leader>sX", "<C-w>J", { desc = "Move window to bottom" })
vim.keymap.set("n", "<leader>sw", "<C-w>k", { desc = "Move cursor to window above" })
vim.keymap.set("n", "<leader>sW", "<C-w>K", { desc = "Move window to top" })

vim.keymap.set("n", "<leader>sr", "<C-w>x", { desc = "Swap window with next" })
vim.keymap.set("n", "<leader>st", "<C-w>T", { desc = "Open new tab with window" })
vim.keymap.set("n", "<leader>s=", "<C-w>=", { desc = "Make all windows equal size" })
vim.keymap.set("n", "<leader>sq", ":close<cr>", { desc = "Close window" })

-- Tab Movement
vim.keymap.set("n", "<leader>kl", ":tabnew %<CR>", { desc = "Create new tab" })
vim.keymap.set("n", "<leader>kq", ":tabc<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>kj", ":tabn<CR>", { desc = "Move to next tab" })
vim.keymap.set("n", "<leader>kk", ":tabp<CR>", { desc = "Move to prev tab" })

-- Window Resize
-- Source: https://www.reddit.com/r/neovim/comments/10wru1c/how_do_i_resize_windows/
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -
