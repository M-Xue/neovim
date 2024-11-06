return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.language_support.lsp.handlers")
			require("plugins.language_support.lsp.diagnostics").setup_diagnostics()
			require("plugins.language_support.lsp.lspconfig")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				unpack(require("plugins.language_support.lang.webdev.lsp_name")),
				unpack(require("plugins.language_support.lang.markdown.lsp_name")),
				require("plugins.language_support.lang.go.lsp_name"),
				require("plugins.language_support.lang.lua.lsp_name"),
			},
			automatic_installation = true,
		},
	},
	{
		"hedyhli/outline.nvim",
		event = "LspAttach",
		opts = {
			position = "right",
			width = 35,
			relative_width = false,
			symbols = {
				icon_fetcher = function(kind, bufnr)
					return require("icons.lspkind").icons[kind]
				end,
			},
			-- icons = {
			-- 	File = { hl = "Identifier" },
			-- 	Module = { hl = "Include" },
			-- 	Namespace = { hl = "Include" },
			-- 	Package = { hl = "Include" },
			-- 	Class = { hl = "Type" },
			-- 	Method = { hl = "Function" },
			-- 	Property = { hl = "Identifier" },
			-- 	Field = { hl = "Identifier" },
			-- 	Constructor = { hl = "Special" },
			-- 	Enum = { hl = "Type" },
			-- 	Interface = { hl = "Type" },
			-- 	Function = { hl = "Function" },
			-- 	Variable = { hl = "Constant" },
			-- 	Constant = { hl = "Constant" },
			-- 	String = { hl = "String" },
			-- 	Number = { hl = "Number" },
			-- 	Boolean = { hl = "Boolean" },
			-- 	Array = { hl = "Constant" },
			-- 	Object = { hl = "Type" },
			-- 	Key = { hl = "Type" },
			-- 	Null = { hl = "Type" },
			-- 	EnumMember = { hl = "Identifier" },
			-- 	Struct = { hl = "Structure" },
			-- 	Event = { hl = "Type" },
			-- 	Operator = { hl = "Identifier" },
			-- 	TypeParameter = { hl = "Identifier" },
			-- 	Component = { hl = "Function" },
			-- 	Fragment = { hl = "Constant" },
			-- 	TypeAlias = { hl = "Type" },
			-- 	Parameter = { hl = "Identifier" },
			-- 	StaticMethod = { hl = "Function" },
			-- 	Macro = { hl = "Function" },
			-- },
		},
	},
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {},
	},
	{
		"kosayoda/nvim-lightbulb",
		event = "LspAttach",
		opts = {
			autocmd = { enabled = true },
		},
	},
	require("plugins.language_support.lsp.winbar"),
}
