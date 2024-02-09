return {
  "epwalsh/pomo.nvim",
  version = "*", -- Recommended, use latest release instead of latest commit
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat" },
  dependencies = {
    -- Optional, but highly recommended if you want to use the "Default" timer
    "rcarriga/nvim-notify",
  },
  opts = {
    notifiers = {
      {
        name = "Default",
        opts = {
          sticky = false,
        },
      },
      { name = "System" },
    },
    timers = {
      Break = {
        { name = "System" },
      },
    },
  },
}
