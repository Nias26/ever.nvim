return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      renderer = {
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "󰏪",
              deleted = "-",
              untracked = "󱈸",
              ignored = "",
            },
          },
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
      -- sync_root_with_cwd = true,
      respect_buf_cwd = false,
      update_focused_file = {
        enable = true,
        -- update_root = true,
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "<M-CR>", api.tree.change_root_to_node, opts('Set Root'))
        vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts('Set Root to Parent'))
      end,
    })

  end,
}
