local util = require("util")

vim.keymap.set("n", "<leader>]", util.print_attached_clients, { desc = "See attached clients" })

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>`", ":wa<CR>:qa<CR>", { desc = "Quit NeoVim" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" }) -- TODO dont make this close the buffer if it is the last buffer open -- <leader>q closes windows. If you only have one window, you will exit NVim
vim.keymap.set("n", "<leader>p", ":Format<CR>", { desc = "Format" })
vim.keymap.set("n", "<leader>o", ":Cheatsheet<CR>", { desc = "Cheatsheet" })
vim.keymap.set("n", "<leader>c", ":cd ", { desc = "Change directory" })
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<cr>", { desc = "Undo tree" })
vim.keymap.set("n", "<leader>z", ":NoNeckPain<cr>", { desc = "Zen mode" })
vim.keymap.set("n", "<leader>b", ":SymbolsOutline<cr>", { desc = "Symbols tree" })

vim.keymap.set("n", "<leader>'", require("harpoon.mark").add_file, { desc = "Harpoon mark file" })

-- Marks
vim.keymap.set("n", "<leader>mm", ":MarksToggleSigns<cr>", { desc = "Toggle marks indicator" })
vim.keymap.set("n", "<leader>md", ":delmarks a-zA-Z0-9<cr>", { desc = "Clear all marks" })

-- Flash
local flash = require("flash")
vim.keymap.set("n", "<leader>jj", flash.jump, { desc = "Flash jump" })
vim.keymap.set("n", "<leader>jt", flash.treesitter, { desc = "Flash treesitter" })
vim.keymap.set("n", "<leader>js", flash.treesitter_search, { desc = "Flash treesitter search" })
vim.keymap.set("n", "<leader>jh", flash.toggle, { desc = "Flash toggle" })

vim.keymap.set("n", "<leader>jl", require("telescope.builtin").jumplist, { desc = "Telescope jumplist" })

-- Telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fr", telescope.registers, { desc = "See registers" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "See buffers" })

vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Live grep in working directory" })
vim.keymap.set("n", "<leader>fG", telescope.grep_string, { desc = "Search working directory for string/selection" })
vim.keymap.set("n", "<leader>fs", telescope.current_buffer_fuzzy_find, { desc = "Fuzzy find current buffer" })
vim.keymap.set("n", "<leader>fT", telescope.treesitter, { desc = "Find treesitter symbols" })

vim.keymap.set(
	"n",
	"<leader>fw",
	":Telescope file_browser path=%:p:h select_buffer=true<CR> <ESC>",
	{ desc = "File browser current buffer" }
)
vim.keymap.set("n", "<leader>fu", ":Telescope undo<CR>", { desc = "Undo history" })
vim.keymap.set("n", "<leader>ft", ":Telescope toggleterm<CR>", { desc = "Find terminal" })
vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { desc = "Find projects" })
vim.keymap.set("n", "<leader>f'", ":Telescope harpoon marks<cr>", { desc = "Find harpoon file" })

-- Git
local gitsigns = require("gitsigns")
vim.keymap.set("n", "<leader>hh", ":LazyGit<cr>", { desc = "Open LazyGit" })
vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff file" })
vim.keymap.set("n", "<leader>hD", ":Gitsigns diffthis ", { desc = "Diff file (commit/branch)" })
vim.keymap.set("n", "<leader>ht", gitsigns.toggle_deleted, { desc = "Toggle deleted" })
vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, { desc = "Git blame line" })

vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hP", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })
vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>hu", gitsigns.reset_buffer_index, { desc = "Unstage all hunks in file" })

vim.keymap.set("n", "<leader>hk", gitsigns.next_hunk, { desc = "Next hunk" })
vim.keymap.set("n", "<leader>hj", gitsigns.prev_hunk, { desc = "Prev hunk" })

vim.keymap.set("n", "<leader>hrb", gitsigns.reset_buffer, { desc = "Git reset buffer" })
vim.keymap.set("n", "<leader>hrh", gitsigns.reset_hunk, { desc = "Git reset hunk" })

vim.keymap.set("n", "<leader>hi", ":diffget ", { desc = "Diffget" })

-- https://www.reddit.com/r/neovim/comments/vlc9sc/how_to_define_a_user_command_to_partially_stage/?sort=new
-- Comment by andrewfz
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

-- Debug
local dap = require("dap")
vim.keymap.set("n", "<leader>da", dap.continue, { desc = "Continue" })
vim.keymap.set("n", "<leader>ds", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.clear_breakpoints, { desc = "Clear breakpoints" })
vim.keymap.set("n", "<leader>dt", dap.list_breakpoints, { desc = "List breakpoints" })

vim.keymap.set("n", "<leader>dd", dap.step_over, { desc = "Step over (next line)" })
vim.keymap.set("n", "<leader>df", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<leader>dg", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').open({reset = true})<cr>", { desc = "Reset DAP UI" })

vim.keymap.set("n", "<leader>dS", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Set breakpoint with condition" })
vim.keymap.set("n", "<leader>dA", function()
	dap.set_breakpoint(vim.fn.input(nil, nil, "Log point message: "))
end, { desc = "Set breakpoint with log" })
vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Go down stacktrace" })
vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Go up stacktrace" })

vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Terminate" })
vim.keymap.set("n", "<leader>dR", dap.repl.toggle, { desc = "Toggle REPL" })
vim.keymap.set("n", "<leader>dL", dap.set_log_level, { desc = "Set log level" })

-- Window Movement
vim.keymap.set("n", "<leader>ss", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>sd", "<C-w>l", { desc = "Move cursor to right window" })
vim.keymap.set("n", "<leader>sa", "<C-w>h", { desc = "Move cursor to left window" })
vim.keymap.set("n", "<leader>sx", "<C-w>j", { desc = "Move cursor to window below" })
vim.keymap.set("n", "<leader>sw", "<C-w>k", { desc = "Move cursor to window above" })

vim.keymap.set("n", "<leader>sr", "<C-w>x", { desc = "Swap window with next" })
vim.keymap.set("n", "<leader>st", "<C-w>T", { desc = "Open new tab with window" })
vim.keymap.set("n", "<leader>s=", "<C-w>=", { desc = "Make all windows equal size" })
vim.keymap.set("n", "<leader>sq", ":close<cr>", { desc = "Close window" })

-- Tab Movement
vim.keymap.set("n", "<leader>kl", ":tabnew %<CR>", { desc = "Create new tab" })
vim.keymap.set("n", "<leader>kq", ":tabc<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>kk", ":tabn<CR>", { desc = "Move to next tab" })
vim.keymap.set("n", "<leader>kj", ":tabp<CR>", { desc = "Move to prev tab" })

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
vim.keymap.set("n", "<leader>tt", ":ToggleTerm <cr>", { desc = "Open terminal" })
vim.keymap.set("n", "<leader>th", ":ToggleTerm size=15 direction=horizontal<cr>", { desc = "Open horizontal terminal" })
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<cr>", { desc = "Open block terminal" }) -- full size temrinals
vim.keymap.set("n", "<leader>tp", ":ToggleTerm dir=%:p:h<cr>", { desc = "Open terminal for current buffer directory" })
vim.keymap.set("n", "<leader>td", ":ToggleTerm dir=", { desc = "Specify directory and open terminal" })

-- File Tree
vim.keymap.set("n", "<leader>yy", ":NvimTreeToggle<CR>", { noremap = true, desc = "Toggle nvim-tree" })
vim.keymap.set("n", "<leader>yf", ":NvimTreeFocus<CR>", { noremap = true, desc = "Focus nvim-tree" })
vim.keymap.set("n", "<leader>yc", ":NvimTreeCollapse<CR>", { noremap = true, desc = "Collapse nvim-tree" })
vim.keymap.set("n", "<leader>yF", ":NvimTreeFindFile<CR>", { noremap = true, desc = "Find file nvim-tree" })
