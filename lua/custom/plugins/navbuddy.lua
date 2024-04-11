--- A simple popup display that provides breadcrumbs feature using LSP server
--- https://github.com/SmiteshP/nvim-navbuddy
--- @type LazySpec
return {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
    'numToStr/Comment.nvim', -- Optional
    'nvim-telescope/telescope.nvim', -- Optional
  },
  opts = {
    custom_hl_group = 'Visual',
    icons = {
      File = ' ',
      Module = ' ',
      Namespace = ' ',
      Package = ' ',
      Class = ' ',
      Method = ' ',
      Property = ' ',
      Field = ' ',
      Constructor = ' ',
      Enum = ' ',
      Interface = ' ',
      Function = ' ',
      Variable = ' ',
      Constant = ' ',
      String = ' ',
      Number = ' ',
      Boolean = ' ',
      Array = ' ',
      Object = ' ',
      Key = ' ',
      Null = '󰟢',
      EnumMember = ' ',
      Struct = ' ',
      Event = ' ',
      Operator = ' ',
      TypeParameter = ' ',
    },
  },
  keys = {
    {
      '<leader>n',
      function()
        require('nvim-navbuddy').open()
      end,
      desc = 'Open [N]avbuddy',
    },
  },
}
