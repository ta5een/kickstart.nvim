--- Debug Adapter Protocol client implementation for Neovim
--- https://github.com/mfussenegger/nvim-dap
--- @type LazySpec
return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Visualize debugging sessions in neovim
    'igorlfs/nvim-dap-view',
    'theHamsta/nvim-dap-virtual-text',
    'Weissle/persistent-breakpoints.nvim',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    -- 'leoluz/nvim-dap-go',
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<leader>dc',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<leader>di',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<leader>do',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<leader>dO',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>dB',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint with Condition',
    },
    {
      '<leader>dq',
      function()
        require('dap').terminate()
      end,
      desc = 'Debug: Terminate',
    },
    {
      '<leader>dd',
      function()
        require('dap-view').toggle()
      end,
      desc = 'Debug: Toggle DAP View',
    },
  },
  config = function()
    local dap = require 'dap'
    -- local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'js-debug-adapter',
      },
    }

    require('persistent-breakpoints').setup {
      load_breakpoints_even = { 'BufReadPost' },
    }

    require('nvim-dap-virtual-text').setup()

    -- -- TODO: See if this is possible to set up with nvim-dap-view
    -- dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    -- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    -- dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- -- Install golang specific config
    -- require('dap-go').setup {
    --   delve = {
    --     -- On Windows delve must be run attached or it crashes.
    --     -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    --     detached = vim.fn.has 'win32' == 0,
    --   },
    -- }

    dap.adapters['pwa-node'] = {
      type = 'server',
      host = '::1',
      port = '${port}',
      executable = {
        command = 'js-debug-adapter',
        args = {
          '${port}',
        },
      },
    }

    local js_dap_config = {
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        cwd = '${workspaceFolder}',
      },
      {
        type = 'pwa-node',
        request = 'attach',
        name = 'Attach to Node app',
        address = 'localhost',
        port = 9229,
        cwd = '${workspaceFolder}',
        restart = true,
      },
    }
    dap.configurations['javascript'] = js_dap_config
    dap.configurations['typescript'] = js_dap_config
  end,
}
