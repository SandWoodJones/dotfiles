
-- LEADER:
	map('n', '<Space>', '<NOP>')	-- Disable spacebar moving to next character
	vim.g.mapleader = ' '	-- Map leader to spacebar


--___________________________
-- MOVING AROUND:

	-- Move up and down by row and not by line. makes it easier to navigate with wrapping on
	map('n', 'k', 'gk')
	map('n', 'j', 'gj')

	-- Enable holding ctrl to move between windows
	map('n', '<c-h>', '<c-w>h')
	map('n', '<c-j>', '<c-w>j')
	map('n', '<c-k>', '<c-w>k')
	map('n', '<c-l>', '<c-w>l')

	-- Use tab on normal mode to switch the buffer
	map('n', '<TAB>', ':bnext<CR>', {silent = true })
	map('n', '<S-TAB>', ':bprevious<CR>', {silent = true})


--___________________________
-- EDITING:

	-- Kill a line without storing it in the register
	map('n', '<leader>d', '"_dd')

	-- Delete characters without storing them in the register
	map('n', 'x', '"_x')


--___________________________
-- AUTO-COMPLETION:

	-- Use <Tab> and <S-Tab> to navigate
	map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', {expr = true})
	map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true})

	-- Use <C-Space> to open and close the completion menu
	map('i', '<C-Space>', 'pumvisible() ? "<C-e>" : "<Plug>(completion_trigger)"', {expr = true, noremap = false})

--___________________________
-- FILES:

	-- Edit the plugins file
	map('n', '<Leader>ep', ':EditPlugins<CR>')

