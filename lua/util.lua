local M = {}

M.print_attached_clients = function()
	local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
	if #buf_clients == 0 then
		vim.print("LSP Inactive")
		return
	end

	local buf_ft = vim.bo.filetype
	local buf_client_names = {}

	-- add client
	for _, client in pairs(buf_clients) do
		table.insert(buf_client_names, client.name)
	end

	-- Add linters (from nvim-lint)
	local lint_s, lint = pcall(require, "lint")
	if lint_s then
		for ft_k, ft_v in pairs(lint.linters_by_ft) do
			if type(ft_v) == "table" then
				for _, linter in ipairs(ft_v) do
					if buf_ft == ft_k then
						table.insert(buf_client_names, linter)
					end
				end
			elseif type(ft_v) == "string" then
				if buf_ft == ft_k then
					table.insert(buf_client_names, ft_v)
				end
			end
		end
	end

	-- Add formatters (from conform.nvim)
	local conform_s, conform = pcall(require, "conform")
	if conform_s then
		for _, formatter in ipairs(conform.list_formatters(0)) do
			if formatter then
				table.insert(buf_client_names, formatter.name)
			end
		end
	end

	-- This needs to be a string only table so we can use concat below
	local unique_client_names = {}
	for _, client_name_target in ipairs(buf_client_names) do
		local is_duplicate = false
		for _, client_name_compare in ipairs(unique_client_names) do
			if client_name_target == client_name_compare then
				is_duplicate = true
			end
		end
		if not is_duplicate then
			table.insert(unique_client_names, client_name_target)
		end
	end

	local client_names_str = table.concat(unique_client_names, ", ")
	local language_servers = string.format("[%s]", client_names_str)

	vim.print(language_servers)
end

M.set_colorscheme = function(colorscheme)
	vim.cmd.colorscheme(colorscheme)
	local file = io.open(os.getenv("HOME") .. "/.config/nvim/colorscheme.txt", "w+")
	if file ~= nil then
		file:write(colorscheme)
		file:close()
	end
end

M.init_colorscheme = function()
	local file = io.open(os.getenv("HOME") .. "/.config/nvim/colorscheme.txt", "r")

	if file ~= nil then
		local content = file:read("*all")
		file:close()
		if content ~= "" then
			vim.cmd.colorscheme(content)
		else
			vim.cmd.colorscheme("catppuccin-macchiato")
		end
	else
		M.set_colorscheme("catppuccin-macchiato")
	end
end

return M
