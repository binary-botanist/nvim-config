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

    -- Format on save
    format_on_save = function(bufnr)
      return {
        timeout_ms = 2000,
        lsp_fallback = true, -- if no conform formatter is configured, fall back to LSP
      }
    end,
  },
}

