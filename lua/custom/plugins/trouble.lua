--- 🚦 A pretty diagnostics, references, telescope results, quickfix and
--- location list to help you solve all the trouble your code is causing.
--- https://github.com/folke/trouble.nvim
--- @type LazySpec
return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {
      '<leader>xx',
      function()
        require('trouble').toggle()
      end,
      mode = 'n',
      desc = 'Trouble: toggle window',
    },
    {
      '<leader>xw',
      function()
        require('trouble').toggle 'workspace_diagnostics'
      end,
      mode = 'n',
      desc = 'Trouble: toggle [W]orkspace diagnostics',
    },
    {
      '<leader>xd',
      function()
        require('trouble').toggle 'document_diagnostics'
      end,
      mode = 'n',
      desc = 'Trouble: toggle [D]ocument diagnostics',
    },
    {
      '<leader>xq',
      function()
        require('trouble').toggle 'quickfix'
      end,
      mode = 'n',
      desc = 'Trouble: toggle [Q]uickfix',
    },
    {
      '<leader>xl',
      function()
        require('trouble').toggle 'loclist'
      end,
      mode = 'n',
      desc = 'Trouble: toggle [L]oclist',
    },
    {
      'gR',
      function()
        require('trouble').toggle 'lsp_references'
      end,
      mode = 'n',
      desc = 'Trouble: toggle LSP references',
    },
  },
}
