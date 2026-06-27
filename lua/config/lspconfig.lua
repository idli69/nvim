vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    severity_sort = true,

    float = {
        border = "rounded",
        source = "if_many",
    },

    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
        },
    },
})

local group = vim.api.nvim_create_augroup("UserLsp", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = group,

    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        local buf = ev.buf

        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = buf,
                silent = true,
                desc = desc,
            })
        end

        map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
        map("n", "gr", vim.lsp.buf.references, "References")
        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "J", vim.diagnostic.open_float, "Diagnostics")
        map("n", "ga", vim.lsp.buf.code_action, "Code Action")
        map("n", "gn", vim.lsp.buf.rename, "Rename")

        -- disable inlay hints by default
        if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(false, { bufnr = buf })
        end

        -- Document Colors (0.12)
        if client:supports_method("textDocument/documentColor") then
            vim.lsp.document_color.enable(true, {
                bufnr = buf,
            }, {
                    style = "virtual",
                })
        end
    end,
})
