local wk = require('whichkey_setup')
vim.g.which_key_timeout = 0
vim.g.which_key_fallback_to_native_key = 1
vim.g.which_key_display_names = {['<CR>'] = '↵', ['<TAB>'] = '⇆'}
vim.g.which_key_use_floating_win = 0

Map('n', '<leader>', ':<c-u>WhichKey "<Space>"<CR>', {silent = true})

local leader_mappings = {
	d = 'delete line',
	e = {
		name = '+Open...',
		p = '`packages.lua` file',
		s = '`settings.lua` file',
		m = '`keymaps.lua` file',
	},
	p = {
		s = 'synchronize packages'
	},
	t = {
		name = '+Toggle...',
		w = 'line wrapping',
		b = 'scrollbar',
		l = 'display whitespace',
		m = {
			p = 'markdown preview'
		}
	},
	r = {
		n = 'Rename symbol'
	}
}

wk.register_keymap('leader', leader_mappings)

vim.api.nvim_exec([[
	" Hide status line when using which-key
	augroup Which-Key
		autocmd!
		autocmd! FileType which_key
		autocmd FileType which_key set laststatus=0 noshowmode | autocmd BufLeave <buffer> set laststatus=2 showmode | echo ''
	augroup END
]], true)
