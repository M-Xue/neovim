vim.keymap.set("n", "<leader>pm", ":Mason<Enter>", { noremap = true, desc = "Open Mason" })

-- * GOES IN HANDLERS FOR LSP
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- First argument is client
M.on_attach = function(client, bufnr)
	-- Autoformatting on save
	if client.supports_method("textDocument/formatting") then
		-- vim.keymap.set("n", "<leader>w", ":Format<CR>:w<CR>", { desc = "Save file" })
		-- vim.api.nvim_clear_autocmds({
		-- 	group = augroup,
		-- 	buffer = bufnr,
		-- })
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	group = augroup,
		-- 	buffer = bufnr,
		-- 	callback = function()
		-- 		vim.cmd("Format")
		-- 		-- vim.lsp.buf.format({ bufnr = bufnr })
		-- 		-- Need to call :Format not the lsp function
		-- 	end,
		-- })
	end
	lsp_diagnostic_keymaps(bufnr)
end

local opts = {}
for _, server in pairs(lsp_servers) do
	opts = {
		on_attach = require("plugins.core.tooling.lsp.handlers").on_attach,
		capabilities = require("plugins.core.tooling.lsp.handlers").capabilities,
	}

	local config_opts = require("plugins.core.tooling.lsp.settings." .. server)
	opts = vim.tbl_deep_extend("force", config_opts, opts)

	lspconfig[server].setup(opts)
end

-- Pretty good article: https://levelup.gitconnected.com/a-step-by-step-guide-to-configuring-lsp-in-neovim-for-coding-in-next-js-a052f500da2#5f44
-- Good article: https://dev.to/craftzdog/my-neovim-setup-for-react-typescript-tailwind-css-etc-58fb
-- Good reop: https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/plugin/lspconfig.lua
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "javascript", "javascriptreact", "javascript.tsx", "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	root_dir = function()
		return vim.loop.cwd()
	end, -- https://levelup.gitconnected.com/a-step-by-step-guide-to-configuring-lsp-in-neovim-for-coding-in-next-js-a052f500da2#5f44: lets LSP attach to any javascript file
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- TODO:
-- DAP
-- null-fs
-- -- formatting (for prisma too) and prettier
-- treesitter
-- terminal
-- buffer line
-- change bindings for cmp
-- gitsigns
-- wrap the telescope git searches in a error catcher and if the current directory is not a git repo, catch the error and print another message

-- TODO search :h lsp to check what other stuff they have and to read documentation `

-- Some CMP Stuff
-- https://www.youtube.com/watch?v=GuIcGxYqaQQ&t=730s
-- https://www.youtube.com/watch?v=JyDe4Zzesx0
-- https://www.youtube.com/watch?v=h4g0m0Iwmys
-- https://www.youtube.com/watch?v=_DnmphIwnjo&t=1406s

-- Some more stuff to look into
-- https://www.youtube.com/watch?v=stqUbv-5u2s
-- https://levelup.gitconnected.com/set-up-a-next-js-application-workflow-using-neovim-typescript-tailwind-23621a34ed38
-- https://dev.to/craftzdog/my-neovim-setup-for-react-typescript-tailwind-css-etc-58fb
-- https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/plugin/lspconfig.lua
-- https://elijahmanor.com/blog/neovim-tailwindcss
-- https://medium.com/@s1n7ax/neovim-for-typescript-react-development-fdc7082c8a78
-- https://www.youtube.com/watch?v=_NiWhZeR-MY
-- https://www.youtube.com/watch?v=mQdB_kHyZn8&t=10s
-- https://levelup.gitconnected.com/a-step-by-step-guide-to-configuring-lsp-in-neovim-for-coding-in-next-js-a052f500da2#0915

-- Yabai
-- https://github.com/koekeishiya/yabai
-- https://www.youtube.com/watch?v=k94qImbFKWE
--
-- https://github.com/zaxutic/dotfiles/blob/master/.config/nvim/lua/lsp.lua
