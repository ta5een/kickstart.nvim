--- A Neovim plugin for writing and navigating Obsidian vaults, written in Lua.
--- https://github.com/epwalsh/obsidian.nvim?tab=readme-ov-file
--- @type LazySpec
return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter',
  },
  ---@type obsidian.config.ClientOpts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    workspaces = {
      {
        name = '24AUT REAL-TIME OPERATING SYSTEMS',
        path = '~/Library/CloudStorage/OneDrive-UTS/_SUBJECTS/24AUT REAL-TIME OPERATING SYSTEMS',
      },
    },
  },
}
