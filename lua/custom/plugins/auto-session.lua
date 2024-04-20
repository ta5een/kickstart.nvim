--- A small automated session manager for Neovim
--- https://github.com/rmagatti/auto-session
--- @type LazySpec
return {
  'rmagatti/auto-session',
  version = '^2.0.0',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('auto-session').setup {
      -- Suppress session creation/restoration for the following directories
      auto_session_suppress_dirs = {
        '/',
        '~/',
        '~/Desktop',
        '~/Documents',
        '~/Downloads',
        '~/Projects',
      },
    }

    require('telescope').load_extension 'session-lens'

    -- Set mapping for searching a session.
    -- ⚠️ This will only work if Telescope.nvim is installed
    vim.keymap.set('n', '<leader>sl', require('auto-session.session-lens').search_session, {
      noremap = true,
    })
  end,
}
