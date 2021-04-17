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

" Markdown tab sizes differ from the renderer, using spaces to keep it constant
augroup markdowntabexpand
	autocmd!
	autocmd BufEnter *.md silent! setlocal expandtab
augroup END
