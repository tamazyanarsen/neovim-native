require("typescript-tools").setup {}

vim.keymap.set('n', '<space>or', '<cmd>TSToolsOrganizeImports<cr>', opts)
vim.keymap.set('n', '<space>mi', '<cmd>TSToolsAddMissingImports<cr>', opts)

