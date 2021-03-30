local is_bar_enabled = false
local function enable_bar()
	vim.api.nvim_exec([[
		augroup ScrollbarInit
			autocmd!
			autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
			autocmd WinEnter,FocusGained * silent! lua require('scrollbar').show()
			autocmd WinLeave,WinNew,FocusLost,BufWinLeave * silent! lua require('scrollbar').clear()
		augroup end
	]], true)
	is_bar_enabled = true
end

local function disable_bar()
	require('scrollbar').clear()
	vim.api.nvim_exec([[
			augroup ScrollbarInit
				autocmd!
			augroup end
		]], true)
	is_bar_enabled = false
end

function ToggleScrollbar()
	if is_bar_enabled then
		disable_bar()
	else
		enable_bar()
	end
end

Map('n', '<leader>tb', ':lua ToggleScrollbar()<CR>', {silent = true})

vim.g.scrollbar_max_size = 7
vim.g.scrollbar_excluded_filetypes = 'which_key'

enable_bar()
