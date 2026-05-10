return {
  'selimacerbas/live-server.nvim',
  keys = {
    {
      '<leader>ll',
      '<cmd>LiveServerStart<cr>',
      desc = 'Start live server',
    },
  },
  opts = {
    default_port = 8000,
    open_on_start = true,
    notify = false,
    notify_on_reload = false,

    live_reload = {
      enabled = true,
      inject_script = true,
      debounce = 120,
      css_inject = true,
    },

    directory_listing = {
      enabled = true,
      show_hidden = false,
    },
  },
}
