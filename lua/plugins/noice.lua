return {
  "folke/noice.nvim",
  lazy = false,
  opts = {
    cmdline = {
      view = "cmdline_popup",
      opts = {
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          min_width = 60,
          width = "auto",
          height = "auto",
        },
      },
    },
    views = {
      cmdline_popup = {
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
    },
  },
}