local api = vim.api

local function augroup(name)
  return api.nvim_create_augroup('User_' .. name, { clear = true })
end

-- Highlight yanked text
api.nvim_create_autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  desc = 'Highlight yanked text',
  callback = function()
    vim.hl.on_yank({
      higroup = 'IncSearch',
      timeout = 120,
    })
  end,
})

-- Restore cursor position
api.nvim_create_autocmd('BufReadPost', {
  group = augroup('restore_cursor'),
  desc = 'Restore cursor position',
  callback = function(event)
    local exclude = {
      gitcommit = true,
      gitrebase = true,
    }

    if exclude[vim.bo[event.buf].filetype] then
      return
    end

    local mark = api.nvim_buf_get_mark(event.buf, '"')
    local line_count = api.nvim_buf_line_count(event.buf)

    if mark[1] > 0 and mark[1] <= line_count then
      pcall(api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Reload files changed outside Neovim
api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = augroup('checktime'),
  desc = 'Reload changed files',
  command = 'checktime',
})

-- Close special buffers with q
api.nvim_create_autocmd('FileType', {
  group = augroup('close_with_q'),
  desc = 'Close special buffers with q',
  pattern = {
    'checkhealth',
    'help',
    'lspinfo',
    'man',
    'qf',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false

    vim.keymap.set('n', 'q', '<cmd>close<cr>', {
      buffer = event.buf,
      silent = true,
      nowait = true,
      desc = 'Close buffer',
    })
  end,
})

-- Terminal buffer settings
api.nvim_create_autocmd('TermOpen', {
  group = augroup('terminal'),
  desc = 'Terminal settings',
  callback = function(event)
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {
      buffer = event.buf,
      silent = true,
      desc = 'Exit terminal mode',
    })
    vim.cmd.startinsert()
  end,
})
