-- GENERAL SETTINGS:
	opt('o', 'title', true)	-- Enable neovim setting the terminal window's title
	opt('o', 'clipboard', 'unnamedplus')	-- Enable yanking and killing directly to the clipboard
	opt('o', 'lazyredraw', true)	-- Don't redraw the screen while running macros
	opt('o', 'showtabline', 2)	-- Enable always showing the tab names
	opt('o', 'hidden', true)	-- Enable sending buffers to the background instead of closing when opening a new buffer
	opt('o', 'inccommand', 'nosplit')	-- Shows the result of a command as you type it
	opt('o', 'shortmess', vim.o.shortmess .. 'c')	-- Disable completion messages from appearing
	opt('b', 'iskeyword', vim.bo.iskeyword .. ',-')	-- Enable treating words-with-dashes as one single word
	opt('b', 'undofile', true)	-- Enable persistent undo, even after closing the file
	opt('o', 'wildmode', 'longest,full')	-- Set the command-line completion mode
	opt('o', 'completeopt', 'menuone,noinsert,noselect')	-- Set the insert-mode completion options
	--opt('o', 'shell', '/usr/bin/env sh')	-- Sets the shell for compatibility


--___________________________
-- WRAPPING:
	opt('w', 'wrap', true)	-- Enable line wrapping
	opt('w', 'linebreak', true)	-- Enable line breaks at whitespace instead of the middle of words

--___________________________
-- CURSOR:
	opt('o', 'mouse', 'nv')	-- Enable moving the cursor with the mouse while on normal and visual mode
	opt('o', 'scrolloff', 7)	-- Always keep at least 7 lines above and below the cursor


--___________________________
-- WINDOW SPLITTING:
	-- Enable opening new buffers in a more sensible way
	opt('o', 'splitright', true)
	opt('o', 'splitbelow', true)


--___________________________
-- SEARCHING:
	opt('o', 'hlsearch', true)	-- Enable search highlighting
	opt('o', 'incsearch', true)	-- Show results for search matches as you type
	opt('o', 'ignorecase', true)	-- Ignore casing while searching
	opt('o', 'smartcase', true)	-- Overrides ignorecase if the pattern contains any upper case characters


--___________________________
-- INDENTATION:
	opt('b', 'expandtab', false)	-- Use tabs for indentation
	opt('b', 'smartindent', true)	-- Enable autoindenting when starting a new line
	opt('o', 'shiftround', true)	-- Enable rounding to nearest multiple of shiftwidth when using '>>' and '<<'

	-- Set tab size to 4
	opt('b', 'tabstop', 4)
	opt('b', 'shiftwidth', 4)

	-- Display whitespace
	opt('w', 'list', true)
	opt('o', 'listchars', "tab: ")


--___________________________
-- BACKUP:
	-- Always backup while saving a file, but don't keep backup around
	opt('o', 'writebackup', true)
	opt('o', 'backup', false)

--___________________________
-- PROVIDERS:
-- Disable unused providers and point to correct python3 executable
	vim.g.python3_host_prog = "/usr/bin/python3"
	vim.g.loaded_python_provider = 0
	vim.g.loaded_ruby_provider = 0
	vim.g.loaded_perl_provider = 0
	vim.g.loaded_node_provider = 0

require('appearance')
