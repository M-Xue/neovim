local gitsigns = require("gitsigns")

-- Stage buffer
-- Toggle deleted
-- Undo stage hunk
--
-- Current branch changes - this is what we are looking for in PR reviews but try find a better UX for it
--
-- change preview hunk to be inline just to see how we feel about it

-- try get these in diffview
-- git history for line
-- git history for file
-- git history for all commits in diffview? this will allow me to check commit diffs
-- git histroy between current branch particular commit
-- even better if its against where it branched off master

vim.keymap.set("n", "<leader>hh", ":LazyGit<cr>", { desc = "Open LazyGit" })

-- Hunks
vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Toggle stage hunk" })
vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
vim.keymap.set("n", "<leader>hj", gitsigns.next_hunk, { desc = "Next hunk" })
vim.keymap.set("n", "<leader>hk", gitsigns.prev_hunk, { desc = "Prev hunk" })
vim.keymap.set("n", "<leader>hP", gitsigns.preview_hunk, { desc = "Preview hunk in float" })
vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

-- Permalink
vim.keymap.set({ "n", "v" }, "<leader>hl", ":.GBrowse master:%", { desc = "Open permalink in remote" })

-- Diffs
local function toggle_diffview()
	if next(require("diffview.lib").views) == nil then
		vim.cmd("DiffviewOpen")
	else
		vim.cmd("DiffviewClose")
	end
end
vim.keymap.set("n", "<leader>hd", toggle_diffview, { desc = "Diff index" })
vim.keymap.set("n", "<leader>hm", ":DiffviewOpen origin/master...HEAD", { desc = "Diff merge base" })

-- Blame
vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, { desc = "Git blame line" })
vim.keymap.set(
	"n",
	"<leader>hB",
	":Telescope advanced_git_search diff_commit_line<cr>",
	{ desc = "Git commit history for line" }
)
vim.keymap.set(
	"n",
	"<leader>h<c-b>",
	":Telescope advanced_git_search diff_commit_file<cr>",
	{ desc = "Git commit history for file" }
)
vim.keymap.set(
	"n",
	"<leader>h<c-B>",
	":Telescope advanced_git_search diff_branch_file<cr>",
	{ desc = "Diff against branch" }
)
vim.keymap.set(
	"n",
	"<leader>h<c-B>",
	":Telescope advanced_git_search changed_on_branch<cr>",
	{ desc = "Current branch changes" }
)
vim.keymap.set("n", "<leader>hH", ":DiffviewFileHistory<cr>", { desc = "Repo history" })
