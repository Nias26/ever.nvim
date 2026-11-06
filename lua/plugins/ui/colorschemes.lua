return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    build = false,
    priority = 1000,
    lazy = false,
    config = function()
      vim.opt.background = "dark"
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      overrides = function(colors)
        local theme = colors.theme
        return {
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
        }
      end,
    },
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, {
        -- Statusbar
        "FoldColumn",
        "CursorColumn",
        "CursorLineSign",
        -- Window Separator
        "WinSeparator",
        -- Folds
        "Folded",
        "UfoFoldedBg",
        -- Winbar
        "WinBar",
        "WinBarNC",
        -- Floating Windows
        "NormalFloat",
        -- NeoTree
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "NeoTreeEndOfBuffer",
        -- Lsp CodeLens
        "LspCodeLens",
        -- nvim-bqf
        "BqfPreviewBorder",
        -- Which-key
        "WhichKeyBorder",
      })

      -- Exclude groups
      require("transparent").setup({
        exclude_groups = {
          -- Blink
          "BlinkCmpMenu",
          "BlinkCmpMenuBorder",
          "BlinkCmpMenuSelection",
          "BlinkCmpSignatureHelp",
          "BlinkCmpSignatureHelpBorder",
          "BlinkCmpDoc",
          "BlinkCmpDocBorder",
          "BlinkCmpDoc",
        },
      })
    end,
  },
}
