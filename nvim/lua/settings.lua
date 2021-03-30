--___________________________
-- GENERAL:
	Opt('o', 'title', true)	-- Enable neovim setting the terminal window's title
	Opt('o', 'clipboard', 'unnamedplus')	-- Enable yanking and killing directly to the clipboard
	Opt('o', 'lazyredraw', true)	-- Don't redraw the screen while running macros
	Opt('o', 'showtabline', 2)	-- Enable always showing the tab names
	Opt('o', 'hidden', true)	-- Enable sending buffers to the background instead of closing when opening a new buffer
	Opt('o', 'inccommand', 'nosplit')	-- Shows the result of a command as you type it
	Opt('o', 'shortmess', vim.o.shortmess .. 'c')	-- Disable completion messages from appearing
	Opt('b', 'iskeyword', vim.bo.iskeyword .. ',-')	-- Enable treating words-with-dashes as one single word
	Opt('b', 'undofile', true)	-- Enable persistent undo, even after closing the file
	Opt('o', 'wildmode', 'longest,full')	-- Set the command-line completion mode
	Opt('o', 'completeopt', 'menuone,noinsert,noselect')	-- Set the insert-mode completion options
	Opt('o', 'ruler', false) -- Disable the ruler since the scrollbar is on by default


--___________________________
-- WRAPPING:
	Opt('w', 'wrap', true)	-- Enable line wrapping
	Opt('w', 'linebreak', true)	-- Enable line breaks at whitespace instead of the middle of words

--___________________________
-- CURSOR:
	Opt('o', 'mouse', 'nv')	-- Enable moving the cursor with the mouse while on normal and visual mode
	Opt('o', 'scrolloff', 7)	-- Always keep at least 7 lines above and below the cursor


--___________________________
-- SPLITTING:
	-- Enable opening new buffers in a more sensible way
	Opt('o', 'splitright', true)
	Opt('o', 'splitbelow', true)


--___________________________
-- SEARCHING:
	Opt('o', 'hlsearch', true)	-- Enable search highlighting
	Opt('o', 'incsearch', true)	-- Show results for search matches as you type
	Opt('o', 'ignorecase', true)	-- Ignore casing while searching
	Opt('o', 'smartcase', true)	-- Overrides ignorecase if the pattern contains any upper case characters


--___________________________
-- INDENTATION:
	Opt('b', 'expandtab', false)	-- Use tabs for indentation
	Opt('b', 'smartindent', true)	-- Enable autoindenting when starting a new line
	Opt('o', 'shiftround', true)	-- Enable rounding to nearest multiple of shiftwidth when using '>>' and '<<'

	-- Set tab size to 4
	Opt('b', 'tabstop', 4)
	Opt('b', 'shiftwidth', 4)

	-- Display whitespace
	Opt('w', 'list', true)
	Opt('o', 'listchars', "tab: ")


--___________________________
-- BACKUP:
	-- Always backup while saving a file, but don't keep backup around
	Opt('o', 'writebackup', true)
	Opt('o', 'backup', false)


--___________________________
-- PROVIDERS:
-- Disable unused providers and point to correct python3 executable
	vim.g.python3_host_prog = "/usr/bin/python3"
	vim.g.loaded_python_provider = 0
	vim.g.loaded_ruby_provider = 0
	vim.g.loaded_perl_provider = 0
	vim.g.loaded_node_provider = 0


-- GUTTER:
	Opt('w', 'number', true)	-- Enable line numbers
	Opt('w', 'signcolumn', "yes")	-- Enable sign-column always on


--___________________________
-- CURSOR:
	Opt('w', 'cursorline', true)	-- Enable highlighting of the current line
	Opt('o', 'guicursor', vim.o.guicursor .. ",n-v:blinkon1") -- Enable cursor blinking on normal and visual modes


--___________________________
-- COLORS:
	Opt('o', 'background', "dark")	-- Use a dark color scheme


	if vim.fn.has("termguicolors") then -- Enable 24-Bit RGB if possible
		Opt('o', 'termguicolors', true)
	else
		Opt('o', 'termguicolors', false)
	end


--___________________________
-- SYNTAX:
	vim.cmd("filetype plugin indent on")	-- Enable filetype detection, plugin and indentation
	vim.cmd("syntax enable")	-- Enable syntax highlighting
	vim.g.vimsyn_embed = "l"	-- Enable highlighting lua code inside vimscript files

