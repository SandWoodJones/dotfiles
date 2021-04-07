local lsp_installer = require('lspinstall')
local lsp_config = require('lspconfig')


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

local server_configs = {lua = lua_settings, efm = efm_settings}


-- Install missing servers:
local required_servers = {"efm", "rust", "python", "vim", "bash", "lua"}
for _,server in pairs(required_servers) do
	if not vim.tbl_contains(lsp_installer.installed_servers(), server) then
		lsp_installer.install_server(server)
	end
end

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings
	BMap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', {silent = true})

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

-- LSP Install
local function setup_servers()
	lsp_installer.setup()

	local servers = lsp_installer.installed_servers()
	table.insert(servers, "kotlin_language_server")

	for _,server in pairs(servers) do
		local config = make_config()

		-- load language specific settings
		if server_configs[server] ~= nil then
			config = vim.tbl_extend('force', config, server_configs[server])
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
