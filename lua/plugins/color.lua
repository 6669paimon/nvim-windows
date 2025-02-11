return {
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  config = function()
    -- Default options
    require('github-theme').setup({
      options = {
        -- Compiled file's destination location
        -- compile_path = vim.fn.stdpath('cache') .. '/github-theme',
        -- compile_file_suffix = '_compiled', -- Compiled file suffix
        -- hide_end_of_buffer = true,         -- Hide the '~' character at the end of the buffer for a cleaner look
        -- hide_nc_statusline = true,         -- Override the underline style for non-active statuslines
        transparent = true,      -- Disable setting background
        terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        -- dim_inactive = false,              -- Non focused panes set to alternative background
        -- module_default = true,             -- Default enable value for modules
        styles = {             -- Style to be applied to different syntax groups
          comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
          -- functions = 'italic',
          --   keywords = 'NONE',
          --   variables = 'NONE',
          -- conditionals = 'italic',
          --   constants = 'NONE',
          --   numbers = 'NONE',
          --   operators = 'NONE',
          --   strings = 'NONE',
          --   types = 'NONE',
        },
        -- inverse = { -- Inverse highlight for different types
        --   match_paren = false,
        --   visual = false,
        --   search = false,
        -- },
        -- darken = { -- Darken floating windows and sidebar-like windows
        --   floats = false,
        --   sidebars = {
        --     enabled = true,
        --     list = {}, -- Apply dark background to specific windows
        --   },
        -- },
        -- modules = { -- List of various plugins and additional options
        --   -- ...
        -- },
      },
      -- palettes = {},
      specs = {
        all = {
          syntax = {
            func = "#66def9",
            keyword = "#35afd4",
            comment = "#3c6378",
            type = "#2CA198",
            string = "#21d1c0",
            variable = "#92c4de",
            -- param = "#8DF2E8"
          },
        }
      },
      groups = {
        all = {
          NormalFloat        = { fg = "#a5c2cc", bg = "#001419" }, -- Normal text in floating windows.
          FloatBorder        = { fg = "#3483ba" },                 -- TODO
          CmpBorder          = { fg = "#3483ba" },
          VertSplit          = { fg = "#3483ba" },                 -- the column separating vertically split windows
          WinSeparator       = { fg = "#3483ba" },                 -- (nvim >= 0.10) the column separating vertically split windows
          Pmenu              = { fg = "#3c6378", bg = "#001419" }, -- Popup menu: normal item.
          PmenuSel           = { fg = "#48AEF5", bg = "#0d3440" }, -- Popup menu: selected item.
          PmenuThumb         = { bg = "#0d3440" },                 -- Popup menu: Thumb of the scrollbar.
          Visual             = { bg = '#1A6497', fg = '#EEE8D5' }, -- Visual mode selection
          Search             = { fg = "#54b9ff", bg = "#001419" },
          IncSearch          = { bg = "#54b9ff", fg = '#001419' }, -- 'incsearch' highlighting; also used for the text replaced with ':s///c'
          TabLineSel         = { fg = "#92c4de", bg = "#48AEF5" }, -- tab pages line, active tab page label
          LineNr             = { fg = "#3c6378" },                 -- Line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.
          ColorColumn        = { bg = "#06303B" },                 -- used for the columns set with 'colorcolumn'
          CursorLine         = { bg = "#00131A" },
          -- CursorLine         = { bg = "#06303B" },
          -- ColorColumn        = { bg = "#052A33" },                 -- used for the columns set with 'colorcolumn'
          -- CursorLine         = { bg = "#052A33" },
          -- ColorColumn        = { bg = "#1d323d" },                 -- used for the columns set with 'colorcolumn'
          -- CursorLine         = { bg = "#1d323d" },
          CursorLineNr       = { fg = "#48AEF5", bg = "#00212B" }, -- Line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.

          TelescopeSelection = { fg = "#48AEF5", bg = "#0d3440" },
          TelescopeMatching  = { fg = "#D75F5F" },
          -- TelescopeMatching  = { fg = "#fd5e3a" },
          TelescopeBorder    = { fg = '#3483ba' },
          -- TelescopePromtNormal = {},

          InclineNormal      = { fg = "#48AEF5", bg = "#0d3440" },
          InclineNA          = { fg = "#3c6378", bg = "#00212B" }, -- Normal text in floating windows.

          NoiceMini          = { fg = "#48AEF5", bg = "#0d3440" },
          -- NoiceMini          = { fg = "#48AEF5", bg = "#001419" },

          NotifyINFOBorder   = { fg = "#48AEF5" },
          NotifyINFOIcon     = { fg = "#48AEF5" },
          NotifyINFOTitle    = { fg = "#48AEF5" },

          -- NotifyWARNBorder   = { fg = "#f69d50" },
          -- NotifyWARNIcon     = { fg = "#f69d50" },
          -- NotifyWARNTitle    = { fg = "#f69d50" },

          -- NotifyERRORBorder  = { fg = "#fd5e3a" },
          -- NotifyERRORIcon    = { fg = "#fd5e3a" },
          -- NotifyERRORTitle   = { fg = "#fd5e3a" },

          HopUnmatched       = { fg = "#3c6378" },
          -- HopNextKey         = { fg = "#ff007c" }, -- default
          -- HopNextKey1        = { fg = "#00dfff" }, -- default
          HopNextKey2        = { fg = "#34abd9" },
          -- HopNextKey2        = { fg = "#2b8db3" }, -- default


        }
      },
    })

    -- setup must be called before loading
    vim.cmd('colorscheme github_dark_dimmed')
    vim.api.nvim_set_hl(0, "@constructor", { link = "Type" })
    vim.api.nvim_set_hl(0, "@type.builtin", { link = "keyword" })
  end,
}
