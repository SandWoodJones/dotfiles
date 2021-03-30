local plugin = require('snippets')
plugin.snippets = {
	_global = {}
}

plugin.use_suggested_mappings()
vim.g.completion_enable_snippet = 'snippets.nvim' -- Enable snippets.nvim as the default snippet provider

