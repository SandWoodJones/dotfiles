vim.g.mkdp_page_title = '「${name}」- Markdown Preview'
vim.g.mkdp_highlight_css = vim.fn.stdpath('config') .. '/lua/plugins/markdown-preview-highlight.css'

-- Open the preview in a different firefox profile, so that it doesn't override the main profile's previous session.
vim.g.mkdp_browser = 'chromium'

Opt('o', 'updatetime', 100) -- autoupdates the preview
BMap(0, 'n', '<Leader>tmp', ':MarkdownPreviewToggle<CR>')

