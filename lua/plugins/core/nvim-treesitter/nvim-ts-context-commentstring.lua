return {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require('nvim-treesitter.configs').setup {
        -- Install the parsers for the languages you want to comment in
        -- Here are the supported languages:
        ensure_installed = {
            'astro', 'css', 'glimmer', 'graphql', 'html', 'javascript',
            'lua', 'nix', 'php', 'python', 'scss', 'svelte', 'tsx', 'twig',
            'typescript', 'vim', 'vue',
        },
        context_commentstring = {
            enable = true,
        },
      }
    end
}
