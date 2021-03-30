-- Read the contents of a file and store them in a string in memory
function ReadFileToString(file)
	local f = assert(io.open(file, "rb"))
	local content = f:read("*all")
	f:close()
	return content
end

-- Wrapper function for setting vim options
function Opt(scope, key, value)
	local scopes = { o = vim.o, b = vim.bo, w = vim.wo }
	scopes[scope][key] = value
	if scope ~= 'o' then -- If the scope isn't global
		scopes['o'][key] = value -- We update the key in the global scope afterwards
	end
end

-- Wrapper functions for setting vim keymaps globally and local to buffer
function Map(mode, lhs, rhs, opts)
	local options = { noremap = true } -- noremap on by default
	if opts then -- if the opts argument is present
		options = vim.tbl_extend('force', options, opts) -- merges options and opts together overriding from opts
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
function BMap(bufnr, mode, lhs, rhs, opts)
	local options = { noremap = true } -- noremap on by default
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
end

function PluginConfig(plugin)
	require('plugins/' .. plugin)
end

function LoadVimscript()
	local aufile = ReadFileToString(vim.fn.stdpath("config") ..  "/lua/vimscript/autocmds.vim")
	local cmdfile = ReadFileToString(vim.fn.stdpath("config") .. "/lua/vimscript/commands.vim")

	if vim.api.nvim_exec(aufile, true) and vim.api.nvim_exec(cmdfile, true) then
		return true
	else
		return false
	end
end
