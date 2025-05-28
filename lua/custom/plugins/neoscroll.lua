--- Smooth scrolling neovim plugin written in lua
--- @type LazySpec
return {
  'karb94/neoscroll.nvim',
  opts = {
    duration_multiplier = 0.3,
    easing = 'quartic',
  },
}
