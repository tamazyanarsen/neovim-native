local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip', -- Snippets plugin
  require('plugins.nvim-treesitter'),
  {'nvim-telescope/telescope.nvim', branch='0.1.x', dependencies = { 'nvim-lua/plenary.nvim' }},
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  'dense-analysis/ale',
}, {})

require('plugins.nvim')
require('plugins.telescope')
require('plugins.tree')
require('plugins.catppuccin')
require('plugins.ale')

vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
  group = vim.api.nvim_create_augroup("code_action_sign", { clear = true }),
  callback = function()
    require('code-actions').code_action_listener()
  end,
})