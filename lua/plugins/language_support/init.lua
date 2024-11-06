return {
	require("plugins.language_support.mason"),
	require("plugins.language_support.lsp"),
	require("plugins.language_support.linter").plugins,
	require("plugins.language_support.formatter"),
}
