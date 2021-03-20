local lsp = require('lspconfig')

local sumneko_root_path = '/home/swjones/documents/app_files/lua-language-server'
lsp.sumneko_lua.setup {
	cmd = {sumneko_root_path .. '/bin/Linux/lua-language-server', '-E', sumneko_root_path .. '/main.lua'};
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},

			diagnostics = {
				-- Make the server recognize the `vim` global
				globals = {'vim'},
			},

			workspace = {
				library = {
					-- Make the server aware of Neovim's runtime files
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		},
	},
}

lsp.rust_analyzer.setup {}
