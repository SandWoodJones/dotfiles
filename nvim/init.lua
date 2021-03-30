require('utils')

require('settings')
require('functions')
require('keymaps')

require('packages')
-- Add Packer's compile path to runtime and execute it if it exists
vim.cmd('let &runtimepath.=",' .. vim.fn.stdpath('data') .. '"')
vim.cmd('runtime packer_compiled.vim')

assert(LoadVimscript(), "Error loading vimscript files")
