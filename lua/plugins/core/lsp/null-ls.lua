return {
    "nvimtools/none-ls.nvim",
    enabled = false,
    config = function()
        require("null-ls").setup()

        -- Avoid LSP Servers conflict
        local lsp_formatting = function(bufnr)
            vim.lsp.buf.format({
                filter = function(client)
                    -- apply whatever logic you want (in this example, we'll only use null-ls)
                    return client.name == "null-ls"
                end,
                bufnr = bufnr,
            })
        end

        -- if you want to set up formatting on save, you can use this as a callback
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local callback = function()
            vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(client)
                    return client.name == "null-ls"
                end
            })
        end

        -- add to your shared on_attach callback
        local on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        lsp_formatting(bufnr)
                    end,
                })
            end
        end

        -- Options
        local defaults = {
            diagnostics_format = "[#{c}] #m (#{s})",
            notify_format = "[null-ls] %s",
            update_in_insert = true,
        }
    end
}
