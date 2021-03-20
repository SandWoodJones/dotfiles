-- GUTTER:
	opt('w', 'number', true)	-- Enable line numbers
	opt('w', 'signcolumn', "yes")	-- Enable sign-column always on


--___________________________
-- CURSOR:
	opt('w', 'cursorline', true)	-- Enable highlighting of the current line
	opt('o', 'guicursor', vim.o.guicursor .. ",n-v:blinkon1") -- Enable cursor blinking on normal and visual modes


--___________________________
-- COLORS:
	opt('o', 'background', "dark")	-- Use a dark color scheme


	if vim.fn.has("termguicolors") then -- Enable 24-Bit RGB if possible
		opt('o', 'termguicolors', true)
	else
		opt('o', 'termguicolors', false)
	end


--___________________________
-- SYNTAX:
	vim.cmd("filetype plugin indent on")	-- Enable filetype detection, plugin and indentation
	vim.cmd("syntax enable")	-- Enable syntax highlighting
	vim.g.vimsyn_embed = "l"	-- Enable highlighting lua code inside vimscript files
