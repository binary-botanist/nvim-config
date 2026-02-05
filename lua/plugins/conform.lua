return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      html = { "djlint" },
      htmldjango = { "djlint" },
      jinja = { "djlint" },
      jinja2 = { "djlint" },
    },
  },
}

