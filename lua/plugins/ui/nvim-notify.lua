return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    render = function(bufnr, notif, highlights, config)
      local notify_renderers = require("notify.render")
      local minimal_titles = { "", "Messages", "Notify" }
      if vim.list_contains(minimal_titles, notif.title[1]) then
        highlights.body = "Notify" .. notif.level .. "Title"
        notif.message[1] = " " .. notif.icon .. "\t" .. notif.message[1]

        return notify_renderers.minimal(bufnr, notif, highlights, config)
      end

      return notify_renderers.compact(bufnr, notif, highlights, config)
    end,
    stages = "static",
    top_down = true,
  },
  config = function(_, opts)
    require("notify").setup(opts)

    vim.api.nvim_set_hl(0, "NotifyERRORBorder", { link = "DiagnosticError" })
    vim.api.nvim_set_hl(0, "NotifyWARNBorder",  { link = "DiagnosticWarn" })
    vim.api.nvim_set_hl(0, "NotifyINFOBorder",  { link = "DiagnosticInfo" })
    vim.api.nvim_set_hl(0, "NotifyHINTBorder",  { link = "DiagnosticHint" })
    vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { link = "Comment" })
    vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { link = "Constant" })
  end,
}
