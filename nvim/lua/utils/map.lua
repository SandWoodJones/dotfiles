function map(mode, lhs, rhs, opts)
	local options = { noremap = true } -- noremap is on by default
	if opts then -- if the opts argument is present
		options = vim.tbl_extend('force', options, opts) -- merges options and opts together overriding from opts
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
