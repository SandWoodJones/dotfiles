require('compe').setup {
	enabled = true,
	autocomplete = true,
	preselect = false,

	source = {
		path = true,
		vsnip = true,
		nvim_lsp = true,
	}
}

vim.fn['lexima#set_default_rules']()
-- Use <C-Space> to toggle the completion menu
Map('i', '<C-Space>', 'pumvisible() ? compe#close("<C-Space") : compe#complete()', {expr = true, silent = true})
Map('i', '<CR>', 'compe#confirm("<CR>")', {expr = true, silent = true})

local check_back_space = function()
	local col = vim.fn.col('.') - 1
	if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
		return true
	else
		return false
	end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
		return vim.api.nvim_replace_termcodes("<C-n>", true, true, true)
	elseif vim.fn.call("vsnip#available", {1}) == 1 then
		return vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true)
	elseif check_back_space() then
		return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
	else
		return vim.fn['compe#complete']()
	end
end

_G.s_tab_complete = function() -- Shift-Tab
	if vim.fn.pumvisible() == 1 then
		return vim.api.nvim_replace_termcodes("<C-p>", true, true, true)
	elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
		return vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true)
	else
		return vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true)
	end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

