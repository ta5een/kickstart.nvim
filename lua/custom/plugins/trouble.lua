--- 🚦 A pretty diagnostics, references, telescope results, quickfix and
--- location list to help you solve all the trouble your code is causing.
---  https://github.com/folke/trouble.nvim
--- @type LazySpec
return {
  'folke/trouble.nvim',
  branch = 'dev',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  ---@type trouble.Config
  opts = {},
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Trouble: Toggle Diagnostics',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Trouble: Toggle Buffer Diagnostics',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Trouble: Toggle Symbols',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'Trouble: Toggle LSP',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Trouble: Toggle Location List',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Trouble: Toggle Quickfix List',
    },
  },
}
