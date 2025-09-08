local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

local wk = require("which-key")
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
	wk.add({
		{ "<leader>e", group = "Diagnostics" },
		{ "<leader>g", group = "LSP" },
	})
	require("plugins.lsp.keymaps").init_lsp_keymaps(bufnr)
	require("plugins.lsp.keymaps").init_diagnostics_keymaps(bufnr)

	if client.supports_method("textDocument/documentSymbol") then
		navic.attach(client, bufnr)
	end
end

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
})

lspconfig.emmet_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
})

lspconfig.cssmodules_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern(
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.mjs",
		"tailwind.config.ts",
		"package.json",
		".git"
	),
})

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
})

lspconfig.astro.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
})

lspconfig.svelte.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
})

lspconfig.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,

	-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
	settings = {
		gopls = {
			usePlaceholders = false,
			analyses = {
				unusedvariable = true,
				unusedparams = true,
				nilness = true,
			},
			staticcheck = true, -- https://staticcheck.dev/docs/checks/
		},
	},

	root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
})

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

lspconfig.marksman.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern(".git"),
})

lspconfig.mdx_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern(".git"),
})

vim.lsp.enable('pyright')
