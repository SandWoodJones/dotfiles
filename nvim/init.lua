require('utils')

require('settings')
require('functions')
require('keymaps')

assert(LoadVimscript(), "Error loading vimscript files")

require('packages')

-- Always recompile the packages.lua file after editing it
vim.api.nvim_exec([[
	augroup packercompile
		autocmd!
		autocmd BufWritePost packages.lua PackerCompile
	augroup END
]], true)

-- Add Packer's compile path to runtime and execute it if it exists
vim.cmd('let &runtimepath.=",' .. vim.fn.stdpath('data') .. '"')
vim.cmd('runtime packer_compiled.vim')

