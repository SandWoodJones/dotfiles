local wk = require("which-key")

wk.setup {
	layout = {
		spacing = 4
	},
	triggers = {"<leader>"}
}

wk.register({
	d = 'kill line to null register',
	e = {
		name = '+Edit...',
		p = '`packages.lua` file',
		s = '`settings.lua` file',
		m = '`keymaps.lua` file',
	},
	p = {
		name = '+Packages...',
		s = 'synchronize'
	},
	t = {
		name = '+Toggle...',
		w = 'line wrapping',
		b = 'scrollbar',
		l = 'display whitespace',
	},
	r = {
		n = 'Rename symbol'
	}
}, { prefix = "<leader>"})
