return {
  'ibhagwan/fzf-lua',
  dependencies = {
    { 'nvim-mini/mini.icons', opts = {} },
  },
  config = function()
    local fzf = require('fzf-lua')
    local map = vim.keymap.set

    fzf.setup({
      winopts = {
        preview = {
          scrollbar = false,
        },
      },
    })
    fzf.register_ui_select()

    map('n', '<leader>ff', fzf.files, { desc = 'Find files' })
    map('n', '<leader>fg', fzf.live_grep, { desc = 'Live grep' })
    map('n', '<leader>fo', fzf.oldfiles, { desc = 'Recent files' })

    map('n', '<leader>fh', fzf.help_tags, { desc = 'Help' })
    map('n', '<leader>fk', fzf.keymaps, { desc = 'Keymaps' })
    map('n', '<leader>fc', fzf.commands, { desc = 'Commands' })

    map('n', '<leader>gs', fzf.git_status, { desc = 'Git status' })
    map('n', '<leader>gb', fzf.git_branches, { desc = 'Git branches' })
    map('n', '<leader>gc', fzf.git_commits, { desc = 'Git commits' })

    map('n', '<leader><leader>', fzf.resume, { desc = 'Resume picker' })
  end,
}
