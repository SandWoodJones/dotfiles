vim.g.mkdp_page_title = '「${name}」- Markdown Preview'
vim.g.mkdp_highlight_css = vim.fn.stdpath('config') .. '/lua/plugins/markdown-preview/markdown-preview-highlight.css'

Opt('o', 'updatetime', 100) -- autoupdates the preview

BMap(0, 'n', '<Leader>tmp', ':MarkdownPreviewToggle<CR>')
require('whichkey_setup').register_keymap('leader', {t = {m = {p = 'markdown preview'}}}) -- Add keybind to whichkey

