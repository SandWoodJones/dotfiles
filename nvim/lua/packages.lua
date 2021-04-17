-- Install Packer if it is not found
local packer_install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_install_path})
end

local packer = require('packer')
local use = packer.use
packer.init({
	compile_path = vim.fn.stdpath('data') .. '/packer_compiled.vim'
})
packer.reset()

use 'wbthomason/packer.nvim' -- Let Packer manage itself

use { -- Snippets
	'norcalli/snippets.nvim',
	config = function() PluginConfig('snippets-nvim') end
}

-- LSP
use {
	'neovim/nvim-lspconfig',
	config = function() PluginConfig('lsp-config') end
}
use 'kabouzeid/nvim-lspinstall' -- Auto installs and updates language servers
use { -- Icons for completion items
	'onsails/lspkind-nvim',
	config = function() require('lspkind').init() end
}

-- Completion
use {
	'nvim-lua/completion-nvim',
	config = function() PluginConfig('completion-nvim') end
}

-- Tree Sitter
use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	config = function() PluginConfig('nvim-treesitter') end
}
use {  -- Rainbow brackets
	'p00f/nvim-ts-rainbow',
	config = function() PluginConfig('nvim-ts-rainbow') end
}
use 'romgrk/nvim-treesitter-context' -- Always shows the context the cursor is currently in

use { -- Color highlighter
	'norcalli/nvim-colorizer.lua',
	config = function () PluginConfig('nvim-colorizer') end
}

use 'jiangmiao/auto-pairs' -- TODO: change this to another plugin. auto-pairs is outdated

use 'psliwka/vim-smoothie' -- Smooth scrolling

use {
	'justinj/vim-pico8-syntax',
	ft = 'pico8'
}

use { -- TODO: change markdown preview plugin to something that is compatible with github markdown.
	'iamcco/markdown-preview.nvim',
	run = 'cd app && yarn install',
	config = function() PluginConfig('markdown-preview') end,
	ft = 'markdown'
}

use { -- Highlights characters for easier moving use with 'f' or 't'
	'unblevable/quick-scope',
	config = function() PluginConfig('quick-scope') end
}

use { -- Displays available leader keybindings
	'AckslD/nvim-whichkey-setup.lua',
	requires = 'liuchengxu/vim-which-key',
	config = function() PluginConfig('which-key') end
}


return packer
