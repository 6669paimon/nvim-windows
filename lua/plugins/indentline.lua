return {
  "lukas-reineke/indent-blankline.nvim",
  name = "indent_blankline",
  even = { "BufReadPost", "BufNewfile" },
  config = function()
    local hl_NIbl = {
      "NormalIbl"
    }
    local hl_SIbl = {
      "ScopeIbl"
    }
    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "NormalIbl", { fg = "#283e4a" })
      -- vim.api.nvim_set_hl(0, "NormalIbl", { fg = "#1d323d" })
      vim.api.nvim_set_hl(0, "ScopeIbl", { fg = "#497891" })
      -- vim.api.nvim_set_hl(0, "ScopeIbl", { fg = "#205673" })
      -- vim.api.nvim_set_hl(0, "ScopeIbl", { fg = "#48AEF5" })
    end)
    require("ibl").setup({
      indent = {
        highlight = hl_NIbl,
        char = "│",
      },
      scope = {
        enabled = true,
        highlight = hl_SIbl,
        -- show_start = false,
        show_end = false,
      },

    })
  end,
}
