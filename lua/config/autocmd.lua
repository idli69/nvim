local api = vim.api

local function augroup(name)
  return api.nvim_create_augroup("User_" .. name, { clear = true })
end

-- CHECK IF FILE EXISTS
local function file_exists(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type or false
end

-- HIGHLIGHT YANK
api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  desc = "Highlight on yank",
  callback = function()
    vim.hl.on_yank({
      higroup = "IncSearch",
      timeout = 120,
    })
  end,
})

-- RESTORE CURSOR POSITION
api.nvim_create_autocmd("BufReadPost", {
  group = augroup("restore_cursor"),
  desc = "Restore cursor position",
  callback = function(event)
    local exclude = {
      gitcommit = true,
      gitrebase = true,
    }

    local buf = event.buf
    local ft = vim.bo[buf].filetype

    if exclude[ft] then
      return
    end

    local mark = api.nvim_buf_get_mark(buf, '"')
    local line_count = api.nvim_buf_line_count(buf)

    if mark[1] > 0 and mark[1] <= line_count then
      pcall(api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- REMOVE TRAILING WHITESPACE
api.nvim_create_autocmd("BufWritePre", {
  group = augroup("trim_whitespace"),
  desc = "Trim trailing whitespace",
  callback = function()
    local excluded = {
      markdown = true,
    }

    local ft = vim.bo.filetype

    if excluded[ft] then
      return
    end

    local view = vim.fn.winsaveview()

    pcall(function()
      vim.cmd([[%s/\s\+$//e]])
    end)

    vim.fn.winrestview(view)
  end,
})

-- AUTO RELOAD FILES CHANGED OUTSIDE NEOVIM
api.nvim_create_autocmd({
  "FocusGained",
  "TermClose",
  "TermLeave",
}, {
  group = augroup("auto_reload"),
  desc = "Reload file if changed outside nvim",
  command = "checktime",
})

-- CLOSE SOME FILETYPES WITH q
api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  desc = "Close special buffers with q",
  pattern = {
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", {
      buffer = event.buf,
      silent = true,
      nowait = true,
    })
  end,
})

-- RESIZE SPLITS WHEN WINDOW RESIZED
api.nvim_create_autocmd("VimResized", {
  group = augroup("resize_splits"),
  desc = "Resize splits if window got resized",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- DISABLE LINE NUMBERS IN TERMINAL
api.nvim_create_autocmd("TermOpen", {
  group = augroup("terminal_settings"),
  desc = "Terminal local settings",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.cmd("startinsert")
  end,
})
