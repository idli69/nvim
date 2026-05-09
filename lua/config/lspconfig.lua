local group = vim.api.nvim_create_augroup('LspConfig', { clear = true })

local function map(bufnr, mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, {
    buffer = bufnr,
    silent = true,
    desc = 'LSP: ' .. desc,
  })
end

local function on_attach(client, bufnr)
  local fzf = require('fzf-lua')

  -- Jump
  map(bufnr, 'n', 'gd', vim.lsp.buf.definition, 'Definition')
  map(bufnr, 'n', 'gi', vim.lsp.buf.implementation, 'Implementation')
  map(bufnr, 'n', 'gt', vim.lsp.buf.type_definition, 'Type definition')
  map(bufnr, 'n', 'gr', fzf.lsp_references, 'References')

  -- Pickers
  map(bufnr, 'n', '<leader>fs', fzf.lsp_live_workspace_symbols, 'Workspace symbols')
  map(bufnr, 'n', '<leader>fd', fzf.diagnostics_document, 'Document diagnostics')
  map(bufnr, 'n', '<leader>fw', fzf.diagnostics_workspace, 'Workspace diagnostics')
  map(bufnr, { 'n', 'x' }, '<leader>ca', fzf.lsp_code_actions, 'Code action')

  -- Rename
  map(bufnr, 'n', '<leader>cn', vim.lsp.buf.rename, 'Rename')

  -- Info
  map(bufnr, 'n', 'K', vim.lsp.buf.hover, 'Hover')
  map(bufnr, 'n', 'J', vim.diagnostic.open_float, 'Line diagnostic')
  map(bufnr, 'n', '<M-s>', vim.lsp.buf.signature_help, 'Signature help')

  -- Diagnostics
  map(bufnr, 'n', '[d', function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, 'Previous diagnostic')

  map(bufnr, 'n', ']d', function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, 'Next diagnostic')

  -- Inlay hints off by default
  if client:supports_method('textDocument/inlayHint') then
    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })

    map(bufnr, 'n', '<leader>th', function()
      local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
      vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
    end, 'Toggle inlay hints')
  end
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client then
      on_attach(client, ev.buf)
    end
  end,
})
