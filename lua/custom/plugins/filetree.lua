--- Neovim plugin to manage the file system and other tree like structures.
--- https://github.com/nvim-neo-tree/neo-tree.nvim
--- @type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    -- Automatically clean up broken neo-tree buffers saved in sessions
    auto_clean_after_session_restore = true,
    filesystem = {
      filtered_items = {
        -- When true, they will just be displayed differently than normal items
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          '.git',
          'node_modules',
        },
        -- Remains visible even if other settings would normally hide it
        always_show = {
          '.gitignore',
        },
        -- Remains hidden even if visible is toggled to true
        -- This overrides `always_show`
        never_show = {
          '.DS_Store',
          'Thumbs.db',
        },
      },
      follow_current_file = {
        -- This will find and focus the file in the active buffer every time
        -- the current file is changed while the tree is open
        enabled = true,
        -- Closes auto-expanded dirs, such as with `:Neotree reveal`
        leave_dirs_open = false,
      },
    },
    window = {
      position = 'right',
    },
  },
  keys = {
    {
      '<leader>\\f',
      function()
        require('neo-tree.command').execute {
          toggle = true,
          source = 'filesystem',
          position = 'right',
        }
      end,
      desc = 'Toggle [\\]Neotree [F]ilesystem',
    },
    {
      '<leader>\\b',
      function()
        require('neo-tree.command').execute {
          toggle = true,
          source = 'buffers',
          position = 'right',
        }
      end,
      desc = 'Toggle [\\]Neotree [B]uffers',
    },
    {
      '<leader>\\g',
      function()
        require('neo-tree.command').execute {
          toggle = true,
          source = 'git_status',
          position = 'right',
        }
      end,
      desc = 'Toggle [\\]Neotree [G]it status',
    },
  },
}
