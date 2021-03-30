--Opt('w', 'foldmethod', 'expr')
--Opt('w', 'foldexpr', 'nvim_treesitter#foldexpr()')

require('nvim-treesitter.configs').setup {
	ensure_installed = {"bash", "c", "comment", "cpp", "gdscript", "go", "html", "json", "jsonc", "kotlin",
						"lua", "regex", "rust", "toml"},
	highlight = {
		enable = true
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		}
	},
	indent = {
		enable = true
	},
	rainbow = {
		enable = true
	}
}
