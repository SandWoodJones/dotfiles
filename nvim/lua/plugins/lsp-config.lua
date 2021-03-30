local lsp_installer = require('lspinstall')
local lsp_config = require('lspconfig')

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings
	--BMap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', {silent = true})
	--BMap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {silent = true})
	--BMap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', {silent = true})
	--BMap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', {silent = true})
	--BMap(bufnr, 'n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', {silent = true})
	--BMap(bufnr, 'n', '<leader>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', {silent = true})
	--BMap(bufnr, 'n', '<leader>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', {silent = true})
	--BMap(bufnr, 'n', '<leader>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', {silent = true})
	--BMap(bufnr, 'n', '<leader>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', {silent = true})
	BMap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', {silent = true})
	--BMap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', {silent = true})
	--BMap(bufnr, 'n', '<leader>sd', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {silent = true})
	--BMap(bufnr, 'n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {silent = true})
	--BMap(bufnr, 'n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {silent = true})
	--BMap(bufnr, 'n', '<leader>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', {silent = true})

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		--BMap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {silent = true})
	elseif client.resolved_capabilities.document_range_formatting then
		--BMap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', {silent = true})
	end

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec([[
			augroup lsp_document_highlight
			autocmd! * <buffer>
			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]], false)
	end
end

-- Activates keymaps and enables snippet support
local function make_config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return {
		capabilities = capabilities,
		on_attach = on_attach
	}
end


-- Sumneko Lua settings
local lua_settings = {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';')
			},

			diagnostics = {
				-- Make the server recognize the `vim` global
				globals = {'vim'}
			},

			workspace = {
				library = {
					-- Make the server aware of Neovim's runtime files
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				}
			}
		}
	}
}

local efm_settings = {
	init_options = {documentFormatting = true},
	filetypes = {"lua"},
	settings = {
		rootMarkers = {".git/"},
		languages = {
			lua = {{
				formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
				formatStdin = true
			}}
		}
	}
}


-- LSP Install
local function setup_servers()
	lsp_installer.setup()

	local servers = lsp_installer.installed_servers()
	table.insert(servers, "kotlin_language_server")

	for _,server in pairs(servers) do
		local config = make_config()

		-- language specific settings
		if server == 'lua' then
			config = vim.tbl_extend('force', config, lua_settings)
		elseif server == 'efm' then
			config = vim.tbl_extend('force', config, efm_settings)
		end

		lsp_config[server].setup(config)
	end
end

setup_servers()

-- Automatically reload after LspInstall
lsp_installer.post_install_hook = function()
	setup_servers() -- Reload installed servers
	vim.cmd("bufdo e") -- Starts the server
end
