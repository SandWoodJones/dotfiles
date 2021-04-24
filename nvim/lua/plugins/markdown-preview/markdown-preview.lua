vim.g.mkdp_page_title = '「${name}」- Markdown Preview'
vim.g.mkdp_highlight_css = vim.fn.stdpath('config') .. '/lua/plugins/markdown-preview/markdown-preview-highlight.css'

Opt('o', 'updatetime', 100) -- autoupdates the preview
BMap(0, 'n', '<Leader>tmp', ':MarkdownPreviewToggle<CR>')

