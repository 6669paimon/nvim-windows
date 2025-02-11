return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    require("conform").setup({

      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },

      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        -- javascript = { "prettierd" },
        -- typescript = { "prettierd" },
        -- javascriptreact = { "prettierd" },
        -- typescriptreact = { "prettierd" },
        css = { "prettierd" },
        -- html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        -- ["*"] = { 'trim_whitespace' },
      },

      formatters = {
        injected = { options = { ignore_errors = true } },
      },

      format_on_save = {
        pattern = "*.lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs,*.py",
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
      },
    })
  end,
}
