function EditPackages()
	vim.cmd('edit ' .. vim.fn.stdpath('config') .. '/lua/packages.lua')
end

function EditSettings()
	vim.cmd('edit ' .. vim.fn.stdpath('config') .. '/lua/settings.lua')
end

function EditKeymaps()
	vim.cmd('edit ' .. vim.fn.stdpath('config') .. '/lua/keymaps.lua')
end
