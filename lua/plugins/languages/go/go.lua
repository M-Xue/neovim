local go = require("go")

go.setup({
	goimport = "gopls", -- if set to 'gopls' will use gopls format, also goimport
	fillstruct = "gopls",
	gofmt = "gofumpt", -- if set to gopls will use gopls format
	max_line_len = 120,
	tag_transform = false,
	test_dir = "",
	comment_placeholder = "   ",
	icons = { breakpoint = "🧘", currentpos = "🏃" }, -- set to false to disable
	-- this option
	verbose = false,
	log_path = vim.fn.expand("$HOME") .. "/tmp/gonvim.log",
	lsp_cfg = false, -- false: do nothing
	-- true: apply non-default gopls setup defined in go/lsp.lua
	-- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
	lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
	lsp_on_attach = nil, -- nil: do nothing
	-- if lsp_on_attach is a function: use this function as on_attach function for gopls,
	-- when lsp_cfg is true
	lsp_keymaps = false, -- true: apply default lsp keymaps
	lsp_codelens = true,
	-- diagnostic = { -- set diagnostic to false to disable vim.diagnostic setup
	-- 	-- in go.nvim
	-- 	hdlr = false, -- hook lsp diag handler and send diag to quickfix
	-- 	underline = true,
	-- 	-- virtual text setup
	-- 	virtual_text = { spacing = 0, prefix = "■" },
	-- 	signs = true,
	-- 	update_in_insert = false,
	-- },
	diagnostic = false,
	lsp_inlay_hints = {
		enable = false,

		-- Only show inlay hints for the current line
		only_current_line = false,

		-- Event which triggers a refersh of the inlay hints.
		-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
		-- not that this may cause higher CPU usage.
		-- This option is only respected when only_current_line and
		-- autoSetHints both are true.
		only_current_line_autocmd = "CursorHold",

		-- whether to show variable name before type hints with the inlay hints or not
		-- default: false
		show_variable_name = true,

		-- prefix for parameter hints
		parameter_hints_prefix = "󰊕 ",
		show_parameter_hints = true,

		-- prefix for all the other hints (type, chaining)
		other_hints_prefix = "=> ",

		-- whether to align to the lenght of the longest line in the file
		max_len_align = false,

		-- padding from the left if max_len_align is true
		max_len_align_padding = 1,

		-- whether to align to the extreme right or not
		right_align = false,

		-- padding from the right if right_align is true
		right_align_padding = 6,

		-- The color of the hints
		highlight = "Comment",
	},
	gopls_remote_auto = false,
	gocoverage_sign = "█",
	sign_priority = 7,
	dap_debug = false,
	dap_debug_gui = false,
	dap_debug_keymap = false, -- true: use keymap for debugger defined in go/dap.lua
	-- false: do not use keymap in go/dap.lua.  you must define your own.
	-- windows: use visual studio style of keymap
	dap_vt = false, -- false, true and 'all frames'
	textobjects = true,
	gopls_cmd = nil, --- you can provide gopls path and cmd if it not in PATH, e.g. cmd = {  "/home/ray/.local/nvim/data/lspinstall/go/gopls" }
	build_tags = "", --- you can provide extra build tags for tests or debugger
	test_runner = "go", -- one of {`go`, `richgo`, `dlv`, `ginkgo`}
	run_in_floaterm = false, -- set to true to run in float window.
	luasnip = false, -- set true to enable included luasnip
	iferr_vertical_shift = 4, -- defines where the cursor will end up vertically from the begining of if err statement after GoIfErr command
})

