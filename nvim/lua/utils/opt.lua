local scopes = { o = vim.o, b = vim.bo, w = vim.wo }

-- Wrapper function for setting vim options
function opt(scope, key, value)
	scopes[scope][key] = value
	if scope ~= 'o' then -- If the scope isn't global
		scopes['o'][key] = value -- We update the key in the global scope afterwards
	end
end
