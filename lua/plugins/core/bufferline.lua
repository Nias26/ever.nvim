return {
    "akinsho/bufferline.nvim",
    tag = "v4.3.0",
    dependencies ={ "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup{
            options = {
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                },
                separator_style = 'thin',
                diagnostics = "nvim_lsp",
                diagnostic_indicator = function(count, level, diagnostic_dict, context)
                    if context.buffer:current() then
                        return ''
                    end

                    return ''
                end
            }
        }
    end
}
