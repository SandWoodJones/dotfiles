---@diagnostic disable-next-line: undefined-global
require('utils')

require('settings')
require('functions')
require('keymaps')

-- Add Packer's compile path to runtime and execute it if it exists
PackerCompilePath = vim.fn.stdpath('data')
vim.cmd('let &runtimepath.=",' .. PackerCompilePath .. '"')
vim.cmd('runtime packer_compiled.vim')

assert(require('commands'), "Error executing commands")
