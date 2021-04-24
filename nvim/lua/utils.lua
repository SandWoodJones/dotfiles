-- Check if a file or directory exists in this path. Take from https://stackoverflow.com/a/40195356/9353072
function Exists(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

-- Read the contents of a file and store them in a string in memory
function ReadFileToString(file)
	if Exists(file) then
		local f = assert(io.open(file, "rb"))
		local content = f:read("*all")
		f:close()
		return content
	end
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
	if vim.fn.isdirectory(vim.fn.stdpath('config') .. '/lua/plugins/' .. plugin) == 1 then
		require('plugins/' .. plugin .. '/' .. plugin)
	else
		require('plugins/' .. plugin)
	end
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
