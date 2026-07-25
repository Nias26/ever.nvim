return {
  "stevearc/conform.nvim",
  cmd = "ConformInfo",
  keys = { {
    "cf",
    function()
      require("conform").format({
        async = true,
      })
    end,
    desc = "Format code",
  } },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  opts = {
    log_level = vim.log.levels.DEBUG,
    formatters = { clang_format = { append_args = { "--style={BasedOnStyle:LLVM}" } } },
    formatters_by_ft = {
      lua = {
        "stylua",
      },
      cpp = { "clang-format" },
      c = { "clang-format" },
      python = {
        "black",
      },
      rust = { "rustfmt" },
      typescript = { "prettierd" },
      javascript = { "prettierd" },
      svelte = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      html = { "prettierd" },
      markdown = { "prettierd" },
      yaml = { "prettierd" },
      ["_"] = { "trim_whitespace" },
    },
  },
}
