local gitsigns = require("gitsigns")

-- https://www.reddit.com/r/neovim/comments/vlc9sc/how_to_define_a_user_command_to_partially_stage/?sort=new
-- Comment by andrewfz
local function visual_stage()
	local first_line = vim.fn.line("v")
	local last_line = vim.fn.getpos(".")[2]
	gitsigns.stage_hunk({ first_line, last_line })
	-- Switch back to normal mode, there may be a cleaner way to do this
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "t", false)
end

local function toggle_diffview()
	if next(require("diffview.lib").views) == nil then
		vim.cmd("DiffviewOpen")
	else
		vim.cmd("DiffviewClose")
	end
end

vim.keymap.set("n", "<leader>hh", ":LazyGit<cr>", { desc = "Open LazyGit" })

vim.keymap.set("n", "<leader>hd", toggle_diffview, { desc = "Diff file" })
vim.keymap.set("n", "<leader>hD", ":DiffviewOpen ", { desc = "Diff file (commit/branch)" })

vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, { desc = "Git blame line" })
vim.keymap.set(
	"n",
	"<leader>hB",
	":Telescope advanced_git_search diff_commit_line<cr>",
	{ desc = "Git blame line history" }
)
vim.keymap.set(
	"n",
	"<leader>h<c-b>",
	":Telescope advanced_git_search diff_commit_file<cr>",
	{ desc = "Git blame file history" }
)

vim.keymap.set("n", "<leader>ht", gitsigns.toggle_deleted, { desc = "Toggle deleted" })

vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hP", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Toggle stage hunk" })
vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
vim.keymap.set("v", "<leader>hs", visual_stage, { desc = "Stage hunk" })

vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })

vim.keymap.set("n", "<leader>hj", gitsigns.next_hunk, { desc = "Next hunk" })
vim.keymap.set("n", "<leader>hk", gitsigns.prev_hunk, { desc = "Prev hunk" })

vim.keymap.set({ "n", "v" }, "<leader>hl", ":.GBrowse master:%", { desc = "Open permalink in remote" })
