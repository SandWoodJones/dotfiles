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

-- LSP
use {'neovim/nvim-lspconfig', config = function() require('plugins/lsp-config/init') end}
use 'alexaandru/nvim-lspupdate' -- Auto installs and updates language servers

-- Snippets
use {'norcalli/snippets.nvim', config = function() require('plugins/snippets_nvim/init') end}

-- Completion
use {'nvim-lua/completion-nvim', config = function() require('plugins/completion-nvim/init') end}

return packer
