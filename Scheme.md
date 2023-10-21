# Scheme

## lazy

-------

### Ordine in caso sensitivo

1. plugins.core
2. plugins.core.treesitter
3. plugins.core.lsp
    - mason > Language, linter, dap manager
        - mason-lspconfig > Manager attached to lspconfig
        - mason-null-ls > Manager attached to null-ls
    - lspconfig > Configure LSP
    - null-ls > Format, diagnostic
4. plugins.core.cmp
    - cmp > Completition
    - lspkind > Completition Icons
    - ...
5. plugins.core.telescope
6. plugins.core.dap

-------

## Config

### LSP

1. Client - "file-language-server" } mason-lspconfig
2. Client - null-ls                } mason-null-ls

[x] - Completato

-------

### cmp

1. nvim-lsp - "file-language-server"
2. nvim-lsp - null-ls

[] - Completato
