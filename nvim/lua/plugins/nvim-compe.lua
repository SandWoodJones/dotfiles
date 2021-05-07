require('compe').setup {
	enabled = true,
	autocomplete = true,
	preselect = false,

	source = {
		path = {kind = "   (Path)"},
		buffer = {kind = "   (Buffer)"},
		calc = {kind = "   (Calc)"},
		vsnip = {kind = "   (Snippet)"},
		nvim_lsp = {kind = "   (LSP)"},
	}
}

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

local rt = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
		return rt "<C-n>"
	elseif vim.fn.call("vsnip#available", {1}) == 1 then
		return rt "<Plug>(vsnip-expand-or-jump)"
	elseif check_back_space() then
		return rt "<Tab>"
	else
		return vim.fn['compe#complete']()
	end
end

_G.s_tab_complete = function() -- Shift-Tab
	if vim.fn.pumvisible() == 1 then
		return rt "<C-p>"
	elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
		return rt "<Plug>(vsnip-jump-prev)"
	else
		return rt "<S-Tab>"
	end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

