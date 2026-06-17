vim.lsp.enable({
    "lua_ls",
    "ts_ls",
})
vim.diagnostic.config({ virtual_text = false })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- Ensure the client supports completion capabilities
        if client and client:supports_method('textDocument/completion') then
            -- Enable Neovim's modern built-in completion engine for the buffer
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})
