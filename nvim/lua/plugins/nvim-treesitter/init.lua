--opt('w', 'foldmethod', 'expr')
--opt('w', 'foldexpr', 'nvim_treesitter#foldexpr()')

require('nvim-treesitter.configs').setup {
	ensure_installed = {"bash", "c", "comment", "cpp", "css", "gdscript", "html", "java", "javascript",
						"json", "jsonc", "kotlin", "lua", "python", "regex", "rust", "toml"},
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true
	}
}
