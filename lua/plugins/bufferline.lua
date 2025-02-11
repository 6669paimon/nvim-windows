return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    -- { "J", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    -- { "K", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
  },
  opts = {
    options = {
      mode = "tabs",
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = { '|', '' },
      always_show_bufferline = false,

      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true
        }
      },
    },

    -- highlights = {
    -- separator = {
    --   fg = '#48AEF5',
    -- },
    -- separator_selected = {
    --   fg = '#48AEF5',
    -- },
    -- }
  },
}
