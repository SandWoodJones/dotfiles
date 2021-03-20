function EditPlugins()
	require('plugins')
	vim.cmd('edit ' .. vim.fn.stdpath('config') .. '/lua/plugins.lua')
end
