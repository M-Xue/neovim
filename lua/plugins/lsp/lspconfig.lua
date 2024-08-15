local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local wk = require("which-key")
local on_attach = function(client, bufnr)
	local opts = {
		buffer = bufnr,
	}
	local mappings = {
		-- ["<leader>"] = {
		-- 	e = { name = "Diagnostics" },
		-- 	g = { name = "LSP" },
		-- },
	}
	-- wk.register(mappings, opts)

	require("plugins.lsp.lsp").init_lsp_keymaps(bufnr)
	require("plugins.lsp.diagnostics").init_diagnostics_keymaps(bufnr)
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

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
})

local go_keymaps = require("plugins.lang.go.keymaps")
lspconfig.gopls.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		go_keymaps(bufnr)
	end,
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

-- lspconfig.vale_ls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
