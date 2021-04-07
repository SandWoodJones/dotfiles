
-- LEADER:
	Map('n', '<Space>', '<NOP>')	-- Disable spacebar moving to next character
	vim.g.mapleader = ' '	-- Map leader to spacebar


--___________________________
-- MOVING_AROUND:

	-- Move up and down by row and not by line. makes it easier to navigate with wrapping on
	Map('n', 'k', 'gk')
	Map('n', 'j', 'gj')

	-- Enable holding ctrl to move between windows
	Map('n', '<c-h>', '<c-w>h')
	Map('n', '<c-j>', '<c-w>j')
	Map('n', '<c-k>', '<c-w>k')
	Map('n', '<c-l>', '<c-w>l')

	-- Use tab on normal mode to switch the buffer
	Map('n', '<TAB>', ':bnext<CR>', {silent = true })
	Map('n', '<S-TAB>', ':bprevious<CR>', {silent = true})


--___________________________
-- EDITING:
	Map('n', '<leader>d', '"_dd')	-- Kill a line without storing it in the register
	Map('n', 'x', '"_x')	-- Delete characters without storing them in the register


--___________________________
-- AUTO-COMPLETION:

	-- Use <Tab> and <S-Tab> to navigate
	Map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', {expr = true})
	Map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true})

	-- Use <C-Space> to open and close the completion menu
	Map('i', '<C-Space>', 'pumvisible() ? "<C-e>" : "<Plug>(completion_trigger)"', {expr = true, noremap = false})


--___________________________
-- FILES:
	Map('n', '<Leader>ep', ':EditPackages<CR>')	-- Edit the package manager file
	Map('n', '<Leader>es', ':EditSettings<CR>')	-- Edit the settings file
	Map('n', '<Leader>em', ':EditKeymaps<CR>')	-- Edit the keymaps file


--___________________________
-- PACKAGES:
	Map('n', '<Leader>ps', ':PackerSync<CR>') -- Sync packages


--___________________________
-- APPEARANCE:
	Map('n', '<Esc><Esc>', ':nohls<CR>', {silent = true}) -- Quickly clear search highlights
	Map('n', '<Leader>tw', ':set wrap!<CR>', {silent = true})	-- Toggle line-wrapping
	Map('n', '<Leader>tl', ':set list!<CR>', {silent = true})	-- Toggle displaying whitespace
