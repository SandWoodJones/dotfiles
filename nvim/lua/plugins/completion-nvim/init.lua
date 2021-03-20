vim.g.completion_enable_auto_popup = 1

vim.api.nvim_exec([[
	" Enable the autocompletion plugin
	augroup autocomplete
		autocmd!
		autocmd BufEnter * lua require'completion'.on_attach()
	augroup END
]], true)

