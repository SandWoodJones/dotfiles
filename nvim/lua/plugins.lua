-- Install Packer if it is not found
local packer_install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
	vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_install_path)
end

local packer = require('packer')
local use = packer.use
packer.init({
	compile_path = _G.PackerCompilePath .. '/packer_compiled.vim'
})
packer.reset()

use 'wbthomason/packer.nvim' -- Let Packer manage itself

use {'norcalli/snippets.nvim', config = function() require('plugins/snippets_nvim/init') end} -- Snippets

-- LSP
use {'neovim/nvim-lspconfig', requires = 'norcalli/snippets.nvim', config = function() require('plugins/lsp-config/init') end}
use {'kabouzeid/nvim-lspinstall', requires = 'neovim/nvim-lspconfig'} -- Auto installs and updates language servers
use {'onsails/lspkind-nvim', requires = 'neovim/nvim-lspconfig', config = function() require('lspkind').init() end} -- Icons for completion items

-- Completion
use {'nvim-lua/completion-nvim', config = function() require('plugins/completion-nvim/init') end, requires = {'neovim/nvim-lspconfig', 'norcalli/snippets.nvim'}}

-- Tree Sitter
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('plugins/nvim-treesitter/init') end}
use {'p00f/nvim-ts-rainbow', requires = 'nvim-treesitter/nvim-treesitter', config = function() require('plugins/nvim-ts-rainbow/init') end} -- Rainbow brackets
use {'romgrk/nvim-treesitter-context', requires = 'nvim-treesitter/nvim-treesitter'} -- Always shows the context the cursor is currently in


use {'norcalli/nvim-colorizer.lua', config = function() require('plugins/nvim-colorizer/init') end} -- Color highlighter

use 'jiangmiao/auto-pairs'

use {'justinj/vim-pico8-syntax', ft = 'pico8'}

return packer
