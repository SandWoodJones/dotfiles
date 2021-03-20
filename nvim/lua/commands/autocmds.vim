" Enable relative line numbers on normal mode, disable it on insert mode
augroup numbertoggle 
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Text briefly blinks after yanking it
augroup highlightyank
	autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank {timeout=50}
augroup END

" Always load Packer and recompile the plugins.lua file when editing it
augroup packercompile
	autocmd!
	autocmd BufReadPre plugins.lua lua require('plugins')
	autocmd BufWritePost plugins.lua PackerCompile
augroup END

