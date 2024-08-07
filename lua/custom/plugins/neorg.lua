--- Modernity meets insane extensibility. The future of organizing your life in Neovim.
--- https://github.com/nvim-neorg/neorg
--- @type LazySpec
return {
  'nvim-neorg/neorg',
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = '^8.5.0',
  dependencies = {
    {
      'vhyrro/luarocks.nvim',
      priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
      config = true,
    },
    {
      'nvim-neorg/neorg-telescope',
      version = '^1.2.0',
    },
  },
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.completion'] = {
          config = { engine = 'nvim-cmp' },
        },
        ['core.concealer'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              kb = '~/Documents/KB',
            },
            default_workspace = 'kb',
          },
        },
        ['core.dirman.utils'] = {},
        ['core.integrations.telescope'] = {},
        ['core.integrations.treesitter'] = {},
        ['core.summary'] = {},
      },
    }
  end,
}
