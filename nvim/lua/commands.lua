-- augroups and autocommands don't have a lua interface yet, so we must execute vimscript
local aufile = readFileToString(vim.fn.stdpath("config") ..  "/lua/commands/autocmds.vim")
local cmdfile = readFileToString(vim.fn.stdpath("config") .. "/lua/commands/commands.vim")


if vim.api.nvim_exec(aufile, true) and vim.api.nvim_exec(cmdfile, true) then return true
else return false end
