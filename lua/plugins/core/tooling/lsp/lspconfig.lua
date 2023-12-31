local lsp_servers = {
	"tsserver",
	"html",
	"emmet_language_server",
	"cssls",
	"cssmodules_ls",
	"tailwindcss",
	"jsonls",
	"gopls",
	-- "postgres_lsp",
	"sqlls",
	"lua_ls",
	"marksman",
}

require("mason-lspconfig").setup({
	ensure_installed = lsp_servers,
	automatic_installation = true,
})

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lspconfig = require("lspconfig")
local on_attach = require("plugins.core.tooling.lsp.handlers").on_attach
local capabilities = require("plugins.core.tooling.lsp.handlers").capabilities

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
})

-- lspconfig.eslint.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
-- })

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
		"postcss.config.js",
		"postcss.config.cjs",
		"postcss.config.mjs",
		"postcss.config.ts",
		"package.json",
		"node_modules",
		".git"
	),
})

lspconfig.jsonls.setup({
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
			usePlaceholders = true,
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

-- lspconfig.golangci_lint_ls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
-- })

-- lspconfig.postgres_lsp.setup({
lspconfig.sqlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
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

-- lspconfig.vale_ls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
lspconfig.marksman.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
