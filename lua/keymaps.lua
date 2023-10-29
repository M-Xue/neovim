vim.g.mapleader = " "

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>`", ":wa<CR>:qa<CR>", { desc = "Quit NeoVim" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
-- vim.keymap.set('n', '<leader>w', ":lua vim.lsp.buf.format()<CR>:w<CR>", { desc = 'Save file' })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" }) -- TODO dont make this close the buffer if it is the last buffer open -- <leader>q closes windows. If you only have one window, you will exit NVim
vim.keymap.set("n", "<leader>p", ":Format<CR>", { desc = "Format" })
vim.keymap.set("n", "<leader>o", ":Cheatsheet<CR>", { desc = "Cheatsheet" })
vim.keymap.set("n", "<leader>c", ":cd ", { desc = "Change directory" })

-- Telescope
vim.keymap.set("n", "<leader>f", "", { desc = "Telescope" })
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fr", telescope.registers, { desc = "See registers" })
vim.keymap.set("n", "<leader>fB", telescope.buffers, { desc = "See buffers" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fs", telescope.treesitter, { desc = "Find treesitter symbols" })
vim.keymap.set("n", "<leader>fS", telescope.lsp_document_symbols, { desc = "Find lsp buffer symbols" })

vim.keymap.set("n", "<leader>ft", ":Telescope toggleterm<CR>", { desc = "Find terminal" })
vim.keymap.set(
	"n",
	"<leader>fb",
	":Telescope file_browser path=%:p:h select_buffer=true<CR> <ESC>",
	{ desc = "File browser current buffer" }
)
vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { desc = "Find projects" })

-- Git
local gitsigns = require("gitsigns")
vim.keymap.set("n", "<leader>hh", ":LazyGit<cr>", { desc = "Open LazyGit" })
-- vim.keymap.set("n", "<leader>hd", gitsigns.toggle_deleted, { desc = "Toggle git deleted" })
vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff file" })
vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, { desc = "Git blame line" })

vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Git preview hunk" })
vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hu", gitsigns.reset_buffer_index, { desc = "Unstage all hunks in file" })

vim.keymap.set("n", "<leader>hk", gitsigns.next_hunk, { desc = "Git next hunk" })
vim.keymap.set("n", "<leader>hj", gitsigns.prev_hunk, { desc = "Git prev hunk" })

vim.keymap.set("n", "<leader>hrb", gitsigns.reset_buffer, { desc = "Git reset buffer" })
vim.keymap.set("n", "<leader>hrh", gitsigns.reset_hunk, { desc = "Git reset hunk" })

local function visual_stage()
	local first_line = vim.fn.line("v")
	local last_line = vim.fn.getpos(".")[2]
	gitsigns.stage_hunk({ first_line, last_line })
	-- Switch back to normal mode, there may be a cleaner way to do this
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "t", false)
end

vim.keymap.set("v", "<leader>hs", visual_stage, { desc = "Stage hunk" })

-- LSP
-- g: LSP
-- d: Diagnostics

-- Cmp
--[[
mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
        ...
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        ...
    end, { "i", "s" }),
}),
]]

-- Window Movement
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>sd", "<C-w>l", { desc = "Move cursor to right window" })
vim.keymap.set("n", "<leader>sa", "<C-w>h", { desc = "Move cursor to left window" })
vim.keymap.set("n", "<leader>ss", "<C-w>j", { desc = "Move cursor to window below" })
vim.keymap.set("n", "<leader>sw", "<C-w>k", { desc = "Move cursor to window above" })

-- Tab Movement
vim.keymap.set("n", "<leader>ll", ":tabnew %<CR>", { desc = "Create new tab" })
vim.keymap.set("n", "<leader>lq", ":tabc<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>lk", ":tabn<CR>", { desc = "Move to next tab" })
vim.keymap.set("n", "<leader>lj", ":tabp<CR>", { desc = "Move to prev tab" })

-- Window Resize
-- Source: https://www.reddit.com/r/neovim/comments/10wru1c/how_do_i_resize_windows/
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- Terminal
vim.keymap.set(
	"n",
	"<leader>tv",
	":ToggleTerm size=vim.o.columns * 0.4 direction=vertical<cr>",
	{ desc = "Open vertical terminal" }
)
vim.keymap.set("n", "<leader>th", ":ToggleTerm size=15 direction=horizontal<cr>", { desc = "Open horizontal terminal" })
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<cr>", { desc = "Open block terminal" }) -- full size temrinals
vim.keymap.set("n", "<leader>tp", ":ToggleTerm dir=%:p:h<cr>", { desc = "Open terminal for current buffer directory" })
vim.keymap.set("n", "<leader>td", ":ToggleTerm dir=", { desc = "Specify directory and open terminal" })

-- File Tree
vim.keymap.set("n", "<leader>yy", ":NvimTreeToggle<CR>", { noremap = true, desc = "Toggle nvim-tree" })
vim.keymap.set("n", "<leader>yf", ":NvimTreeFocus<CR>", { noremap = true, desc = "Focus nvim-tree" })
vim.keymap.set("n", "<leader>yc", ":NvimTreeCollapse<CR>", { noremap = true, desc = "Collapse nvim-tree" })
vim.keymap.set("n", "<leader>yF", ":NvimTreeFindFile<CR>", { noremap = true, desc = "Find file nvim-tree" })
