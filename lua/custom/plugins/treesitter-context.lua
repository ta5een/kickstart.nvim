--- Show code context (lightweight alternative to context.vim)
--- https://github.com/nvim-treesitter/nvim-treesitter-context
--- @type LazySpec
return {
  'nvim-treesitter/nvim-treesitter-context',
  --- @type TSContext.UserConfig
  opts = {
    multiline_threshold = 1,
    mode = 'topline',
  },
  init = function()
    vim.cmd.hi 'TreesitterContextBottom gui=underline guisp=Grey'
    vim.cmd.hi 'TreesitterContextLineNumberBottom gui=underline guisp=Grey'
  end,
}
