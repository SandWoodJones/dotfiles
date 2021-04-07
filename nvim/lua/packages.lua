-- Install Packer if it is not found
local packer_install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
	vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_install_path)
end

local packer = require('packer')
local use = packer.use
packer.init({
	compile_path = vim.fn.stdpath('data') .. '/packer_compiled.vim'
})
packer.reset()

use 'wbthomason/packer.nvim' -- Let Packer manage itself

use {'norcalli/snippets.nvim', config = PluginConfig('snippets-nvim')} -- Snippets

-- LSP
use {'neovim/nvim-lspconfig', config = PluginConfig('lsp-config')}
use 'kabouzeid/nvim-lspinstall' -- Auto installs and updates language servers
use {'onsails/lspkind-nvim', config = function() require('lspkind').init() end} -- Icons for completion items

-- Completion
use {'nvim-lua/completion-nvim', config = PluginConfig('completion-nvim')}

-- Tree Sitter
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = PluginConfig('nvim-treesitter')}
use {'p00f/nvim-ts-rainbow', config = PluginConfig('nvim-ts-rainbow')} -- Rainbow brackets
--use 'romgrk/nvim-treesitter-context' -- Always shows the context the cursor is currently in

use {'norcalli/nvim-colorizer.lua', config = PluginConfig('nvim-colorizer')} -- Color highlighter

use 'jiangmiao/auto-pairs' -- TODO: change this to another plugin. auto-pairs is outdated

use 'psliwka/vim-smoothie' -- Smooth scrolling

use {'justinj/vim-pico8-syntax', ft = 'pico8'}

use {'unblevable/quick-scope', config = PluginConfig('quick-scope')} -- Highlights characters for easier moving use with 'f' or 't'

use {'AckslD/nvim-whichkey-setup.lua', requires = 'liuchengxu/vim-which-key', config = PluginConfig('which-key')} -- Displays available keybindings


return packer
